
# Returns true if a string is a permutation of another string
def is_permutation(string1, string2):
    if len(string1) != len(string2):
        return False
    char1Dict = dict()
    for char in string1:
        if char in char1Dict:
            char1Dict[char] += 1
        else:
            char1Dict[char] = 1
    for char in string2:
        if char not in char1Dict:
            return False
        elif char1Dict[char] == 1:
            del char1Dict[char]
        else:
            char1Dict[char] -= 1
    if len(char1Dict) > 0:
        return False
    return True
    

if __name__== "__main__":
    if is_permutation("ttts", "test"):
        print('Is Permutation')
    else:
        print('Is Not Permutation')

