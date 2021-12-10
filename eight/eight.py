f = open("input.txt", "r")

count = 0

numbshelper = {
    "abcefg": 0,
    "cf": 1,
    "acdeg": 2,
    "acdfg": 3,
    "bcdf": 4,
    "abdfg": 5,
    "abdefg": 6,
    "acf": 7,
    "abcdefg": 8,
    "abcdfg": 9
}

possibilities = {
  'a': "abcdefg",
  'b': "abcdefg",
  'c': "abcdefg",
  'd': "abcdefg",
  'e': "abcdefg",
  'f': "abcdefg",
  'g': "abcdefg"
}


def fix(stringo):
    for(char in stringo):
        char = possibilities[char]
    return stringo

def decode(right):
    count = 0
    for(stringo in right):
        stringo = "".join(sorted(stringo))
        count *= 10
        stringo = fix(stringo)
        count += numbshelper[stringo]
    return count

    #bruh idk im fuckin stuck

while True:
    line = f.readline()
    if not line:
        break
    left,right = line.split(' | ', 1)
    left = left.split()
    right = right.split()
    #for chungus in right:#part1
    #    if len(chungus) != 5 and len(chungus) != 6:
    #        print(chungus)
    #        count += 1


print(count)