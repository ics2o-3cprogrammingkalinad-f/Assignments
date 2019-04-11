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
local companyLogoScrollSpeed = 3
local RMGames
local smoke
local smokeScrollSpeed = companyLogoScrollSpeed
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
-- move the car to the right
local function MoveLogo(event)
	-- add the the x-value of companyLogo
	companyLogo.x = companyLogo.x + companyLogoScrollSpeed

end

-- moke the smoke coming ut of the car at the same time and with the same speed as companyLogo
local function MoveSmokeFromCar(event)
	-- make the smokeFromCar follow the car
	smoke.x = companyLogo.x - 25

end

-- this function displays "RM Games" after the smoke from the car
local function ShowName(event)
	-- make RMGames follow smoke 
	


Runtime:addEventListener("enterFrame", MoveLogo)
Runtime:addEventListener("enterFrame", MoveSmokeFromCar)
-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------
-- create the car and set its x and y values
companyLogo = display.newImageRect("Images/companyLogo.png", 350, 250)
companyLogo.anchorX = 0
companyLogo.x = 0
companyLogo.y = 600

-- create the smoke that will be coming out the back of the car, flip it, and set its
--x and y values
smoke = display.newImageRect("Images/smoke.png", 150, 100)
smoke:scale(-1, 1)
smoke.x = companyLogo.x - 25
smoke.y = 590
-----------------------------------------------------------------------------------------
-- CALL FUNCTIONS
-----------------------------------------------------------------------------------------