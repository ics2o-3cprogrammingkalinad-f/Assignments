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
local companyLogoScrollSpeedX = 5
local companyLogoScrollSpeedY = 3
local smokeScrollSpeedX = 5
local smokeScrollSpeedY = 3
local RMGames
local smoke
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
-- move the car to the right and down
local function MoveLogo(event)
	-- add the the x and y values of companyLogo
	companyLogo.x = companyLogo.x + companyLogoScrollSpeedX
	companyLogo.y = companyLogo.y + companyLogoScrollSpeedY

end

local function LogoEffects(event)
	-- make the companyLogo grow bigger as its x and y values increase
	companyLogo.width = companyLogo.width + 2
	companyLogo.height = companyLogo.height + 1

	-- make the companyLogo more visible as its x and y values increase
	companyLogo.alpha = companyLogo.alpha + .05

end

-- make the smoke moe at the same time and with the same speed as companyLogo
local function MoveSmoke(event)
	-- make the smoke follow the car
	smoke.x = smoke.x + smokeScrollSpeedX
	smoke.y = smoke.y + smokeScrollSpeedY

end

local function SmokeEffects(event)
	-- make the smoke grow bigger as its x and y values increase
	smoke.width = smoke.width + 2
	smoke.height = smoke.height + 1

	-- make the smoke more visible as its x and y values increase
	smoke.alpha = smoke.alpha + 0.5

end

-- this function displays "RM Games" after the smoke from the car
local function ShowName(event)
	-- make RMGames follow the smoke until it reaches the middle of the screen
	repeat
		RMGames.x = smoke.x - 25
	until (RMGames.x == display.contentWidth/2)

end
-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------
-- create the car and set its x and y values
	companyLogo = display.newImageRect("Images/companyLogo.png", 200, 100)
	companyLogo.anchorX = 0
	companyLogo.x = 260
	companyLogo.y = 400

	-- make the company logo start off as invisible/transparent
	companyLogo.alpha = 0

	-- make the car face down a little bit
	companyLogo:rotate(20)

-- create the smoke that will be coming out the back of the car
	smoke = display.newImageRect("Images/smoke.png", 150, 100)

	-- flip the smoke
	smoke:scale(-1, 1)

	-- set the smokes initial x and y values based off of the company logos x and y values
	smoke.x = companyLogo.x - 35
	smoke.y = companyLogo.y - 25

	-- make the smoke start off as invisible/transparent
	smoke.alpha = 0

	-- make the smoke face down a little bit
	smoke:rotate(20)

-- create the RMGames (company name) that will be following the smoke
	RMGames = display.newImageRect("Images/RMGames.png", 500, 500)

	-- set its x and y values
	RMGames.x = 500
	RMGames.y = 500
-----------------------------------------------------------------------------------------
-- CALL FUNCTIONS
-----------------------------------------------------------------------------------------
Runtime:addEventListener("enterFrame", MoveLogo)
Runtime:addEventListener("enterFrame", LogoEffects)
Runtime:addEventListener("enterFrame", MoveSmoke)
Runtime:addEventListener("enterFrame", SmokeEffects)