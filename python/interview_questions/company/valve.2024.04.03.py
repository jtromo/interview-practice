# 123456 -> '123,456'
# -123456 -> '-123,456'

def commas(num: int) -> str:
    if num == None:
        return ""
    # if not str(num).isnumeric():
    #     return ""

    isNeg = False
    if num < 0:
        isNeg = True

    # go through in reverse
    # n3 +1
    numString = str(num)
    if isNeg:
        numString = numString[1:]

    count = 0
    answer = ""
    for indx in range(len(numString)-1, -1, -1):
        answer = numString[indx] + answer
        count += 1
        if count == 3 and indx != 0:
            # add a comma
            count = 0
            answer = "," + answer
    if isNeg:
        answer = "-" + answer

    return answer

print(commas(123456))
print(commas(-123456))
