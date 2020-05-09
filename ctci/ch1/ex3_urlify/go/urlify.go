package urlify

func urlify(s string, length int) string {
	result := ""
	for _, c := range s {
		if c == ' ' {
			result += "%20"
		} else {
			result += string(c)
		}
	}
	return result
}
