WinWidth=1280
WinHeight=720

function love.load()
	love.window.setMode(WinWidth,WinHeight,{
		fullscreen=false,
		resizable=false,
		vsync=true
		})
end

function love.draw()
	love.graphics.printf('Hello Pong!',0,WinHeight/2-6,WinWidth,'center')
end