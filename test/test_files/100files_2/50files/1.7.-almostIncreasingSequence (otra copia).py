# Given a sequence of integers as an array, determine whether it is possible to obtain a strictly increasing sequence by removing no more than one element from the array. Note: sequence a0, a1, ..., an is considered to be a strictly increasing if a0 < a1 < ... < an. Sequence containing only one element is also considered to be strictly increasing.

def increasingSequence(seq):
    for i in range(len(seq)-1):
        if seq[i] >= seq[i+1]:
            return False
    return True

def solution(sequence):
    seq1 = list(sequence)
    seq2 = list(sequence)
    for i in range(len(sequence)-1):
        if sequence[i] >= sequence[i+1]:
            seq1.pop(i)
            seq2.pop(i+1)
            if increasingSequence(seq1) or increasingSequence(seq2):
                return True
            else:
                return False
    return True