-----------------------------------------------------------------------------------------
-- Title: MathQuiz
-- Name: Kalina Dunne Farrell
-- Course: ICS2O
-- This program asks the user a math question (+, -, *, /, Square root, !, exponent) and
-- asks the user to aswer it in a numeric text field. If the user gets the answer wrong,
-- or the timer runs out, they lose a life and they get asked a new question. If the user
-- asnwers 5 questions correctly without lossing all 3 lives, they win the game
-----------------------------------------------------------------------------------------
-- setup

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background
display.setDefault("background", 204/255, 229/255, 1)
-----------------------------------------------------------------------------------------
-- local variables

-- variables for the question
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer = ""
local questionCount
local question = 0
local operation = math.random(1, 3)

-- create a temporary variable for the division calculations
local temp

-- variables for the timer
local totalSeconds = 16
local secondsLeft = 15
local clockText 
local countDownTimer

-- variables for losing
local youLose
local youLoseSound

-- variables for winning
local youWin
local youWinSound

-- variables for the lives
local lives = 3
local heart1
local heart2
local heart3

-- variables for the lost lives
local brokenHeart1
local brokenHeart2
local brokenHeart3
-----------------------------------------------------------------------------------------
-- local functions

-- make the question
local function AskQuestion()

	-- set and re-set operation to another random number
	operation = math.random(1, 5)

	if (operation == 1) then -- addition

	-- generate two random numbers between a max. and a min. number
	randomNumber1 = math.random(10, 20)
	randomNumber2 = math.random(10, 20)
	
	-- calculate correctAnswer and set its variable
	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	elseif (operation == 2) then -- subtraction

	-- generate two random numbers between a max. and a min. number
	randomNumber1 = math.random(10, 20)
	randomNumber2 = math.random(10, 20)

		-- make sure the first number is greater than the last
		repeat 
			randomNumber1 = math.random(10, 20)
			randomNumber2 = math.random(10, 20)
		until (randomNumber1 >= randomNumber2)
		while (randomNumber2 > randomNumber1)

		do end

	-- calculate correctAnswer and set its variable
	correctAnswer = randomNumber1 - randomNumber2

	-- create question in text object
	questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

	elseif (operation == 3) then -- multiplication

	-- generate two random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	-- calculate correctAnswer and set its variable
	correctAnswer = randomNumber1 * randomNumber2

	-- create question in text object
	questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

	elseif (operation == 4) then -- division
		-- generate two random numbers between a max. and a min. number
		randomNumber1 = math.random(1, 10)
		randomNumber2 = math.random(1, 10)

		-- set the question then switch randomNumber1 and correctAnswer
		correctAnswer = randomNumber1 * randomNumber2
		temp = randomNumber1
		randomNumber1 = correctAnswer
		correctAnswer = temp


		-- create question in text object
		questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "

	elseif (operation == 5) then -- scquare root

			-- generate a random number
		randomNumber1 = math.random(0, 10)

		-- calculate correctAnswer
		correctAnswer =  math.sqrt(randomNumber1)

		-- create question in text object
		questionObject.text = "√".. randomNumber1 .." = "

	--elseif (operation == 6) then -- factorial
		
		-- generate a random number
		--randomNumber1 = math.random(0, 10)
	
		-- calculate correctAnswer
		--correctAnswer = randomNumber1 !

		-- create question in text object
		--questionObject.text = randomNumber1 .."! ="

	end
end


local function IncreasePointCount()
	-- create question in text object
	question = question + 1
	questionCount.text = "Score count: ".. question

	if (question == 5) then
		heart1.isVisible = false
		heart2.isVisible = false
		heart3.isVisible = false
		brokenHeart1.isVisible = false
		brokenHeart2.isVisible = false
		brokenHeart3.isVisible = false
		clockText.isVisible = false
		numericField.isVisible = false
		youWin.isVisible = true

	end
end	

local function UpdateLives()

	-- make the whole hearts and the broken ones appear in their place
	if (lives == 2) then
		heart3.isVisible = false
		brokenHeart3.isVisible = true
	elseif (lives == 1) then
		heart2.isVisible = false
		brokenHeart2.isVisible = true
	elseif (lives == 0) then
		heart1.isVisible = false
		brokenHeart3.isVisible = true
		
		-- when there are no more lives left

		--stop the timer 
		timer.cancel(countDownTimer)
		
		-- hide the timer
		clockText.isVisible = false

		-- hide the question (numeric text field included)
		numericField.isVisible = false
		questionObject.isVisible = false

		-- show the youLose image
		youLose.isVisible = true

		-- play the youLoseSound
		audio.play(youLoseSound)

	end
