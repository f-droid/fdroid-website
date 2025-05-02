#!/usr/bin/env python3

import json
import sys
import textwrap
from datetime import UTC, date, datetime, timedelta
from pathlib import Path

import requests

LOG_COMMIT_API = "https://gitlab.com/api/v4/projects/40377142/repository/commits"
LOG_RAW_URL = "https://gitlab.com/fdroid/f-droid.org-transparency-log/-/raw/"
OLD_INDEX_COMMIT = ""
RETRY = 3
CACHE = Path.cwd() / "twif_cache"


def dict_diff(source, target):
    """This is the function used to show diffs in index v2
    it can be found at https://gitlab.com/fdroid/fdroidserver/-/blob/master/fdroidserver/index.py#L477
    """
    if not isinstance(target, dict) or not isinstance(source, dict):
        return target

    result = {key: None for key in source if key not in target}

    for key, value in target.items():
        if key not in source:
            result[key] = value
        elif value != source[key]:
            result[key] = dict_diff(source[key], value)

    return result


class App:
    """Class to represent App/packagename body"""

    def __init__(self, package_name, current_index, past_index):
        self.package_name = package_name
        self.name = self._get_app_name(current_index, package_name, past_index)
        self.summary = self._get_app_summary(current_index, package_name, past_index)
        self.current_checksum = self._get_current_checksum(current_index, package_name)
        self.past_checksum = self._get_previous_checksum(past_index, package_name)
        self.previous_version_code = self._get_past_version_code(
            past_index, package_name
        )
        self.current_version_code = self._get_current_version_code(
            current_index, package_name
        )
        self.previous_version_name = self._get_past_version_name(
            past_index, package_name
        )
        self.current_version_name = self._get_current_version_name(
            current_index, package_name
        )
        self.app_status = self._get_app_status()

    def _get_app_name(self, current_index, package_name, past_index):
        try:
            app_name = current_index["packages"][package_name]["metadata"]["name"][
                "en-US"
            ]
        except KeyError:
            app_name = past_index["packages"][package_name]["metadata"]["name"]["en-US"]
        finally:
            return app_name

    def _get_app_summary(self, current_index, package_name, past_index):
        summary = (
            current_index["packages"]
            .get(package_name, {})
            .get("metadata", {})
            .get("summary", {})
        ) or (
            past_index["packages"]
            .get(package_name, {})
            .get("metadata", {})
            .get("summary", {})
        )
        en_summary = summary.get("en-US", "")
        if not en_summary:
            for locale in summary:
                if locale.startswith("en"):
                    en_summary = summary.get(locale)
                    break
        summary = en_summary.replace("\n", " ")
        return summary

    def _get_current_checksum(self, current_index, package_name):
        try:
            current_index["packages"][package_name]
        except KeyError:
            return None
        else:
            return list(current_index["packages"][package_name]["versions"].keys())[0]

    def _get_previous_checksum(self, past_index, package_name):
        try:
            past_index["packages"][package_name]
        except KeyError:
            return None
        else:
            return list(past_index["packages"][package_name]["versions"].keys())[0]

    def _get_past_version_code(self, past_index, package_name):
        if self.past_checksum is None:
            return None
        return past_index["packages"][package_name]["versions"][self.past_checksum][
            "manifest"
        ]["versionCode"]

    def _get_current_version_code(self, current_index, package_name):
        if self.current_checksum is None:
            return None
        return current_index["packages"][package_name]["versions"][
            self.current_checksum
        ]["manifest"]["versionCode"]

    def _get_current_version_name(self, current_index, package_name):
        if self.current_checksum is None:
            return None
        return current_index["packages"][package_name]["versions"][
            self.current_checksum
        ]["manifest"]["versionName"]

    def _get_past_version_name(self, past_index, package_name):
        if self.past_checksum is None:
            return None
        return past_index["packages"][package_name]["versions"][self.past_checksum][
            "manifest"
        ]["versionName"]

    def _get_app_status(self):
        if (
            self.current_version_code is not None
            and self.previous_version_code is not None
        ):
            if self.current_version_code > self.previous_version_code:
                return "updated"
            if self.previous_version_code > self.current_version_code:
                return "downgraded"
            if self.current_version_code == self.previous_version_code:
                return "no change"
        if self.current_version_code is None and self.previous_version_code is not None:
            return "removed"
        if self.previous_version_code is None and self.current_version_code is not None:
            return "new"


