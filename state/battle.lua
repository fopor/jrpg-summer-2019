
local Battle = new 'state.base' {
  graphics = nil,
  current_party = 'right',
  current_char = 1,
  next_action = nil,
  delay = 0
}

function Battle:onEnter(graphics)
  self.graphics = graphics
  graphics:add('bg', new 'graphics.arena' {})
  self:loadParty('right', 'heroes')
  self:loadParty('left', 'slimes01')
end

function Battle:loadParty(side, name)
  local W, H = love.graphics.getDimensions()
  local charnames = require('database.parties.' .. name)
  local party = {
    characters = {}
  }
  
  for i, charname in ipairs(charnames) do
    local x
    if side == 'right' then x = W - 480 + 80 * i
    elseif side == 'left' then x = 480 - 80 * i end
   
    party.characters[i] = charname
    
    local new_avatar = new 'graphics.avatar' {
        charactername = charname.name,
        side = side,
        position = new(Vec) { x, i * 120 },
        drawables = {}
    }
    
    party.characters[i].avatar = new_avatar
    
    
    self.graphics:add('entities', party.characters[i].avatar)
  end
  
  self[side] = party
end

function Battle:updateBar()
  local sides = {'left', 'right'}

  for _, side in ipairs(sides) do
    for i, char in ipairs(self[side].characters) do
      char:updateInfo()
      print (char:estouVivo())
      if char:estouVivo()==false then
        char.avatar.sprite.visible = false
        char.avatar.lifebar.visible = false
        table.remove(self[side].characters,1)
      end
    end
  end

end
  
function Battle:onResume()
  if self.next_action then
    self.stack:push('execute_action', self, self.next_action)
    self.next_action = nil
  else
    self:currentCharacter().avatar:hideCursor()
    self.current_char = self.current_char % #self.right.characters + 1
  end
end

function Battle:onUpdate(dt)
  self:currentCharacter().avatar:showCursor()
  self.stack:push('choose_action', self)
end

function Battle:currentCharacter()
  self:updateBar()
  return self[self.current_party].characters[self.current_char]
end

function Battle:setNextAction(name, params)
  self.next_action = {
    name = name,
    params = params
  }
end

return Battle

