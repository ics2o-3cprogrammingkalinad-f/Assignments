-----------------------------------------------------------------------------------------
-- Title: CompanyAnimation
-- Name: Kalina Dunne Farrell
-- Course: ICS2O
-- This program is the logo of RM Games. It is a car racing accross the screan, leaving 
--behind smoke. When this smoke clears "RM Games" is visible.
-----------------------------------------------------------------------------------------
-- SETUP
-----------------------------------------------------------------------------------------
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background image then make it cover the whole screen
	local bkg = display.newImageRect("Images/bkgImage.jpg", display.contentWidth, display.contentHeight)
	bkg.anchorX = 0
	bkg.anchorY = 0
	bkg.x = 0
	bkg.y = 0
-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local companyLogo
local scrollSpeedX = 5
local scrollSpeedY = 3
local companyName
local smoke
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
-- move the car to the right and down
local function MoveLogo(event)
	-- add the the x and y values of companyLogo
	companyLogo.x = companyLogo.x + scrollSpeedX
	companyLogo.y = companyLogo.y + scrollSpeedY

end

-- this function makes the logo grow bigger and become more opaque when the logos x and y
-- values increase
local function LogoEffects(event)
	-- make the companyLogo grow bigger as its x and y values increase
	companyLogo.width = companyLogo.width + 2
	companyLogo.height = companyLogo.height + 1

	-- make the companyLogo more visible as its x and y values increase
	companyLogo.alpha = companyLogo.alpha + .05

end

-- makes the smoke move at the same time and with the same speed as companyLogo
local function MoveSmoke(event)
	-- make the smoke follow the car
	smoke.x = smoke.x + scrollSpeedX
	smoke.y = smoke.y + scrollSpeedY

end

-- this function makes the smoke grow bigger and become more opaque when the smokes x and
-- y valuesincrease
local function SmokeEffects(event)
	-- make the smoke grow bigger as its x and y values increase
	smoke.width = smoke.width + 2
	smoke.height = smoke.height + 1

	-- make the smoke more visible as its x and y values increase
	smoke.alpha = smoke.alpha + 0.5

end

-- this moves the companyName, then whan companyName reaches the middle, it stops the companyName
local function MoveName(event)
	-- make companyName follow the smoke until it reaches the middle of the height of the
	-- screen
	repeat
		companyName.x = companyName.x - scrollSpeedX
		companyName.y = companyName.y - scrollSpeedY
	until (RMGamesyx == display.contentHeight/2)

		-- once companyName reaches the middle of the height of the screen, make it
		-- completly move to the middle
		companyName.x = display.contentWidth/2
		companyName.y = display.contentHeight/2

end

-- this function makes the companyName grow bigger and become more opaque when companyNames
-- x and y values increase
local function NameEffects(event)
	-- make the companyName grow bigger as its x and y values increase
	companyName.width = companyName.width + 2
	companyName.height = companyName.height + 1

	-- make the companyName more visible as its x and y values increase
	companyName.alpha = companyName.alpha + 0.5

end
-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------
-- create the car
	companyLogo = display.newImageRect("Images/companyLogo.png", 200, 100)
	
	-- anchor the car
	companyLogo.anchorX = 0

	-- set its x and y values
	companyLogo.x = 260
	companyLogo.y = 400

	-- make the company logo start off as invisible/transparent
	companyLogo.alpha = 0

	-- make the car rotate to face down a little bit
	companyLogo:rotate(20)

-- create the smoke that will be coming out the back of the car
	smoke = display.newImageRect("Images/smoke.png", 150, 100)

-- set the smokes initial x and y values based off of the company logos x and y values
	smoke.x = companyLogo.x - 35
	smoke.y = companyLogo.y - 25

	-- flip the smoke
	smoke:scale(-1, 1)
	
	-- make the smoke start off as invisible/transparent
	smoke.alpha = 0

	-- make the smoke face down a little bit
	smoke:rotate(20)

-- create the companyName (company name) that will be following the smoke
	companyName = display.newImageRect("Images/RMGames.png", 400, 400)

	-- set its x and y values
	companyName.x = 500
	companyName.y = 500

	-- make companyName start off as invisible/transparent
	companyName.alpha = 0

	-- make it rotate face down a little bit
	companyName:rotate(20)
-----------------------------------------------------------------------------------------
-- CALL FUNCTIONS
-----------------------------------------------------------------------------------------
Runtime:addEventListener("enterFrame", MoveLogo)
Runtime:addEventListener("enterFrame", LogoEffects)
Runtime:addEventListener("enterFrame", MoveSmoke)
Runtime:addEventListener("enterFrame", SmokeEffects)
Runtime:addEventListener("enterFrame", MoveName)
Runtime:addEventListener("enterFrame", NameEffects)