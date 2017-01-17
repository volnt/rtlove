Sphere = {}
Sphere.__index = Sphere

function Sphere.new(position, radius)
   local self = setmetatable({}, Sphere)
   self.position = position
   self.radius = radius
   return self
end

function Sphere.in_raytrace(self, origin, direction)
   return ((direction .. (origin - self.position)) ^ 2 -
              ((origin - self.position):len()) ^ 2 + self.radius ^ 2) > 0
end
