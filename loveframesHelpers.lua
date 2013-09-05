helpers = {}

local screenWidth = love.graphics.getWidth()
local screenHeight = love.graphics.getHeight()

local defaultButtonCallback = function(object) print("Button Clicked!") end
local defaultFrameCloseCallback = function(object) print("Frame close button pressed!") end

local defaultFrameIcon = love.graphics.newImage("assets/img/defaultFrameIcon.png")

--[[

helpers.makeButton:

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

function helpers.makeButton( text, x, y, w, h, state, OnClick, clickable, enabled, desX, desY, parent )
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
	local parent = parent or self

	local getText = function()
		return text
	end
	local getX = function()
		return x
	end
	local getY = function()
		return y
	end
	local getWidth = function()
		return w
	end
	local getHeight = function()
		return h
	end
	local getState = function()
		return state
	end
	local getClickCallback = function()
		return OnClick()
	end
	local getClickable = function()
		return clickable 
	end
	local getEnabled = function() 
		return enabled
	end
	local getDesX = function()
		return desX 
	end
	local getDesY = function()
		return desY
	end
	local getParent = function()
		return parent
	end

	local button = loveframes.Create("button", parent)
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

--[[

helpers.makeFrame:

name = The title of the frame (STRING)
x = The X position of the frame (NUMBER)
y = The Y position of the frame (NUMBER)
w = The Width of the frame (NUMBER)
h = The Height of the frame (NUMBER)
state = The LöveFrames state in which the frame should be displayed (STRING)
OnClose = The action that takes place when the frame is closed (ANONYMOUS FUNCTION)
draggable = Whether the frame is able to be dragged around or not (BOOLEAN)
centered = Whether the frame is centered or not (BOOLEAN)
icon = The icon for the window (IMAGE OBJECT OR STRING PATH TO IMAGE)

There are built in functions for getting the Name, getting whether the frame is draggable or not and getting the frame icon. They are:

frameObject:GetDraggable()
frameObject:GetName
frameObject:GetIcon

]]

function helpers.makeFrame( name, x, y, w, h, state, OnClose, draggable, centered, icon, showCloseButton, parent )
	local name = name or "Default Frame Name"
	local x = x
	local y = y
	local w = w or 100
	local h = h or 200
	local state = state or "startmenu"
	local OnClose = OnClose or defaultFrameCloseCallback
	local draggable = draggable
	local centered = centered or true
	local icon = icon or defaultFrameIcon
	local showCloseButton = showCloseButton
	local parent = parent

	local getX = function()
		return x
	end
	local getY = function()
		return y 
	end
	local getWidth = function()
		return w 
	end
	local getHeight = function()
		return h 
	end
	local getState = function()
		return state
	end
	local getCentered = function()
		
	end
	local getParent = function()
		return parent
	end

	local frame = loveframes.Create("frame", parent)
	frame:SetPos(x, y)
	frame:SetSize(w, h)
	frame:SetName(name)
	frame:SetState(state)
	frame:SetDraggable(draggable)
	frame:SetIcon(icon)
	frame:ShowCloseButton(showCloseButton)
	frame.OnClose = OnClose

	frame.getX = getX 
	frame.getWidth = getWidth
	frame.getHeight = getHeight
	frame.getState = getState
	frame.getCentered = getCentered
	frame.getParent = getParent

	if centered then 
		frame:Center()
	end

	return frame
end