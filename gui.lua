gui = {}

local screenWidth = love.graphics.getWidth()
local screenHeight = love.graphics.getHeight()

local tween = require "assets/libs/tween"

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

	local ProfileSelectCreateProfileButtonCallback = function() 
		loveframes.SetState("createProfile")
	end

	local ProfileSelectCancelButtonCallback = function() 
		loveframes.SetState("loginscreen")
	end

	-- All the GUI stuff for the start menu
	StartMenuStartButton = helpers.makeButton( "Start", 0-150, ( screenHeight/2-30/2 ), 150, 30, "startmenu", StartMenuStartButtonCallback, true, true, ( screenWidth/2-150/2 ), ( screenHeight/2-30/2 ), nil )
	QuitButton = helpers.makeButton( "Quit", screenWidth, ( screenHeight/2-30/2+50 ), 150, 30, "startmenu", QuitButtonCallback, true, true, ( screenWidth/2-150/2 ), nil )

	-- All the GUI stuff for the profile select menu
	ProfileSelectFrame = helpers.makeFrame( "Select Profile", nil, nil, screenWidth-200, screenHeight-100, "loginscreen", nil, false, true, nil, false, nil )
	ProfileSelectBackButton = helpers.makeButton( "Back", ProfileSelectFrame:getWidth()/2-150/2, ProfileSelectFrame:getHeight()-50, 150, 30, "loginscreen", ProfileSelectFrameBackButtonCallback, true, true, nil, nil, ProfileSelectFrame )
	ProfileSelectCreateProfileButton = helpers.makeButton( "Create new profile!", ProfileSelectFrame:getWidth()/2-150/2, 30, 150, 30, "loginscreen", ProfileSelectCreateProfileButtonCallback, true, true, nil, nil, ProfileSelectFrame )
	ProfileSelectCreateProfileFrame = helpers.makeFrame( "Create new profile", nil, nil, screenWidth-200, screenHeight-100, "createProfile", nil, false, true, nil, false, nil )
	ProfileSelectCancelButton = helpers.makeButton( "Cancel", ProfileSelectCreateProfileFrame:getWidth()/2-150/2, ProfileSelectCreateProfileFrame:getHeight()-50, 150, 30, "createProfile" , ProfileSelectCancelButtonCallback, false, true, nil, false, ProfileSelectCreateProfileFrame )
end
