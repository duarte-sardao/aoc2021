f = open("input.txt", "r")


octopussies = [] #10x10

def printpussies():
    for i in range(10):
        print(octopussies[i])
    print("\n")

def flashyourneighbours(x, y): #i forgor how to check all around efficiently its gonna look bad
    flashed = 0
    if x-1 >= 0:
        if octopussies[y][x-1] != 0:
            octopussies[y][x-1] += 1
            if octopussies[y][x-1] > 9:
                flashed += 1
                octopussies[y][x-1] = 0
                flashed += flashyourneighbours(x-1, y)
        if y-1 >= 0:
            if octopussies[y-1][x-1] != 0:
                octopussies[y-1][x-1] += 1
                if octopussies[y-1][x-1] > 9:
                    flashed += 1
                    octopussies[y-1][x-1] = 0
                    flashed += flashyourneighbours(x-1, y-1)
        if y+1 < 10:
            if octopussies[y+1][x-1] != 0:
                octopussies[y+1][x-1] += 1
                if octopussies[y+1][x-1] > 9:
                    flashed += 1
                    octopussies[y+1][x-1] = 0
                    flashed += flashyourneighbours(x-1, y+1)
    if x+1 < 10: #lol
        if octopussies[y][x+1] != 0:
            octopussies[y][x+1] += 1
            if octopussies[y][x+1] > 9:
                flashed += 1
                octopussies[y][x+1] = 0
                flashed += flashyourneighbours(x+1, y)
        if y-1 >= 0:
            if octopussies[y-1][x+1] != 0:
                octopussies[y-1][x+1] += 1
                if octopussies[y-1][x+1] > 9:
                    flashed += 1
                    octopussies[y-1][x+1] = 0
                    flashed += flashyourneighbours(x+1, y-1)
        if y+1 < 10:
            if octopussies[y+1][x+1] != 0:
                octopussies[y+1][x+1] += 1
                if octopussies[y+1][x+1] > 9:
                    flashed += 1
                    octopussies[y+1][x+1] = 0
                    flashed += flashyourneighbours(x+1, y+1)
    if y-1 >= 0:
        if octopussies[y-1][x] != 0:
            octopussies[y-1][x] += 1
            if octopussies[y-1][x] > 9:
                flashed += 1
                octopussies[y-1][x] = 0
                flashed += flashyourneighbours(x, y-1)
    if y+1 < 10:
        if octopussies[y+1][x] != 0:
            octopussies[y+1][x] += 1
            if octopussies[y+1][x] > 9:
                flashed += 1
                octopussies[y+1][x] = 0
                flashed += flashyourneighbours(x, y+1)
    return flashed




def flashspread():
    flashed = 0
    for y, line in enumerate(octopussies):
        for x, octopuss in enumerate(line):
            if octopuss > 9:
                octopussies[y][x] = 0
                flashed += 1
                flashed += flashyourneighbours(x, y)
    return flashed

def flash(howmany):
    printpussies()
    if howmany == 0:
        return 0
    for y, line in enumerate(octopussies):
        for x, octopuss in enumerate(line):
            octopussies[y][x] += 1
    val = flashspread() + flash(howmany-1)
    return (val)
                
            

while True:
    line = f.readline()
    if not line:
        break
    octopussies.append(list(map(int, list(line.strip())))) # i hate it

#print(octopussies)
#print(flash(100))
iterations = 0
flashes = 0
while(flashes != 100):
    iterations += 1
    flashes = flash(1)


print(iterations)