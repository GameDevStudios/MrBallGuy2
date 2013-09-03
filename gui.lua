gui = {}

local screenWidth = love.graphics.getWidth()
local screenHeight = love.graphics.getHeight()

local tween = require "assets/libs/tween"

local getText
local getX
local getY 
local getWidth 
local getHeight
local getState 
local getClickCallback
local getClickable 
local getEnabled
local getTweenable
local getDesX
local getDesY

local defaultButtonCallback

--[[

gui.makeButton:

text = Text to be displayed on the button (STRING)
x = The X position of the button initially (NUMBER)
y = The Y position of the button initially (NUMBER)
w = The width of the button* (NUMBER)
h = The height of the button* (NUMVER)
state = The state the button should be shown in (STRING)
OnClick = The action that takes place when the button is clicked (ANONYMOUS FUNCTION)
clickable = Whether or not the button is clickable (BOOLEAN)
enabled = Whether or not the button is enabled (BOOLEAN)
desX = The destination X of the button (NUMBER)
desY = The destination Y of the button (NUMBER)

]]

-- Helper function to create buttons
function gui.makeButton( text, x, y, w, h, state, OnClick, clickable, enabled, desX, desY )
	local text = text or "Default Text"
	local x = x or 0
	local y = y or 0
	local w = w or 150
	local h = h or 30
	local state = state or "startmenu"
	local OnClick = OnClick or defaultButtonCallback
	local clickable = clickable or true
	local enabled = enabled or true
	local desX = desX or x
	local desY = desY or y

	getText = function()
		return text
	end
	getX = function()
		return x
	end
	getY = function()
		return y
	end
	getWidth = function()
		return w
	end
	getHeight = function()
		return h
	end
	getState = function()
		return state
	end
	getClickCallback = function()
		return OnClick()
	end
	getClickable = function()
		return clickable 
	end
	getEnabled = function() 
		return enabled
	end
	getTweenable = function()
		return tweenable
	end
	getDesX = function()
		return desX 
	end
	getDesY = function()
		return desY
	end

	defaultButtonCallback = function(object)
		print(button.text)
	end

	local button = loveframes.Create("button")
	button:SetText(text)
	button:SetPos(x,y)
	button:SetSize(w,h)
	button:SetState(state)
	button:SetEnabled(enabled)
	button:SetClickable(clickable)
	button.OnClick = OnClick

	button.getX = getX
	button.getY = getY
	button.getClickCallback = getClickCallback
	button.getClickable = getClickable
	button.getEnabled = getEnabled
	button.getTweenable = getTweenable
	button.getDesX = getDesX
	button.getDesY = getDesY
	button.getWidth = getWidth
	button.getHeight = getHeight

	return button
end

function gui.createMenus(  )
	local StartButtonCallback = function(object)
		
	end

	local OptionsButtonCallback = function(object)
	end

	local QuitButtonCallback = function(object)
		tween(.5, StartButton, { x=screenWidth }, 'linear')
		tween(.5, OptionsButton, { x=0-150 }, 'linear')
		tween(.5, QuitButton, { x=screenWidth }, 'linear')
		tween(.5, backgroundColor, { 0,0,0 }, 'linear', love.quit, nil)
	end

	StartButton = gui.makeButton( "Start", 0-150, ( screenHeight/2-30/2 ), 150, 30, "startmenu", StartButtonCallback, true, true, ( screenWidth/2-150/2 ), ( screenHeight/2-30/2 ) )
	OptionsButton = gui.makeButton( "Settings", screenWidth, ( screenHeight/2-30/2+50 ), 150, 30, "startmenu", OptionsButtonCallback, true, true, ( screenWidth/2-150/2 ), nil )
	QuitButton = gui.makeButton( "Quit", 0-150, ( screenHeight/2-30/2+100 ), 150, 30, "startmenu", QuitButtonCallback, true, true, ( screenWidth/2-150/2 ), ( screenHeight/2-30/2 ) )
end
