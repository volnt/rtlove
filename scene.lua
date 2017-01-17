require('point')

Scene = {}
Scene.__index = Scene

function Scene.new()
   local self = setmetatable({}, Scene)
   self.objects = {}
   self.camera = {
      direction=Point.new(0, 0, 1),
      size={love.graphics.getWidth(), love.graphics.getHeight()}
   }
   return self
end

function Scene.add_object(self, object)
   table.insert(self.objects, object)
end

function Scene.draw(self)
   for x=0, love.graphics.getWidth() do
      for y=0, love.graphics.getHeight() do
         for _, object in ipairs(self.objects) do
            if object:in_raytrace(Point.new(x, y, 0), self.camera.direction) then
               love.graphics.points(x, y)
            end
         end
      end
   end
end
