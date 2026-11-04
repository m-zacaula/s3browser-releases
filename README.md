# S3 Browser

An app for Mac and Windows to browse, search, preview, download and upload files in Amazon S3, using your AWS CLI profiles.

## Install on Mac

Paste this in Terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/m-zacaula/s3browser-releases/main/install.sh | bash
```

It installs S3 Browser in Applications and opens it. You also need:

- **Node.js**: `brew install node`
- **An AWS CLI profile**: `aws configure` (access keys) or `aws configure sso`

## Install on Windows

Download `S3Browser-Setup.exe` from the [latest release](https://github.com/m-zacaula/s3browser-releases/releases/latest)
and run it. It needs no admin rights. You also need an **AWS CLI profile**: `aws configure` (access keys)
or `aws configure sso`. Node.js is included.

The app isn't signed, so Windows may show "Windows protected your PC": click **More info**, then **Run anyway**.

## Updates

The app updates itself (S3 Browser → Check for Updates…). Everything runs on your computer; your AWS
credentials never leave it.

This repository only holds the released app and its update feed.
