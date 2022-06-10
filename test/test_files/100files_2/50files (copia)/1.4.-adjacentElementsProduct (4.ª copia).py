# Given an array of integers, find the pair of adjacent elements that has the largest product and return that product.
def solution(inputArray):
    aux = []
    for i in range(len(inputArray)-1):
        index1 = inputArray[i]
        index2 = inputArray[i+1]
        aux.append(index1*index2)
    return max(aux)