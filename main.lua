require('point')
require('scene')
require('sphere')

function love.draw()
   love.graphics.print("Hello World!", 400, 300)
end

function love.load()
   scene = Scene.new()
   scene:add_object(Sphere.new(Point.new(200, 150, 100), 30))
end

function love.draw()
   scene:draw()
end
