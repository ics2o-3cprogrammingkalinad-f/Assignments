-----------------------------------------------------------------------------------------
-- Title: AnimatingImages
-- Name: Kalina Dunne Farrell
-- Course: ICS2O
-- This pogram displays 3+ images moving in different directions, with at least one image
-- moving in a diagonal line and at least one ofther growing/shrink or fading in/out.
-----------------------------------------------------------------------------------------
-- SETUP

-- hide the statusbar
display.setStatusBar(display.HiddenStatusBar)

-- set the background
local backgroundImage = display.newImageRect("Images/multiColorBackground.png", 2028, 1530)
-----------------------------------------------------------------------------------------
-- TEXT

-- create textObject and make it invisible
local textObject = display.newText("THE HUMMINGBIRD IS GONE!!!!", display.contentCenterX, display.contentCenterY/1.5, nil, 50)
textObject.isVisible = false

-- set its text color
textObject:setTextColor(1, 1, 0)
-----------------------------------------------------------------------------------------
-- CHARACTER #1 (HUMMINGBIRD)

-- create character
local hummingbird = display.newImageRect("Images/hummingbird.png", 150, 150)

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

	-- make textObject be visible when hummingbird goes off-screen
	if (hummingbird.y == -30) then
	textObject.isVisible = true

	end
end
-----------------------------------------------------------------------------------------
-- CHARACTER #2 (DOG)

-- ccreate character
local dog = display.newImageRect("Images/cartoonDog.png", 200, 200)

-- set the initial (x,y) positions of dog
dog.x = 100
dog.y = 665

-- make dog face left
dog:scale(-1, 1)

-- set the scroll speed (x-value only) for dog
scrollSpeedDog = 2

-- moves dog, makes dog travel back and forth across the bottom of the screen
local function MoveDog(event)

	if (dog.x == 900) then

		-- make dog face right
		dog:scale(-1, 1)

		-- make dog move left by subtracting the scroll speed
		scrollSpeedDog = -scrollSpeedDog

	elseif (dog.x <= 99) then

		-- make dog face left
		dog:scale(-1, 1)

		scrollSpeedDog = -scrollSpeedDog

	end

	-- add the scroll speed to the x-value of dog
	dog.x = dog.x + scrollSpeedDog

end
-----------------------------------------------------------------------------------------
-- CHARACTER #3  (PERSON)

-- create character
local person = display.newImageRect("Images/person.png", 150, 200)

-- set its original x and y positions
person.x = 70
person.y = 99

-- set the scroll speed for person
scrollSpeedPerson = 4

-- moves person on a cubic path
local function MovePerson(event)

	-- move left
	if (person.y == 99 and person.x <930) then
		person.x = person.x + scrollSpeedPerson

	-- move down
	elseif (person.x == 930 and person.y <450) then
		person.y = person.y + scrollSpeedPerson

	-- move right
	elseif (person.y == 451 and person.x >70) then
		person.x = person.x - scrollSpeedPerson

	-- move up
	elseif (person.x == 70 and person.y >99) then
		person.y = person.y - scrollSpeedPerson

	end
end

	-- spin person
local function SpinPerson(event)

	person:rotate(5)

end
-----------------------------------------------------------------------------------------
-- CHARACTER #4 (CLOUD)

-- create character
local cloud = display.newImageRect("Images/cloud.png", 300, 250)

-- set its original x and y positions
cloud.x = display.contentCenterX
cloud.y = display.contentCenterY

-- make the cloud move randomly
local function MoveCloud(event)

	cloud.x = cloud.x + math.random(-5, 5)
	cloud.y = cloud.y + math.random(-5, 5)

end

-- increase the size of cloud until the width reaches 500. Then re-start it at 300
local function SizeCloud(event)

	if( cloud.width < 500 ) then
		cloud.width = cloud.width + 1
		cloud.height = cloud.height + 1
	else
		cloud.width = 300
		cloud.height = 250
	end

end
-----------------------------------------------------------------------------------------
-- SOUNDS 

-- load sound
local bkgMusic = audio.loadStream("Sounds/bkgMusic.mp3")

-- play sound
local function PlaySound()

	--audio.play(bkgMusic)

end
-----------------------------------------------------------------------------------------
-- CALL FUNCTIONS AND/OR ADD EVENT LISTENERS

-- call SizeCloud over and over again
Runtime:addEventListener("enterFrame", SizeCloud)

-- call MoveBird over and over again
Runtime:addEventListener("enterFrame", MoveBird)

-- call oveDog over and over again
Runtime:addEventListener("enterFrame", MoveDog)

-- call SpinPerson over and over again
Runtime:addEventListener("enterFrame", SpinPerson)

-- call MovePerson over and over again
Runtime:addEventListener("enterFrame", MovePerson)

-- call MoveCloud over and over again
Runtime:addEventListener("enterFrame", MoveCloud)

-- call PlaySound once
PlaySound()