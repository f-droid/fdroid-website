# Contributing

## Submitting merge requests

### Deploying merge requests to a live webserver via CI

By default, this project is configured to use the GitLab CI system to run `jekyll` and build the site when code is pushed.
In addition to this, it is optionally capable of pushing the resulting HTML to a live webserver and linking to it automatically from the GitLab MR.
The service CI will try to deploy to is [surge.sh](https://surge.sh).

Doing so will allow for easier review of your Merge Requests, but is not required.
If you don't follow the steps below, your Merge Requests will still pass CI, just the resulting HTML will not be accessible online.

To configure this, you should:

 * Install the surge.h https://surge.sh CLI: `npm install surge`
 * Signup for [surge.sh](https://surge.sh): `surge login`
 * Get a "token" to allow CI to deploy on your behalf: `surge token`
 * [Add two "Secret Variables"](https://docs.gitlab.com/ce/ci/variables/README.html#secret-variables) to your fork of this project:
   * Navigate to your projects Settings -> CI/CD Pipelines -> Secret Variables.
   * Add the following two variables:
     * `SURGE_LOGIN`: The email you used to signup with `surge login`.
     * `SURGE_TOKEN`: The value given when you ran `surge token`.

Now your CI jobs should be authorized to deploy to surge.sh, and the GitLab merge requests screen will automatically link to this deployment.
