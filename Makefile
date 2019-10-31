
.PHONY: release
release:
	goreleaser release

.PHONY: dry-run
dry-run:
	goreleaser release --skip-publish

.PHONY: snapshot
snapshot:
	goreleaser --rm-dist --snapshot

.PHONY: run
run:
	./dist/github-actions-pipeline_linux_amd64/github-actions-pipeline