def markdown_escape(s):
    chars = "\\`*_{}[]<>()#+-.!|"
    for c in chars:
        s = s.replace(c, "\\" + c)
    return s


def generate_diffs_of_new_and_previous_indexes(old_index, new_index):
    previous_current_index_diff = dict_diff(old_index, new_index)
    if previous_current_index_diff:
        packages_list = list(previous_current_index_diff["packages"].keys())
        removed_apps_list = list()
        added_apps_list = list()

        # Get upgraded and downgraded apps
        list_of_downgraded_apps = list()
        list_of_upgraded_apps = list()

        for app in packages_list:
            app_body = App(app, new_index, old_index)
            if app_body.app_status == "updated":
                list_of_upgraded_apps.append(app_body)
            if app_body.app_status == "downgraded":
                list_of_downgraded_apps.append(app_body)
            if app_body.app_status == "removed":
                removed_apps_list.append(app_body)
            if app_body.app_status == "new":
                added_apps_list.append(app_body)
        return (
            added_apps_list,
            removed_apps_list,
            list_of_downgraded_apps,
            list_of_upgraded_apps,
        )
    else:
        print(
            "No diffs found. The current index matches the previous index",
            file=sys.stderr,
        )
        sys.exit()


def print_out_frontmatter():
    """Prints out YAML Frontmatter"""
    print(
        textwrap.dedent("""\
        ---
        layout: post
        title: "Enter-post-title-here"
        author: "Enter-your-name-here"
        ---
        """)
    )


def print_out_date_time_info_about_twif():
    """Prints out info on when TWIF was generated"""
    todays_date = date.today()
    day_and_date = todays_date.strftime("%A, %d %b %Y")
    week_number = todays_date.isocalendar().week
    print("### This Week in F-Droid")
    print()
    print(f"### TWIF curated on {day_and_date}, Week {week_number}")
    print()


def print_fdroid_core_news_section():
    """Prints out news contained in fdroid core news section"""
    print("#### F-Droid core")
    print()
    sample_username = "An Entity"
    sample_link = "https://not.a.real.link.example.com/fake"
    sample_str = "I am responsible for a couple of things, please watch this space"
    print(f"* [{sample_username}] ({sample_link}). {sample_str}!")
    print()


def print_community_news_section():
    """Prints out community news section"""
    print("#### Community News")
    print()
    sample_username = "An Entity"
    sample_link = "https://not.a.real.link.example.com/fake"
    sample_str = "I am responsible for a couple of things, please watch this space"
    print(f"* [{sample_username}] ({sample_link}). {sample_str}!")
    print()


def print_blog_prefix():
    """Prints the starting of the blog
    Namely:
     - the frontmatter
     - the date and time of twif
     - core news section with dummy string
     - community news section with dummy string
    """
    print_out_frontmatter()
    print_out_date_time_info_about_twif()
    print_fdroid_core_news_section()
    print_community_news_section()


def print_blog_suffix():
    """Prints footer of the blog post"""
    print(
        textwrap.dedent("""\
        Thank you for reading this week's TWIF 🙂

        Please subscribe to the [RSS feed](https://f-droid.org/feed.xml) in your favourite RSS application to be updated of new TWIFs when they come up.

        You are welcome to join the [TWIF forum thread](https://forum.f-droid.org/t/new-twif-submission-thread/23546). If you have any news from the community, post it there, maybe it will be featured next week 😉

        To help support F-Droid, please check out the [donation page](https://f-droid.org/donate/) and contribute what you can.
        """)
    )


