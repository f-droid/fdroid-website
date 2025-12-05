source 'https://rubygems.org'

gem "jekyll"

# The gem packages come from the system, e.g. Debian packages.  The
# gems from git should be referenced using a commit ID ref to provide
# a strong verified link to the source code.  The production site
# verifies a signed git tag, which then will include the SHA1 commit
# ID, which git will verify.
group :jekyll_plugins do
    gem "jekyll-redirect-from"
    # gem "jekyll-paginate-v2", :git => 'https://github.com/sverrirs/jekyll-paginate-v2.git',
    #     :ref => '7bc2634c04c49120b674cc3506275f85c4389f5c'
    # There seems to be a layout caching bug in `jekyll-paginate-v2` with Jekyll v4
    # Switch to a PR branch fix until a proper fix lands into master
    # See https://github.com/sverrirs/jekyll-paginate-v2/pull/260
    gem "jekyll-paginate-v2", :git => 'https://github.com/jameshi16/jekyll-paginate-v2.git',
        :ref => '8a1df6405618fdbe922b9f4419bed59cab9d31fd'  # branch: 'cache-mismatch-error'
    gem "jekyll-polyglot", :git => 'https://gitlab.com/fdroid/jekyll-polyglot.git',
        :ref => 'b4520fd8c638d43b6b96abd8b4462b1a398bb0e2'  # 1.8.0
    gem 'jekyll-fdroid', :git => 'https://gitlab.com/fdroid/jekyll-fdroid.git',
        :ref => '0ca3105553013a9c57bdcbed574c23c482e702ae'
    gem 'git'
end
