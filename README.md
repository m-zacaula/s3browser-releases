# S3 Browser

A Mac app to browse, search, preview, download and upload files in Amazon S3, using your AWS CLI profiles.

## Install

Paste this in Terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/m-zacaula/s3browser-releases/main/install.sh | bash
```

It installs S3 Browser in Applications and opens it. You also need:

- **Node.js**: `brew install node`
- **An AWS CLI profile**: `aws configure` (access keys) or `aws configure sso`

The app updates itself (S3 Browser → Check for Updates…). Everything runs on your Mac; your AWS
credentials never leave it.

This repository only holds the released app and its update feed.
