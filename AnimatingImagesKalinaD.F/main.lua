-----------------------------------------------------------------------------------------
-- Title: AnimatingImages
-- Name: Kalina Dunne Farrell
-- Course: ICS2O
-- This pogram displays 3+ images moving in different directions, with at least one image
-- moving in a diagonal line and at least one ofther growing/shrink or fading in/out.
-----------------------------------------------------------------------------------------
-- setup

-- hide the statusbar
display.setStatusBar(display.HiddenStatusBar)

-- set the background
local backgroundImage = display.newImageRect("Images/multiColorBackground.png", 2028, 1530)
-----------------------------------------------------------------------------------------
-- character #1 (hummingbird)

-- character image with width and height
local hummingbird = display.newImageRect("Images/hummingbird.png", 100, 100)

-- set the initial (x,y) positions of hummingbird
hummingbird.x = 800
hummingbird.y = 600

-- set the scrollSpeed for the x and y values of hummingbird
scrollSpeedXBird = -1
scrollSpeedYBird = -1

-- make bird move in a diagonal direction
local function MoveBird(event)
	
	-- add the scroll speed to the x-value of hummingbird
	hummingbird.x = hummingbird.x + scrollSpeedXBird
	-- add the scroll speed to the y-value of hummingbird
	
	hummingbird.y = hummingbird.y + scrollSpeedYBird
end

-- call MoveBird over and over again
Runtime:addEventListener("enterFrame", MoveBird)
-----------------------------------------------------------------------------------------
-- character #2 (dog)

-- character image with width and height
local dog = display.newImageRect("Images/cartoonDog.png", 200, 200)

-- set the initial (x,y) positions of dog
dog.x = 100
dog.y = 680

-- make dog face left
dog:scale(-1, 1)

-- set the scroll speed
local scrollSpeedDog = 2

-- make dog move
local function MoveDog(event)

	-- add the scroll speed to the x-value of dog to move it right. Also make it repeat 
	-- until dog reach x-value 900
	repeat 
		dog.x = dog.x + scrollSpeedDog
	until (dog.x == 900)

	-- flip the dog to face right
	dog:scale(1, -1)

	-- subract the scroll speed for the x-value of dog to move it left. Also make it repeat
	-- until dog reaches x=value 100
	repeat
		dog.x = dog.x - scrollSpeedDog
	until (dog.x == 100)

	-- flip the dog to face left again
	dog:scale(-1, 1)

end

-- call MoveDog over and over again
Runtime:addEventListener("enterFrame", MoveDog)