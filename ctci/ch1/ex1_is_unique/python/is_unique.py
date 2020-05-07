
# Returns true if a string has all unique characters
def is_unique(string):
    charDict = dict()
    for char in string:
        if char in charDict:
            return False
        charDict[char] = 1
    return True

if __name__== "__main__":
    if is_unique("tesrgu"):
        print('Is Unique')
    else:
        print('Is Not Unique')

