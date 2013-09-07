gui = {}

local screenWidth = love.graphics.getWidth()
local screenHeight = love.graphics.getHeight()

local tween = require "assets/libs/tween"

local ProfileCreationCreateProfileButton
local ProfileCreationTextInputUsername

local defaultTextFont = love.graphics.newFont(50)

local defaultTextColor = { 0,0,0 }

local profileAlreadyExistsFrameError
local profileAlreadyExistsTextError

function gui.createMenus(  )
	local StartMenuStartButtonCallback = function(object)
		tween(.5, StartMenuStartButton, { x=screenWidth }, 'linear', loveframes.SetState, "loginscreen")
		tween(.5, QuitButton, { x=0-150 }, 'linear')
		tween(.5, logoColour, { 0,0,0,0 }, 'linear')

		clickSfx:play()
	end

	local QuitButtonCallback = function(object)
		tween(.5, StartMenuStartButton, { x=screenWidth }, 'linear')
		tween(.5, QuitButton, { x=0-150 }, 'linear')
		tween(.5, logoColour, { 0,0,0,0 }, 'linear')
		tween(.5, backgroundColor, { 0,0,0 }, 'linear', love.quit)

		clickSfx:play()
	end

	local ProfileSelectFrameBackButtonCallback = function(object)
		loveframes.SetState("startmenu")
		gamestate = "startmenu"
		
		StartMenuStartButton.x = 0-150
		StartMenuStartButton.y = ( screenHeight/2-30/2 )
		
		QuitButton.x = screenWidth 
		QuitButton.y = ( screenHeight/2-30/2+50 )

		tween(1, StartMenuStartButton, { x=StartMenuStartButton.getDesX() }, 'linear')
		tween(1, QuitButton, { x=QuitButton.getDesX() }, 'linear')
		tween(1, logoColour, { 255,255,255,255 }, 'linear')

		clickSfx:play()
	end

	local ProfileCreationCreateProfileButtonCallback = function(object)
		local username = ProfileCreationTextInputUsername:GetText()

		clickSfx:play()

		if love.filesystem.exists( tostring(username) ) then 
			profileAlreadyExistsFrameError = helpers.makeFrame( "Profile Already Exists", nil, nil, screenWidth-200, screenHeight-100, "createProfile", function(object) clickSfx:play() end, false, true, nil, true, nil )
			profileAlreadyExistsTextError = helpers.makeText( "Sorry, that username is already taken.", screenWidth/2-defaultTextFont:getWidth("Sorry, that username is already taken.")/2, screenHeight/2-defaultTextFont:getHeight("Sorry, that username is already taken.")/2, screenWidth-200, false, nil, defaultTextColor, profileAlreadyExistsFrameError, nil, nil, "createProfile" )
		else 
			local userSaveDir = love.filesystem.mkdir( tostring(username) )
			loveframes.SetState("loginscreen")
		end
	end

	local ProfileSelectCreateProfileButtonCallback = function(object) 
		loveframes.SetState("createProfile")

		ProfileCreationTextInputUsername = helpers.makeTextInput( "Username", nil, nil, nil, 0, 0, 20, nil, ProfileSelectCreateProfileFrame, "createProfile", ProfileSelectCreateProfileFrame:getWidth()/2-150/2, 100, 150, 30 )
		ProfileCreationCreateProfileButton = helpers.makeButton( "Create User Profile", ProfileSelectCreateProfileFrame:getWidth()/2-150/2, ProfileSelectCreateProfileFrame:getHeight()/2-30/2, 150, 30, "createProfile", ProfileCreationCreateProfileButtonCallback, true, true, nil, nil, ProfileSelectCreateProfileFrame )

		clickSfx:play()
	end

	local ProfileCreationCancelButtonCallback = function(object) 
		loveframes.SetState("loginscreen")

		clickSfx:play()
	end

	-- All the GUI stuff for the start menu
	StartMenuStartButton = helpers.makeButton( "Start", 0-150, ( screenHeight/2-30/2 ), 150, 30, "startmenu", StartMenuStartButtonCallback, true, true, ( screenWidth/2-150/2 ), ( screenHeight/2-30/2 ), nil )
	QuitButton = helpers.makeButton( "Quit", screenWidth, ( screenHeight/2-30/2+50 ), 150, 30, "startmenu", QuitButtonCallback, true, true, ( screenWidth/2-150/2 ), nil )

	-- All the GUI stuff for the profile select menu
	ProfileSelectFrame = helpers.makeFrame( "Select Profile", nil, nil, screenWidth-200, screenHeight-100, "loginscreen", nil, false, true, nil, false, nil )
	ProfileSelectBackButton = helpers.makeButton( "Back", ProfileSelectFrame:getWidth()/2-150/2, ProfileSelectFrame:getHeight()-50, 150, 30, "loginscreen", ProfileSelectFrameBackButtonCallback, true, true, nil, nil, ProfileSelectFrame )
	ProfileSelectCreateProfileButton = helpers.makeButton( "Create new profile!", ProfileSelectFrame:getWidth()/2-150/2, 30, 150, 30, "loginscreen", ProfileSelectCreateProfileButtonCallback, true, true, nil, nil, ProfileSelectFrame )

	-- All the GUI stuff for the profile creation menu
	ProfileSelectCreateProfileFrame = helpers.makeFrame( "Create new profile", nil, nil, screenWidth-200, screenHeight-100, "createProfile", nil, false, true, nil, false, nil )
	ProfileCreationCancelButton = helpers.makeButton( "Cancel", ProfileSelectCreateProfileFrame:getWidth()/2-150/2, ProfileSelectCreateProfileFrame:getHeight()-50, 150, 30, "createProfile" , ProfileCreationCancelButtonCallback, false, true, nil, false, ProfileSelectCreateProfileFrame )
end
