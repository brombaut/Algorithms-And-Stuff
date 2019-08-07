

def longestCommonSubsequence(string1, string2):
    len1 = len(string1)
    len2 = len(string2)

    # Use len + 1 because the first row and column will just be zeros
    grid = [[None] * (len2 + 1) for i in range(len1 + 1)]

    for i in range(len1 + 1):
        for j in range(len2 + 1):
            if i == 0 or j == 0:  # Fill in the first row and column with zeros
                grid[i][j] = 0
            elif string1[i-1] == string2[j-1]:  # The letters match
                grid[i][j] = grid[i-1][j-1] + 1
            else:  # Letters dont match
                grid[i][j] = max(grid[i-1][j], grid[i][j-1])
    return grid[len1][len2]


def main():
    string1 = "testing123"
    string2 = "writing1"
    lcs = longestCommonSubsequence(string1, string2)
    print("Longest Common Subsequence: " + str(lcs))


if __name__ == "__main__":
    main()