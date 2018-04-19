push = require 'push'
WinHeight =720
WinWidth =1280
VirtualH=243
VirtualW=432
PaddleSpeed=200

function love.load()
	love.graphics.setDefaultFilter('nearest','nearest')
	math.randomseed(os.time())
	smallfont = love.graphics.newFont('font.ttf',8)
	scorefont = love.graphics.newFont('font.ttf',32)
	love.graphics.setFont(smallfont)
	push:setupScreen(VirtualW,VirtualH,WinWidth,WinHeight,{
		fullscreen=false,resizable=false,vsync=true})
	score1=0
	score2=0

	player1y=30
	player2y=VirtualH-50

	ballx= VirtualW/2-2
	bally= VirtualH/2-2
	balldx= math.random(2) == 1 and 100 or -100 	-- if ==1 then 100 else -100						
	balldy= math.random(-50, 50)
	gamestate='start'

end

function love.update(dt)
	--player1
	if love.keyboard.isDown('w') then
		player1y=math.max(0,player1y+ -PaddleSpeed *dt)
	elseif love.keyboard.isDown('s') then
		player1y=math.min(VirtualH-20,player1y+ PaddleSpeed*dt)
	end
	--player2
	if love.keyboard.isDown('up') then
		player2y=math.max(0,player2y+ -PaddleSpeed *dt)
	elseif love.keyboard.isDown('down') then
		player2y=math.min(VirtualH-20,player2y+ PaddleSpeed*dt)
	end
	--ball
	if gamestate=='play' then
		ballx=ballx+balldx*dt
		bally=bally+balldy*dt
	end
end

function love.keypressed(k)
	if k=='escape' then
		love.event.quit()
	elseif k=='enter' or k=='return' then
		if gamestate=='start' then
			gamestate='play'
		else
			gamestate='start'
			ballx= VirtualW/2-2
			bally= VirtualH/2-2
			balldx= math.random(2) == 1 and 100 or -100 	-- if ==1 then 100 else -100						
			balldy= math.random(-50, 50)*1.5
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
	love.graphics.rectangle('fill', 10, player1y, 5,20)
	love.graphics.rectangle('fill', VirtualW-10,player2y, 5,20)
	love.graphics.rectangle('fill',ballx,bally,4,4)
	push:apply('end')
end