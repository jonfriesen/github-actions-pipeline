
.PHONY: release
release:
	goreleaser release --rm-dist 

.PHONY: dry-run
dry-run:
	goreleaser release --rm-dist --skip-publish

.PHONY: snapshot
snapshot:
	goreleaser --rm-dist --snapshot

.PHONY: run
run:
	./dist/github-actions-pipeline_linux_amd64/github-actions-pipeline