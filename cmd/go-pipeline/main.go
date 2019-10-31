package main

import (
	"fmt"

	"github.com/jonfriesen/github-actions-pipeline/pkg/message"
)

var (
	Build string
	Major string
	Minor string
	Patch string
	Label string
)

func main() {
	fmt.Printf("%s.%s.%s-%s %s", Major, Minor, Patch, Build, Label)
	fmt.Println(message.Get())
}
