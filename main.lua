require 'initialize'

Game = {
	SceneManager = nil,
	debug = false,
	timerManager = TimerManager(),
	globalStroage = {},

	getCurrentScene = function ()
		return Game.SceneManager.getNowRunning()
	end,
}

function init()
	Game.SceneManager = SceneManager(Scene_TitleAnim)
end

function love.load()
	love.graphics.setIcon(R.images.appIcon)
	if Game.debug then
		math.randomseed(3336661)
	else
		math.randomseed(os.time())
	end

	init()
end

function love.update(dt)
	Game.timerManager:update(dt)
	Game.SceneManager:update(dt)
end

function love.draw()
	Game.SceneManager:draw()
end

function love.mousepressed(x, y, button)
	Game.SceneManager:onMousePressed(x, y, button)
end

function love.mousereleased(x, y, button)
	Game.SceneManager:onMouseReleased(x, y, button)
end

function love.keypressed(key)
	Game.SceneManager:onKeyPressed(key)
end

function love.keyreleased(key)
	Game.SceneManager:onKeyReleased(key)
end
