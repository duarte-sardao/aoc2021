import copy

f = open("input.txt", "r")

codes = {}
pairs = {}
        

line = f.readline()
line = line.strip()
f.readline() #empty line

def lettercount():
    letters = {}
    for key in pairs.keys():
        for i in range(2):
            if key[i] not in letters.keys():
                letters[key[i]] = pairs[key]
            else:
                letters[key[i]] += pairs[key]
    max = 0
    min = 99999999999999999999999 #head empty
    for key in letters.keys():
        n = letters[key]
        if n > max:
            max = n
        if n < min and n != 0:
            min = n
    if max % 2 != 0:
        max += 1
    if min % 2 != 0:
        min += 1
    print(max)
    print(min)
    return (max - min)/2



def fuckmeup(pairs, steps):
    while steps > 0:
        pairs = polymorezide(pairs)
        steps -= 1
    return pairs

def polymorezide(pairs):
    pairscopy = copy.deepcopy(pairs) #idk if itd fuck up anything but why not stupid shallow copies
    for key in pairs.keys():
        amount = pairs[key]
        if amount == 0:
            continue 
        goodPrint(pairscopy)
        pairscopy[key] -= pairs[key] #jank alert
        pairs[key] = 0 #weewooweewoo
        pair = codes[key]
        print(key + " becomes " + pair[0] + " and " + pair[1])
        #print(pair[0])
        #print(pair[1])
        pairscopy[pair[0]] += amount
        pairscopy[pair[1]] += amount
    goodPrint(pairscopy)
    print("DONE")
    return pairscopy

def initDic():
    for item in codes.values():
        pairs[item[0]] = 0
        pairs[item[1]] = 0
    for item in codes.keys():
        pairs[item] = 0

def initStr():
    for pos, cha in enumerate(line):
        if pos == len(line) - 1:
            break
        subt = line[pos:pos+2]
        #print(subt)
        pairs[subt] += 1
    #print(pairs)

def goodPrint(dic):
    for key in dic.keys():
        print(str(key) + ":" + str(dic[key]), end=" ")
    print("\n")

while True:
    code = f.readline()
    if not code:
        break
    code = code.strip()
    #print(code)
    code = code.split(' -> ')
    #print(code)
    codes[code[0]] = (code[0][0]+code[1], code[1]+code[0][1])

initDic()
initStr()

pairs = fuckmeup(pairs, 40)
print(lettercount())