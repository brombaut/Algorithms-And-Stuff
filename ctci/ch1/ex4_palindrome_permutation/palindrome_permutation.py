
def palindrome_permutation(string):
    no_spaces = ""
    for char in string.lower():
        if char != " ":
            no_spaces += char
    sorted_arr = sorted(no_spaces)
    i = 0
    found_single = False
    while i < len(sorted_arr):
        if i == len(sorted_arr) - 1 and found_single:
            return False
        if sorted_arr[i] != sorted_arr[i+1]:
            if found_single:
                return False
            else:
                found_single = True
                i += 1
                continue
        i += 2
    return True


if __name__== "__main__":
    if palindrome_permutation("Tact Coaz"):
        print("Is Palindrom Permutation")
    else:
        print("Is Not Palindrom Permutation")

