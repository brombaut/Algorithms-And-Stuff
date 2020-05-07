package isunique

func isUnique(s string) bool {
	m := make(map[rune]bool)
	for _, c := range s {
		if _, ok := m[c]; ok {
			return false
		}
		m[c] = true
	}
	return true
}
