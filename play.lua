push = require 'push'
WinHeight =720
WinWidth =1280
VirtualH=243
VirtualW=432

function love.load()
	love.graphics.setDefaultFilter('nearest','nearest')
	smallfont = love.graphics.newFont('font.ttf',8)
	love.graphics.setFont(smallfont)
	push:setupScreen(VirtualW,VirtualH,WinWidth,WinHeight,{
		fullscreen=false,resizable=false,vsync=true})
end

function love.keypressed(k)
	if k=='escape' then
		love.event.quit()
	end
end

function love.draw()
	push:apply('start')
	love.graphics.clear(40,45,52,255)
	love.graphics.printf('Hello Pong!',0,20,VirtualW,'center')
	love.graphics.rectangle('fill', 10, 30, 5,20)
	love.graphics.rectangle('fill', VirtualW-10,VirtualH-50, 5,20)
	love.graphics.rectangle('fill', VirtualW/2-2,VirtualH/2-2,4,4)
	push:apply('end')
end