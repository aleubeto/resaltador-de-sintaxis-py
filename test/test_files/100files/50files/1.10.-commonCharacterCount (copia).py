# Given two strings, find the number of common characters between them.

def solution(s1, s2):
    commonCharacters = 0
    aux = list(s2)
    for i in s1:
        if i in aux:
            commonCharacters += 1
            aux.remove(i)
    return commonCharacters