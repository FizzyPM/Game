push = require 'push'
Class = require 'class'
require 'Paddle'
require 'Ball'
WinHeight =720
WinWidth =1280
VirtualH=243
VirtualW=432
PaddleSpeed=200

function love.load()
	love.graphics.setDefaultFilter('nearest','nearest')
	love.window.setTitle('Pong')
	math.randomseed(os.time())
	smallfont = love.graphics.newFont('font.ttf',8)
	scorefont = love.graphics.newFont('font.ttf',32)
	love.graphics.setFont(smallfont)
	push:setupScreen(VirtualW,VirtualH,WinWidth,WinHeight,{
		fullscreen=false,resizable=false,vsync=true})
	score1=0
	score2=0

	player1 = Paddle(10, 30, 5, 20)
    player2 = Paddle(VirtualW - 10, VirtualH - 30, 5, 20)
	ball=Ball(VirtualW/2-2,VirtualH/2-2,4,4)

	gamestate='start'
end

function love.update(dt)
	--player1
	if love.keyboard.isDown('w') then
		player1.dy= -PaddleSpeed
	elseif love.keyboard.isDown('s') then
		player1.dy= PaddleSpeed
	else
		player1.dy=0
	end
	--player2
	if love.keyboard.isDown('up') then
		player2.dy= -PaddleSpeed
	elseif love.keyboard.isDown('down') then
		player2.dy= PaddleSpeed
	else 
		player2.dy=0
	end
	--ball
	if gamestate=='play' then
		ball:update(dt)
	end
	player1:update(dt)
	player2:update(dt)
end

function love.keypressed(k)
	if k=='escape' then
		love.event.quit()
	elseif k=='enter' or k=='return' then
		if gamestate=='start' then
			gamestate='play'
		else
			gamestate='start'
			ball:reset()
		end
	end
end

function love.draw()
	push:apply('start')
	love.graphics.clear(40,45,52,255)
	love.graphics.setFont(smallfont)
	if gamestate=='start' then
		love.graphics.printf('Hello Start State!',0,20,VirtualW,'center')
	else
		love.graphics.printf('Hello Play State!',0,20,VirtualW,'center')
	end
	love.graphics.setFont(scorefont)
	love.graphics.print(tostring(score1), VirtualW/2-50,VirtualH/3)
    love.graphics.print(tostring(score2), VirtualW/2+30,VirtualH/3)
	player1:render()
	player2:render()
	ball:render()

	displayFPS()
	push:apply('end')
end

function displayFPS()
	love.graphics.setFont(smallfont)
	love.graphics.setColor(0,255,0,255)
	love.graphics.print('FPS:' .. tostring(love.timer.getFPS()),10,10)
end