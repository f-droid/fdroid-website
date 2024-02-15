#!/usr/bin/env python3

import gitlab
import os

gl = gitlab.Gitlab(
    'https://gitlab.com',
    api_version=4,
    private_token=os.getenv('PERSONAL_ACCESS_TOKEN'),
)
project = gl.projects.get(os.getenv('CI_PROJECT_PATH'), lazy=True)

ci_pipeline_id = int(os.getenv('FROM_CI_PIPELINE_ID'))
merge_request = None
for mr in project.mergerequests.list(status='open'):
    print(mr.title, mr.id)
    for pipeline in mr.pipelines.list():
        if ci_pipeline_id == pipeline.id:
            merge_request = mr
            break
    if merge_request:
        break
print(merge_request)

with open('output.txt') as fp:
    output = fp.read()
if output:
    merge_request.notes.create(
        {
            'body': 'Some potential spelling errors (near the center of each line):\n'
            + '```\n'
            + '                                          ↧\n'
            + output
            + '```'
        }
    )

labels = set(merge_request.labels)
labels.add('fdroid-bot')
merge_request.labels = sorted(labels)
