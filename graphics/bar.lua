
local BG_COLOR = { .4, .4, .4 }

local Bar = new 'graphics.drawable' {
  radius = 64,
  value = 1,
  start_angle = 0,
  size_angle = math.pi,
  color = nil,
  text = 'no_text',
  e_value = 0,
}

function Bar:init()
  self.color = self.color or { .2, .2, .8 }
end

function Bar:onDraw()
  local g = love.graphics
  g.print(self.text, 0, -60)

  -- life bar
  g.setLineWidth(8)
  g.setColor(BG_COLOR)
  g.arc('line', 'open', 0, 0, self.radius, self.start_angle,
        self.start_angle + self.size_angle)
  g.setColor(self.color)
  g.arc('line', 'open', 0, 0, self.radius, self.start_angle,
        self.start_angle + self.value * self.size_angle)

  -- energy bar
  g.setColor(BG_COLOR)
  g.arc('line', 'open', self.X_OFFSET, self.Y_OFFSET, self.radius, self.start_angle,
        self.start_angle + self.size_angle)
  g.setColor({ .8, .8, .8 })
  g.arc('line', 'open', self.X_OFFSET, self.Y_OFFSET, self.radius, self.start_angle,
        self.start_angle + self.e_value * self.size_angle)
end

return Bar