def display_output(diff_tuple):
    """Displays current output to file"""
    added_apps = diff_tuple[0]
    removed_apps = diff_tuple[1]
    downgraded_apps = diff_tuple[2]
    upgraded_apps = diff_tuple[3]

    fdroid_app_str = "https://f-droid.org/packages/"

    print_blog_prefix()

    if removed_apps:
        num_removed_apps = str(len(removed_apps))
        print("#### Removed Apps")
        print()
        print(f"##### {num_removed_apps} apps were removed")
        print()
        for app in sorted(removed_apps, key=lambda app: app.name.lower()):
            app_str = f"* {markdown_escape(app.name)}: {markdown_escape(app.summary)}"
            print(app_str)
        print()

    if added_apps:
        num_added_apps = str(len(added_apps))
        print("#### Newly Added Apps")
        print()
        print(f"##### {num_added_apps} apps were newly added")
        print()
        for app in sorted(added_apps, key=lambda app: app.name.lower()):
            app_str = f"* **[{markdown_escape(app.name)}]({fdroid_app_str}{app.package_name})**: {markdown_escape(app.summary)}"
            print(app_str)
        print()

    if downgraded_apps:
        num_downgraded_apps = str(len(downgraded_apps))
        print("#### Downgraded Apps")
        print()
        print(f"##### {num_downgraded_apps} apps were downgraded")
        print()
        for app in sorted(downgraded_apps, key=lambda app: app.name.lower()):
            app_str = f"* **[{markdown_escape(app.name)}]({fdroid_app_str}{app.package_name})** was downgraded from `{app.previous_version_name}` to `{app.current_version_name}`"
            print(app_str)
        print()

    if upgraded_apps:
        num_upgraded_apps = str(len(upgraded_apps))
        print("#### Updated Apps")
        print()
        print("<details markdown=1>")
        print(
            f"<summary><h5>{num_upgraded_apps} apps were updated</h5> (expand for the full list)</summary>"
        )
        print()
        for app in sorted(upgraded_apps, key=lambda app: app.name.lower()):
            app_str = f"* **[{markdown_escape(app.name)}]({fdroid_app_str}{app.package_name})** was updated to `{app.current_version_name}`"
            print(app_str)
        print()
        print("</details>")
        print()

    print_blog_suffix()


def download(url, path):
    print(f"Downloading from {url} to {path}", file=sys.stderr)
    etag_path = path.with_suffix(".etag")
    for _ in range(RETRY):
        headers = {}
        if etag_path.is_file():
            etag = etag_path.read_text()
            headers = {"If-None-Match": etag}

        try:
            res = requests.get(url, headers=headers)
        except requests.exceptions.RequestException as e:
            print(f"Failed to download from {url}: {e}!", file=sys.stderr)
            continue
        code = res.status_code
        if code == 200:
            etag = res.headers.get("ETag")
            if etag:
                etag_path.write_text(etag)
            try:
                with path.open("wb") as fd:
                    for chunk in res.iter_content(chunk_size=128):
                        fd.write(chunk)
                break
            except ConnectionError as e:
                print(e, file=sys.stderr)
                path.unlink(missing_ok=True)
        elif code == 304:
            print("Remote remote file not changed", file=sys.stderr)
            break
        else:
            print(f"Failed to download from {url}: {code}!", file=sys.stderr)
    else:
        print(f"Failed to download from {url}, {RETRY} times tried!", file=sys.stderr)
        sys.exit(1)


def download_json(url, path):
    download(url, path)
    return json.load(path.open())


def get_index():
    log_commits = download_json(LOG_COMMIT_API, CACHE / "commits.json")
    today = datetime.now(UTC).replace(hour=0, minute=0, second=0, microsecond=0)
    last_friday = today - timedelta(days=(today.weekday() + 3) % 7)

    if OLD_INDEX_COMMIT:
        old_id = OLD_INDEX_COMMIT
    else:
        for commit in log_commits:
            commit_date = datetime.fromisoformat(commit["created_at"])
            if commit_date < last_friday:
                old_id = commit["id"]
                break

    old_url = f"{LOG_RAW_URL}{old_id}/repo/index-v2.json"
    new_url = f"{LOG_RAW_URL}{log_commits[0]['id']}/repo/index-v2.json"
    if old_url == new_url:
        print(
            "No diffs found. The current index matches the previous index",
            file=sys.stderr,
        )
        sys.exit()
    old_index = download_json(old_url, CACHE / "old_index.json")
    new_index = download_json(new_url, CACHE / "new_index.json")
    return old_index, new_index


def main():
    CACHE.mkdir(exist_ok=True)
    old_index, new_index = get_index()
    diff_tuple = generate_diffs_of_new_and_previous_indexes(old_index, new_index)
    display_output(diff_tuple)


if __name__ == "__main__":
    main()
