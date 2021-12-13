f = open("input.txt", "r")

def getmaxX(points):
    maxX = 0
    for point in points:
        if point[0] > maxX:
            maxX = point[0]
    return maxX

def getmaxY(points):
    maxY = 0
    for point in points:
        if point[1] > maxY:
            maxY = point[1]
    return maxY

def coolprint(points):
    x = getmaxX(points)
    y = getmaxY(points)
    for posy in range(y+1):
        for posx in range(x+1):
            if (posx, posy) in points:
                print('# ', end="")
            else:
                print('. ', end="")
        print('')

def fold(pos, val):
    if(pos < val):
        return pos
    diff = pos - val
    newpos = val - diff
    return newpos

def foldall(points, tasks):
    npoints = points
    for task in tasks:
        npoints = list(set(npoints))
        #coolprint(npoints)
        print(len(npoints))
        dirt = task[0]
        amt = task[1]
        for ind, point in enumerate(npoints):
            if dirt == 'x':
                npoints[ind] = (fold(point[0], amt), point[1])
            elif dirt == 'y':
                npoints[ind] = (point[0], fold(point[1], amt))
    npoints = list(set(npoints))
    #coolprint(npoints)
    print(len(npoints))
    return npoints

points = []
tasks = [] #sus

while True:
    line = f.readline()
    if not line or line =='\n':
        break
    lst = line.split(',')
    x = int(lst[0].strip())
    y = int(lst[1].strip())
    points.append((x,y))

while True:
    line = f.readline()
    if not line:
        break
    lst = line.split(' ')
    nl = lst[2].split('=')
    dirt = nl[0]
    amp = int(nl[1].strip())
    tasks.append((dirt, amp))


points = foldall(points, tasks)
coolprint(points)