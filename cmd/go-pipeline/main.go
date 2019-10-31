package main

import (
	"fmt"

	"github.com/jonfriesen/github-actions-pipeline/pkg/message"
)

var (
	// Build is a Git short hash
	Build string
	// Major is semver Major
	Major string
	// Minor is semver Minor
	Minor string
	// Patch is semver Patch
	Patch string
	// Label is semver Label
	Label string
)

func main() {
	fmt.Printf("%s.%s.%s-%s %s", Major, Minor, Patch, Build, Label)
	fmt.Println(message.Get())
}
