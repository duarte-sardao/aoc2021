f = open("input.txt", "r")

codes = {}

def occurences(str):
    st = set(str)
    min = 999999999999
    max = 0
    for cha in st:
        val = str.count(cha)
        if val > max:
            max = val
        if val < min:
            min = val
    return max -min


def polymorizerepeat(orig, steps):
    res = orig
    while(steps > 0):
        print(steps)
        res = polymorize(res)
        steps -= 1
        #print(res)
    return res

def polymorize(orig):
    result = ""
    for pos, cha in enumerate(orig):
        result = result + cha
        if pos == len(orig) - 1:
            break
        add = codes[orig[pos:pos+2]]
        result = result + add
    return result
        

line = f.readline()
line = line.strip()
f.readline() #empty line

while True:
    code = f.readline()
    if not code:
        break
    code = code.strip()
    print(code)
    code = code.split(' -> ')
    print(code)
    codes[code[0]] = code[1]

print(occurences(polymorizerepeat(line, 40)))