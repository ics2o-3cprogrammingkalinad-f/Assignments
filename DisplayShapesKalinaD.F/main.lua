----------------------------------------------------------------------------------------
-- Title: DisplayShapes
-- Name: Kalina Dunne Farrell
-- Course: ICS2O
-- This program will display 3+ shapes (not rectangle or circle, unless the rectangle or
-- circle is part of a drawing) on the iPad of different colors and borders. Underneath 
-- each shape is the name of it
----------------------------------------------------------------------------------------
-- make sure to:
-- window (rect) needs to be filled with a picture of a window (+1partlvl)
-- calculate and display area and measurments of roof (tri) (+1partlvl)
-- gradient fill (look up) to ?shape
-- at the end, if enough time, add moving smoke coming out of the chimney
-- have 4 shapes on the side (not part of the drawing)
----------------------------------------------------------------------------------------
-- setup

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- make the blue background
display.setDefault("background", 102/255, 1, 1)

-- get the textSize
local textSize = 30
----------------------------------------------------------------------------------------
-- shape #1 (pentagon)

-- create the local variables
local verticesOne = {5,120, 37,-35, 125,45, 43,26, 75,92}
local shape1W = 105
local shape1H = 620
local shapeOne = display.newPolygon(shape1W, shape1H, verticesOne)
local shape1Name = display.newText("Pentagon", 0, 0, Arial, textSize)

-- fill shapeOne
shapeOne:setFillColor(0, 1, 0)

-- set the border size and color for shapeOne
shapeOne.strokeWidth = 10
shapeOne:setStrokeColor(0, 0, 0)

-- set the (x.y) of shapeOneName
shape1Name.x = 100
shape1Name.y = 500

-- set the color of shape1Name
shape1Name:setFillColor(0, 0, 0)
----------------------------------------------------------------------------------------
-- shape #2

-- create the local variables
local verticesTwo = {0,50, 60,70, 77,100, 110,120, 150,-2, -2,0}
local shape2W = 310
local shape2H = 620
local shapeTwo = display.newPolygon(shape2W, shape2H, verticesTwo)
local shape2Name = display.newText("Hexagon", 0, 0, Arial, textSize)

-- fill shapeTwo
shapeTwo:setFillColor(0, 0, 153/255)

--set the border size and color for shapeTwo
shapeTwo.strokeWidth = 10
shapeTwo:setStrokeColor(153/255, 0, 0)

-- set the (x.y) of shapeTwoName
shape2Name.x = 308
shape2Name.y = 500

-- set the color of shape2Name
shape2Name:setFillColor(0, 0, 1)
----------------------------------------------------------------------------------------
-- shape #3

-- create the local variables
local verticesThree = {0,30, 50,120, 120,20}
local shape3W = 105
local shape3H = 400
local shapeThree = display.newPolygon(shape3W, shape3H, verticesThree)
local shape3Name = display.newText("Triangle", 0, 0, Arial, textSize)

-- fill shapeThree
shapeThree:setFillColor(1, 0, 0)

-- set the border size and color for shapeThree
shapeThree.strokeWidth = 10
shapeThree:setStrokeColor(0, 153/255, 0)

-- set the (x,y) of shape3Name
shape3Name.x = 105
shape3Name.y = 300

-- set the color of shape3Name
shape3Name:setFillColor(1, 0, 0)
----------------------------------------------------------------------------------------
-- shape #4

-- create the local variables
local verticesFour = {0,80, 40,80, 60,120, 125,160, 100,120, 200,150, 10,30}
local shape4W = 320
local shape4H = 400
local shapeFour = display.newPolygon(shape4W, shape4H, verticesFour)
local shape4Name = display.newText("Heptagon", 0, 0, Arial, textSize)

-- fill shapeFour
shapeFour:setFillColor(102/255, 0, 204/255)

-- set the border size and color for shapeFour
shapeFour.strokeWidth = 10
shapeFour:setStrokeColor(1, 0, 127/255)

-- set the (x,y) of shape4Name
shape4Name.x = 300 
shape4Name.y = 300

-- set the color of shape4Name
shape4Name:setFillColor(102/255, 0, 204/255)
----------------------------------------------------------------------------------------
-- main drawing:house
------------------------------
-- main house part: (rect)

-- create the local variables
local houseW = 500
local houseH = 500
local house = display.newRect(0, 0, houseW, houseH)

-- set the (x,y) of house
house.x = 774
house.y = 517

--set the color of house
house:setFillColor(1, 0, 0)
------------------------------
-- window:(polygon)

-- create the local variables  x, y,
local verticesWindow = {0,10, 0,20, 20,30, 30,40, 40,50, 50,60, 60,70, 70,0,}
local windowW = 200
local windowH = 200
local window = display.newPolygon(windowW, windowH, verticesWindow)
------------------------------
-- roof: (polygon)

-- create the local variables
local verticesRoof = {0,-150, -250,100, 250,100}
local roofH = 200
local roofW = 200
local roof = display.newPolygon(roofW, roofH, verticesRoof)

-- set the (x,y) of roof
roof.x = 776
roof.y = 142

-- color the roof
roof:setFillColor(102/255, 51/255, 0)
------------------------------
-- chimney: (rect)

-- create the local variables
local chimneyW = 50
local chimneyH = 130
local chimney = display.newRect(0, 0, chimneyW, chimneyH)

-- set the (x,y) of chimney
chimney.x = 630
chimney.y = 150

-- set the fill color of chimney
chimney:setFillColor(0, 0, 0)
------------------------------
-- door: (rect)

-- create the local variables
local doorW = 200
local doorH = 350
local door = display.newRect(0, 0, doorW, doorH)

-- set the (x,y) of door
door.x = 925
door.y = 591

-- set the fill color of door
door:setFillColor(153/255, 0, 76/255)
------------------------------
-- doornob: (circle)

-- create the local variables
local radius = 10
local doornob = display.newCircle(0, 0, radius)

-- set the (x,y) of doornob
doornob.x = 860
doornob.y = 600
----------------------------------------------------------------------------------------
-- area of roof

-- create the local variables
local areaText
local baseOfRoof = 400
local heightOfRoof = 200
local areaOfRoof

-- calculate the area of roof
areaOfRoof = baseOfRoof * heightOfRoof / 2

-- show areaText on the screen
areaText = display.newText("The area of the roof with a base of \n" ..
	baseOfRoof .. " and a height of " .. heightOfRoof .. " is " .. areaOfRoof.. 
	" pixels².", 0, 0, Arial, textSize)

-- set the (x,y) of areaText
areaText.x = 290
areaText.y = 100

-- color areaText
areaText:setFillColor(0, 0, 0)
----------------------------------------------------------------------------------------
-- smoke in chimney

-- In the rubic - it says I will lose a patial level for putting in a picture instead of 
-- a shape. I just wanted to note that I meant to put in a picture here, and this it is not
-- in the place of a shape.