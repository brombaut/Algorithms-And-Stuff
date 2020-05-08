package checkpermutation

import "testing"

func TestStringsOfDifferentLength(t *testing.T) {
	var expected bool = false

	var result bool = checkPermutation("test", "testing")
	if result != expected {
		t.Errorf("checkPermutation(\"test\", \"testing\") failed, expected=%v, got=%v", expected, result)
	}

	result = checkPermutation("testing", "test")
	if result != expected {
		t.Errorf("checkPermutation(\"testing\", \"test\") failed, expected=%v, got=%v", expected, result)
	}
}

func TestPermutations(t *testing.T) {
	var expected bool = true

	var result bool = checkPermutation("", "")
	if result != expected {
		t.Errorf("checkPermutation(\"\", \"\") failed, expected=%v, got=%v", expected, result)
	}

	result = checkPermutation("test", "estt")
	if result != expected {
		t.Errorf("checkPermutation(\"test\", \"estt\") failed, expected=%v, got=%v", expected, result)
	}

	result = checkPermutation("tttt", "tttt")
	if result != expected {
		t.Errorf("checkPermutation(\"tttt\", \"tttt\") failed, expected=%v, got=%v", expected, result)
	}

	result = checkPermutation("helpful", "efhllpu")
	if result != expected {
		t.Errorf("checkPermutation(\"helpful\", \"efhllpu\") failed, expected=%v, got=%v", expected, result)
	}
}

func TestNotPermutations(t *testing.T) {
	var expected bool = false

	var result bool = checkPermutation("a", "")
	if result != expected {
		t.Errorf("checkPermutation(\"a\", \"\") failed, expected=%v, got=%v", expected, result)
	}

	result = checkPermutation("", "a")
	if result != expected {
		t.Errorf("checkPermutation(\"\", \"a\") failed, expected=%v, got=%v", expected, result)
	}

	result = checkPermutation("test", "tttt")
	if result != expected {
		t.Errorf("checkPermutation(\"test\", \"tttt\") failed, expected=%v, got=%v", expected, result)
	}

	result = checkPermutation("ttta", "tttt")
	if result != expected {
		t.Errorf("checkPermutation(\"ttta\", \"tttt\") failed, expected=%v, got=%v", expected, result)
	}

}
