push = require 'push'
WinHeight =720
WinWidth =1280
VirtualH=243
VirtualW=432

function love.load()
	love.graphics.setDefaultFilter('nearest','nearest')
	push:setupScreen(VirtualW,VirtualH,WinWidth,WinHeight,{fullscreen=false,resizable=false,vsync=true})
end

function love.keypressed(k)
	if k=='escape' then
		love.event.quit()
	end
end

function love.draw()
	push:apply('start')
	love.graphics.printf('Hello Pong!',0,VirtualH/2-6,VirtualW,'center')
	push:apply('end')
end