# Given an array of strings, return another array containing all of its longest strings.

def solution(inputArray):
    strings = []
    longest = 0
    for i in range(len(inputArray)):
        if longest < len(inputArray[i]):
            longest = len(inputArray[i])
    for j in range(len(inputArray)):
        if longest == len(inputArray[j]):
            strings.append(inputArray[j])
    return strings