# Given three collinear points p, q, r, the function checks if
# point q lies on line segment 'pr'
def onSegment(px, py, qx, qy, rx, ry):
    if ( (qx <= max(px, rx)) and (qx >= min(px, rx)) and
           (qy <= max(py, ry)) and (qy >= min(py, ry))):
        return True
    return False
 
def orientation(px, py, qx, qy, rx, ry):
    # to find the orientation of an ordered triplet (p,q,r)
    # function returns the following values:
    # 0 : Collinear points  
    # 1 : Clockwise points
    # 2 : Counterclockwise
     
    # See https://www.geeksforgeeks.org/orientation-3-ordered-points/amp/ hehe
    # for details of below formula.
     
    val = (float(qy - py) * (rx - qx)) - (float(qx - px) * (ry - qy))
    if (val > 0):
         
        # Clockwise orientation
        return 1
    elif (val < 0):
         
        # Counterclockwise orientation
        return 2
    else:
         
        # Collinear orientation
        return 0
 
# The main function that returns true if
# the line segment 'p1q1' and 'p2q2' intersect.
def doIntersect(seg1, seg2):
     
    # Find the 4 orientations required for
    # the general and special cases
    o1 = orientation(seg1[0], seg1[1], seg1[2], seg1[3], seg2[0], seg2[1])
    o2 = orientation(seg1[0], seg1[1], seg1[2], seg1[3], seg2[2], seg2[3])
    o3 = orientation(seg2[0], seg2[1], seg2[2], seg2[3], seg1[0], seg1[1])
    o4 = orientation(seg2[0], seg2[1], seg2[2], seg2[3], seg1[2], seg1[3])
 
    # General case
    if ((o1 != o2) and (o3 != o4)):
        return True
 
    # Special Cases
 
    # p1 , q1 and p2 are collinear and p2 lies on segment p1q1
    if ((o1 == 0) and onSegment(seg1[0], seg1[1], seg1[2], seg1[3], seg2[0], seg2[1])):
        return True
 
    # p1 , q1 and q2 are collinear and q2 lies on segment p1q1
    if ((o2 == 0) and onSegment(seg1[0], seg1[1], seg2[2], seg2[3], seg1[2], seg1[3])):
        return True
 
    # p2 , q2 and p1 are collinear and p1 lies on segment p2q2
    if ((o3 == 0) and onSegment(seg2[0], seg2[1], seg1[0], seg1[1], seg2[2], seg2[3])):
        return True
 
    # p2 , q2 and q1 are collinear and q1 lies on segment p2q2
    if ((o4 == 0) and onSegment(seg2[0], seg2[1], seg1[2], seg1[3], seg2[2], seg2[3])):
        return True
 
    # If none of the cases
    return False








f = open("input.txt", "r")

lines = []

x_size = 0;
y_size = 0;

while True:
    line = f.readline()
    if not line:
        break;
    line = line.strip()
    line = line.replace(" -> ", ",")
    #print(line)
    lst = line.split(",")
    goodlst = []
    for item in lst:
        goodlst.append(int(item))
    lines.append(goodlst)
    newx = max(goodlst[0], goodlst[2])
    newy = max(goodlst[1], goodlst[3])
    if(newx > x_size):
        x_size = newx
    if(newy > y_size):
        y_size = newy
print(x_size)
print(y_size)
x_size += 1
y_size += 1

points = [[0 for i in range(x_size)] for j in range(y_size)]
#print(points)
        
count = 0;

#rects = list(filter(lambda a: a[0] == a[2] or a[1] == a[3], lines));
rects = lines;
for line in rects:
    posy = line[1]
    targy = line[3]
    posx = line[0]
    targx = line[2]
    while True:
        points[posy][posx] += 1
        if(points[posy][posx] == 2):
            count += 1
        if(posx == targx and posy == targy):
            break
        if(posx < targx):
            posx += 1
        elif(posx > targx):
            posx -= 1
        if(posy < targy):
            posy += 1
        elif(posy > targy):
            posy -= 1
        
print(count)
#print(rects)
#print(points)
#print(lines)

f.close()