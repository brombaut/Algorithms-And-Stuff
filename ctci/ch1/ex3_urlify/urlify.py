
# Returns true if a string has all unique characters
def urlify(string):
    url_string = ""
    for char in string:
        if char == " ":
            url_string += "%20"
        else:
            url_string += char
    return url_string

if __name__== "__main__":
    print(urlify("Mr John Smith"))

