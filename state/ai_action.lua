
local AiAction = new 'state.base' {}

function AiAction:onEnter(battle)
  self.graphics = battle.graphics
  self.battle = battle
  
  self.action = 'attack'
  self.targets = { unpack(self.battle.right.characters) }
  --self.stack:push('choose_target', self.battle, self.targets)
  self.target = self.targets[math.random(1, #self.targets)]
  self.stack:pop()
  battle:setNextAction(self.action, { target = self.target })

  local current = battle.left.characters[battle.current_char]

  print(current.name .. battle.current_char .. ' turn, ataking ' .. self.target.name)

  local dano = current:darDano(self.target)
  battle.danoDado = dano

  self.action = nil
  self.targets = nil

end

function AiAction:onResume()
    self.stack:pop()
end

return AiAction
