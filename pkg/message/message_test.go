package message

import "testing"

func TestGet(t *testing.T) {
	out := Get()

	if out == "" {
		t.Error("Test Failed")
	}
}
