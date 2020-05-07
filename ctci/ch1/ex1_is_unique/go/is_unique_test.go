package isunique

import "testing"

func TestEmptyString(t *testing.T) {
	result := isUnique("")
	if !result {
		t.Errorf("isUnique(\"test\") failed, expected=%v, got=%v", false, result)
	}
}

func TestNotUniqueStrings(t *testing.T) {
	var result bool = isUnique("tttt")
	if result {
		t.Errorf("isUnique(\"test\") failed, expected=%v, got=%v", false, result)
	}

	result = isUnique("test")
	if result {
		t.Errorf("isUnique(\"test\") failed, expected=%v, got=%v", false, result)
	}
}

func TestUniqueStrings(t *testing.T) {
	var result bool = isUnique("tesrw")
	if !result {
		t.Errorf("isUnique(\"test\") failed, expected=%v, got=%v", false, result)
	}
}
