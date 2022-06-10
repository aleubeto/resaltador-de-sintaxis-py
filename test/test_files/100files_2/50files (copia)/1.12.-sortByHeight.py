# Some people are standing in a row in a park. There are trees between them which cannot be moved. Your task is to rearrange the people by their heights in a non-descending order without moving the trees. People can be very tall! If a[i] = -1, then the ith position is occupied by a tree. Otherwise a[i] is the height of a person standing in the ith position.

def solution(a):
    aux = sorted([i for i in a if i > 0])
    for i,v in enumerate(a):
        if v == -1:
            aux.insert(i,v)
    return aux
