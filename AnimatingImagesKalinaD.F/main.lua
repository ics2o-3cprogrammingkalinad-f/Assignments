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

-- Function: MoveBird
-- Input: this funcion accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x and y value of hummingbird
local function MoveBird(event)
	-- add the scroll speed to the x-value of hummingbird
	hummingbird.x = hummingbird.x + scrollSpeedXBird
	-- add the scroll speed to the y-value of hummingbird
	hummingbird.y = hummingbird.y + scrollSpeedYBird
end

-- MoveBird will be called over and over again
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