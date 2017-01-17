Point = {}
Point.__index = Point

function Point.new(x, y, z)
   local self = setmetatable({}, Point)
   self.x = x
   self.y = y
   self.z = z
   return self
end

-- point comparison
function Point.__eq(self, other)
   return self.x == other.x and self.y == other.y and self.z == other.z
end

-- point addition
function Point.__add(self, other)
   return Point.new(self.x + other.x, self.y + other.y, self.z + other.z)
end

-- point substraction
function Point.__sub(self, other)
   return Point.new(self.x - other.x, self.y - other.y, self.z - other.z)
end

-- unitary minus (e.g in the expression f(-p))
function Point.__unm(self)
   return Point.new(-self.x, -self.y, -self.z)
end

-- scalar multiplication
function Point.__mul(self, other)
   return Point.new(self * other.x, self * other.y, self * other.z)
end

-- scalar division
function Point.__div(p,s)
   return Point.new(other.x / self, other.y / self, other.z / self)
end

-- dot product is '..'
function Point.__concat(self, other)
   return self.x * other.x + self.y * other.y + self.z * other.z
end

-- cross product is '^'
function Point.__pow(self, other)
   return Point.new(
      self.y * other.z - self.z * other.y,
      self.z * other.x - self.x * other.z,
      self.x * other.y - self.y * other.x
   )
end

function Point.normalize(self)
   local l = self:len()
   self.x = self.x / l
   self.y = self.y / l
   self.z = self.z / l
end

function Point.set(self, x, y, z)
   if type(x) == 'table' and getmetatable(x) == Point then
      local point = x
      x = point.x
      y = point.y
      z = point.z
   end

   self.x = x
   self.y = y
   self.z = z
end

function Point.translate(self, x, y, z)
   self.x = self.x + x
   self.y = self.y + y
   self.z = self.z + z
end

function Point.__tostring(self)
   return string.format('(%f,%f,%f)', self.x, self.y, self.z)
end

function Point.len(self)
   return math.sqrt(self.x ^ 2 + self.y ^ 2 + self.z ^ 2)
end