end



local function HideCorrect()
	-- hide the correct object
	correctObject.isVisible = false
	-- hide the value in the answer box
	numericField.text = ""
	-- call function
	AskQuestion()
	-- resume timer
	timer.resume(countDownTimer)

end

local function HideIncorrect()
	-- hide the incorrect object
	incorrectObject.isVisible = false
	-- hide the value in the answer box
	numericField.text = ""
	-- lose a life
	lives = lives - 1
	-- call functions
	AskQuestion()
	UpdateLives()
	-- resume timer
	timer.resume(countDownTimer)

end

-- update the timer function
local function UpdateTime()

	-- decrease the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of left in the clock object
	clockText.text = secondsLeft ..""

	if (secondsLeft == 0) then

		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1
		UpdateLives()

	end
end

-- create the timer function 
local function StartTimer()

	-- create a countdown timer that loops infinitly
	countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)

end

local function NumericFieldListener(event)

	-- user begins editing "numericField"
	if (event.phase == "began") then

		-- clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed), set user input to userAnswer
		userAnswer = tonumber(event.target.text)
		secondsLeft = totalSeconds
		timer.pause(countDownTimer)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			incorrectObject.isVisible = false
			IncreasePointCount()
			timer.performWithDelay(2000, HideCorrect)

		else
			correctObject.isVisible = false
			incorrectObject.isVisible = true
			timer.performWithDelay(2000, HideIncorrect)
			AskQuestion()

		end
	end
end

-----------------------------------------------------------------------------------------
-- object creation

-- displays a question and sets its color
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, ComicSans, 70)
questionObject:setTextColor(0, 0, 0)

-- create the correct text object and make it invisible. also set its color
correctObject = display.newText("Correct!", display.contentCenterX, display.contentCenterY/3, nil, 50)
correctObject:setTextColor(0, 1, 0)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible. also set its color
incorrectObject = display.newText("The correct answer was ".. correctAnswer, display.contentCenterX, display.contentCenterY/3, nil, 50)
incorrectObject:setTextColor(1, 0, 0)
incorrectObject.isVisible = false

-- create numericField
numericField = native.newTextField(560, 380, 150, 100)
numericField.inputType = "default" 

-- add the event listener for the numeric field
numericField:addEventListener("userInput", NumericFieldListener)

-- display questionCount and set its color
questionCount = display.newText( "Score count: ".. question, display.contentWidth/2, 720, nil, 50)
questionCount:setTextColor(0, 0, 0)

-- create the lives (whole hearts) to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = 50
heart1.y = 50

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = 150
heart2.y = 50

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = 250
heart3.y = 50

-- create the lost lives (broken hearts) to display on the screen and make them invisible
brokenHeart1 = display.newImageRect("Images/brokenHeart.png", 100, 100)
brokenHeart1.x = 50
brokenHeart1.y = 50
brokenHeart1.isVisible = false

brokenHeart2 = display.newImageRect("Images/brokenHeart.png", 100, 100)
brokenHeart2.x = 150
brokenHeart2.y = 50
brokenHeart2.isVisible = false

brokenHeart3 = display.newImageRect("Images/brokenHeart.png", 100, 100)
brokenHeart3.x = 250
brokenHeart3.y = 50
brokenHeart3.isVisible = false

-- display the timer
clockText = display.newText(secondsLeft, 950, 45, nil, 70)
clockText:setTextColor(0, 0, 0)

-- create the losing image and make it invisible
youLose = display.newImageRect("Images/youLose.png", 500, 500)
youLose.x = display.contentWidth/2
youLose.y = display.contentHeight/2
youLose.isVisible = false

-- create the winning image and make it invisible
youWin = display.newImageRect("Images/youWin.png", 550, 500)
youWin.x = display.contentWidth/2
youWin.y = display.contentHeight/2
youWin.isVisible = false
-----------------------------------------------------------------------------------------
-- function calls

-- call the function to ask the question
AskQuestion()

-- call the function to re-start the timer
StartTimer()