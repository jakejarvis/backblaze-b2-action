# GitHub Action for [Backblaze B2](https://www.backblaze.com/b2/cloud-storage.html) 🔥 

> **⚠️ Note:** To use this action, you must have access to the [GitHub Actions](https://github.com/features/actions) feature. GitHub Actions are currently only available in public beta. You can [apply for the GitHub Actions beta here](https://github.com/features/actions/signup/).

This simple action syncs a directory (either from your repository or generated during your workflow) with a remote bucket on [Backblaze B2](https://www.backblaze.com/b2/cloud-storage.html).

Many find B2 appealing because of its free bandwidth deal with Cloudflare via the [Bandwidth Alliance](https://www.cloudflare.com/bandwidth-alliance/), but unlike [other](https://en.wikipedia.org/wiki/Amazon_S3#S3_API_and_competing_services) popular cloud "bucket" providers like [DigitalOcean Spaces](https://developers.digitalocean.com/documentation/spaces/) and [DreamObjects](https://help.dreamhost.com/hc/en-us/articles/217590537-How-To-Use-DreamObjects-S3-compatible-API), it is [not compatible](https://help.backblaze.com/hc/en-us/articles/218513487-Is-the-B2-Cloud-Storage-API-Compatible-with-Amazon-S3-) with S3's API, so using this official Python-based [tool](https://github.com/Backblaze/B2_Command_Line_Tool) is required.


## Usage

### `workflow.yml` Example

Place in a `.yml` file such as this one in your `.github/workflows` folder. [Refer to the documentation on workflow YAML syntax here.](https://help.github.com/en/articles/workflow-syntax-for-github-actions)

```yaml
name: Sync B2 Bucket
on: push

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: jakejarvis/backblaze-b2-action@master
      env:
        SOURCE_DIR: './public'
        B2_BUCKET: ${{ secrets.B2_BUCKET }}
        B2_APPKEY_ID: ${{ secrets.B2_APPKEY_ID }}
        B2_APPKEY: ${{ secrets.B2_APPKEY }}
```


### Required Environment Variables

| Key | Value | Type | Required |
| ------------- | ------------- | ------------- | ------------- |
| `SOURCE_DIR` | The local directory you wish to sync/upload to B2. For example, `./public`. | `env` | **Yes** |


### Required Secret Variables

The following variables should be added as "secrets" in the action's configuration.

| Key | Value                                                                                                                 | Type | Required |
| ------------- |-----------------------------------------------------------------------------------------------------------------------| ------------- | ------------- |
| `B2_BUCKET` | The Backblaze B2 path in form `b2://<bucketName>/<prefix>`. Prefix is optional. <br/> Examples: `b2://my-bucket-name/a/path/prefix/` or `b2://my-bucket-name`.  | `secret` | **Yes** |
| `B2_APPKEY_ID` | Your Backblaze Application Key ID. [Generate it here.](https://secure.backblaze.com/app_keys.htm)                     | `secret` | **Yes** |
| `B2_APPKEY` | Your Backblaze Application Key — aka the "secret" key. [Generate it here.](https://secure.backblaze.com/app_keys.htm) | `secret` | **Yes** |


## License

This project is distributed under the [MIT license](LICENSE.md).
