f = open("input.txt", "r")

lines = []
counts = []
x_size = 0
y_size = 0
risk = 0

def spread(x, y):
    if x < 0 or x >= x_size or y < 0 or y >= y_size:
        return 0
    if lines[y][x] == 9:
        return 0
    lines[y][x] = 9
    return 1 + spread(x-1, y) + spread(x+1, y) + spread (x, y-1) + spread(x, y+1)

def getBasins():
    for y in range(y_size):
        for x in range(x_size):
            if lines[y][x] == 9:
                continue
            counts.append(spread(x, y))
            

while True:
    line = f.readline()
    if not line:
        break
    x_size = len(line)
    y_size += 1
    lines.append(list(map(int, list(line.strip())))) #get help

print(x_size)
print(y_size)

for y, line in enumerate(lines):
    for x, num in enumerate(line):
        lowest = True
        if x-1 >= 0:
            lowest = lowest and lines[y][x-1] > num
        if x+1 < x_size:
            lowest = lowest and lines[y][x+1] > num
        if y-1 >= 0:
            lowest = lowest and lines[y-1][x] > num
        if y+1 < y_size:
            lowest = lowest and lines[y+1][x] > num
        if(lowest):
            #print(num)
            risk += (1 + int(num))

getBasins()
counts.sort(reverse=True)

print(risk)

print(counts[0]*counts[1]*counts[2])