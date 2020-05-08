package checkpermutation

func checkPermutation(s1 string, s2 string) bool {
	if len(s1) != len(s2) {
		return false
	}
	m := make(map[rune]int)
	for _, c := range s1 {
		if _, ok := m[c]; ok {
			m[c]++
		} else {
			m[c] = 1
		}
	}

	for _, c := range s2 {
		if _, ok := m[c]; ok {
			m[c]--
			if m[c] < 0 {
				return false
			}
		} else {
			return false
		}
	}

	for _, count := range m {
		if count != 0 {
			return false
		}
	}
	return true
}
