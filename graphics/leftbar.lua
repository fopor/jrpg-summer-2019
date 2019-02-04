
local START_ANGLE = 5 * math.pi / 8
local SIZE_ANGLE = math.pi / 3

local LeftBar = new 'graphics.bar' {
  start_angle = START_ANGLE,
  size_angle = SIZE_ANGLE,
  X_OFFSET = -20,
  Y_OFFSET = 5
}

return LeftBar

