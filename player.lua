player = {}

local screenWidth = love.graphics.getWidth()
local screenHeight = love.graphics.getHeight()

function player:new( name )
	local o = {
		x = 16,
		y = height - 132,
		w = 32,
		h = 32,
		imgL = love.graphics.newImage("assets/img/playerLeftSprite.png"),
		imgLStill = love.graphics.newImage("assets/img/playerLeftSpriteStill.png"),
		imgR = love.graphics.newImage("assets/img/playerRightSprite.png"),
		imgRStill = love.graphics.newImage("assets/img/playerRightSpriteStill.png"),
	}
	setmetatable( o, { __index = player } )
	return o
end

function player:update(dt)

end 

function player:draw()

end