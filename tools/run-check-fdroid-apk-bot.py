#!/usr/bin/env python3

import gitlab
import os

ci_project_path = os.getenv('CI_PROJECT_PATH')
gl = gitlab.Gitlab('https://gitlab.com', api_version=4,
                   private_token=os.getenv('PERSONAL_ACCESS_TOKEN'))
project = gl.projects.get(ci_project_path, lazy=True)

apk = os.getenv('apk')
asc = os.getenv('asc')
issue = project.issues.create({
    'title': 'https://f-droid.org/%s failed to verify!' % apk,
    'description': '''
A fresh download of https://f-droid.org/{apk} and https://f-droid.org/{asc} failed to verify!  To investigate, the files that were tested are available for download here:
* https://gitlab.com/{ci_project_path}/-/jobs/{job_id}/artifacts/download

To see the full job log:
* https://gitlab.com/{ci_project_path}/-/jobs/{job_id}
'''.format(apk=apk,
           asc=asc,
           job_id=os.getenv('CI_JOB_ID'),
           ci_project_path=ci_project_path),
})

labels = set(issue.labels)
labels.add('fdroid-bot')
labels.add('security')
issue.labels = sorted(labels)
issue.save()
