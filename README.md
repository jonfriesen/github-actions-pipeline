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
- [ ] Sign the binaries
- [ ] Create Windows installer
- [ ] Create Mac installer
- [ ] Create Linux (Debian, Arch, CentOS, Generic) installers

## notes

### DigitalOcean Spaces (s3)
The `s3` param in goreleaser is deprecated (still works... for now), I could not get the `blobs` param working. Make sure you setup the key/secret in the github settings with the following names:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`