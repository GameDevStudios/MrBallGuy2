require("player") -- Requires the player file
require("gui") -- Requires the gui file for my GUI's
require("loveframesHelpers") -- Requires some of the helper functions I wrote with LöveFrames

require("assets/libs/AnAL") -- Requires the AnAL Library for Spritesheet Animation
require("assets/libs/lovedebug") -- Requires the lovedebug Library for debugging
require("assets/libs/loveframes") -- Requies the LöveFrames Library for GUI stuff

local tween = require "assets/libs/tween" -- Requires the tween.lua Library for tweening

local screenWidth = love.graphics.getWidth()
local screenHeight = love.graphics.getHeight()

local doneOnce = false

clickSfx = love.audio.newSource("assets/sound/sfx.ogg")

backgroundImage = love.graphics.newImage("assets/img/background.png")
logoImage = love.graphics.newImage("assets/img/logo.png")

imageProperties = {}

imageProperties[logoImage] = {}
imageProperties[logoImage].img = logoImage
imageProperties[logoImage].x = screenWidth/2-logoImage:getWidth()/2
imageProperties[logoImage].y = 30

imageProperties[backgroundImage] = {}
imageProperties[backgroundImage].w = backgroundImage:getWidth()
imageProperties[backgroundImage].h = backgroundImage:getHeight()

local backgroundQuad = love.graphics.newQuad(0, 0, screenWidth, screenHeight, backgroundImage:getWidth(), backgroundImage:getHeight())

local backgroundX1 = 0
local backgroundX2 = screenWidth

backgroundColor = { 0,0,0 }
logoColour = { 0,0,0,255 }

backgroundImage:setWrap("repeat", "repeat")

function love.load(  )
	gamestate = "startmenu"
	loveframes.SetState("startmenu")

	gui.createMenus()

	tween(1, backgroundColor, { 255,255,255 }, 'linear')
	tween(1, StartMenuStartButton, { x=StartMenuStartButton.getDesX() }, 'linear')
	tween(1, QuitButton, { x=QuitButton.getDesX() }, 'linear')
	tween(1, logoColour, { 255,255,255 }, 'linear')
end

function love.update( dt )
	if gamestate == "startmenu" then 
		backgroundX1 = backgroundX1 - 50 * dt
		backgroundX2 = backgroundX2 - 50 * dt

		if backgroundX1 < -screenWidth then 
			backgroundX1 = 0
		end
		if backgroundX2 < 0 then 
			backgroundX2 = screenWidth
		end
	elseif gamestate == "loginscreen" then 
		
	end

	tween.update(dt)
	loveframes.update(dt)
end

function love.draw(  )
	if gamestate == "startmenu" then 
		love.graphics.setColor(backgroundColor)
		love.graphics.drawq(backgroundImage, backgroundQuad, backgroundX1, 0)
		love.graphics.drawq(backgroundImage, backgroundQuad, backgroundX2, 0)

		love.graphics.setColor(logoColour)
		love.graphics.draw(logoImage, imageProperties[logoImage].x, imageProperties[logoImage].y )
	
		love.graphics.setColor(255,255,255)
	elseif gamestate == "loginscreen" then 

	end

	loveframes.draw()
end

function love.focus( bool )
	
end

function love.keypressed( key, unicode )
	loveframes.keypressed(key,unicode)
end

function love.keyreleased( key, unicode )
	loveframes.keyreleased(key,unicode)
end 

function love.mousepressed( button, x, y )
	loveframes.mousepressed(button,x,y)
end

function love.mousereleased( button, x, y )
	loveframes.mousereleased(button,x,y)
end

function love.quit(  )
	love.event.quit()
end
