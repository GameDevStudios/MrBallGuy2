gui = {}

local screenWidth = love.graphics.getWidth()
local screenHeight = love.graphics.getHeight()

local tween = require "assets/libs/tween"

function gui.createMenus(  )
	local StartButtonCallback = function(object)
		tween(.5, StartButton, { x=screenWidth }, 'linear')
		tween(.5, QuitButton, { x=0-150 }, 'linear')
		tween(.5, logoColour, { 0,0,0,0 }, 'linear')
		clickSfx:play()
	end

	local QuitButtonCallback = function(object)
		tween(.5, StartButton, { x=screenWidth }, 'linear')
		tween(.5, QuitButton, { x=0-150 }, 'linear')
		tween(.5, logoColour, { 0,0,0,0 }, 'linear')
		tween(.5, backgroundColor, { 0,0,0 }, 'linear', love.quit)
		clickSfx:play()
	end

	StartButton = helpers.makeButton( "Start", 0-150, ( screenHeight/2-30/2 ), 150, 30, "startmenu", StartButtonCallback, true, true, ( screenWidth/2-150/2 ), ( screenHeight/2-30/2 ) )
	QuitButton = helpers.makeButton( "Quit", screenWidth, ( screenHeight/2-30/2+50 ), 150, 30, "startmenu", QuitButtonCallback, true, true, ( screenWidth/2-150/2 ), nil )
end
