package urlify

import (
	"strconv"
	"testing"
)

func TestUrlifyNoSpacesReturnsSameString(t *testing.T) {
	var s string = "MrJohnSmith"
	var l int = len(s)
	var expected string = "MrJohnSmith"
	var result string = urlify(s, l)
	if result != expected {
		t.Errorf("urlify(\""+s+"\", "+strconv.Itoa(l)+") did not return correct string, expected=%v, got=%v", expected, result)
	}
}

func TestUrlifyWithSpaces(t *testing.T) {
	var s string = "Mr John Smith"
	var l int = len(s)
	var expected string = "Mr%20John%20Smith"
	var result string = urlify(s, l)
	if result != expected {
		t.Errorf("urlify(\""+s+"\", "+strconv.Itoa(l)+") did not return correct string, expected=%v, got=%v", expected, result)
	}
}

func TestAllSpaces(t *testing.T) {
	var s string = "   "
	var l int = len(s)
	var expected string = "%20%20%20"
	var result string = urlify(s, l)
	if result != expected {
		t.Errorf("urlify(\""+s+"\", "+strconv.Itoa(l)+") did not return correct string, expected=%v, got=%v", expected, result)
	}
}
