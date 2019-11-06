# github-actions-pipeline
This project is to learn how to build out a Go CLI CI/CD platform using GoReleaser and GitHub Actions

## learning objectives

- familiarize myself with GoReleaser
- familiarize myself with GitHub Actions
 - understand building a custom action
- build a binary deployment change from start to finish

## requirements

- [x] GoReleaser builds binaries
- [x] GH Action to build go app for Linux, Mac, Windows
- [x] Run simple unit tests
- [x] Deploy binaries and checksum to GH Releases
- [x] Deploy binaries and checksum to DigitalOcean Spaces
- [ ] Create Docker image + upload to DockerHub
- [ ] Sign GoReleaser generated binaries with gpg2??
- [ ] Sign mac binaries
- [x] Sign windows the binaries
- [x] Create Windows installer
- [x] Add Windows installer to GH release assets
- [x] Add Windows installer to S3
- [x] Create Mac installer
- [x] Add Mac installer to GH release assets
- [x] Add Mac installer to S3
- [x] Create Linux (deb, rpm, generic) installers

## future
- [ ] move actions to their own repos
    - [ ] mac-installer
    - [ ] windows-installer
    - [x] s3cmd-cp
    - [ ] windows-signer
- [ ] make windows-installer config oriented
- [ ] make mac-installer config oriented
- [ ] add multifile support to s3cmd-cp
- [ ] improve readme explaining each step with samples

## notes

### DigitalOcean Spaces (s3)
The `s3` param in goreleaser is deprecated (still works... for now), I could not get the `blobs` param working. Make sure you setup the key/secret in the github settings with the following names:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_BUCKET`
- `AWS_ENDPOINT` (in the format of `<region>.<domain>`, eg. `sfo2.digitaloceanspaces.com`)

Two methods for putting binaries in Spaces, via GoReleaser (see .goreleaser.yml the "s3" section) and as part of the GH Actions workflow (not implemented as of today). 