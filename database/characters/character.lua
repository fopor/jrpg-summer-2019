local Character = new (Object) {
   maxHp=1,
   hpAtual=1,
   avatar=nil,
   atkFis=1,
   speed = 1,
   action_cd = 0,
   energy = 1,
   maxEnergy = 1,
}       

function Character:init() 
    self.hpAtual = self.maxHp
    self.energy = self.maxEnergy
end
-------------------------------VIVO-----------------------
function Character:estouVivo()
    if self.hpAtual <= 0 then
        return false      
    end
    return true
end
-------------------------------------------------------------

function Character:darDano(alvo)
    alvo:levarDano(self.atkFis)
    return self.atkFis
end

function Character:levarDano(dano)
    self.hpAtual=self.hpAtual-dano
    print('HP de ' .. self.name .. ' = ' .. self.hpAtual .. '/' .. self.maxHp)
    print(self.name .. ' levou ' .. dano .. ' de dano')
end

function Character:updateInfo()
    self.avatar.lifebar.value = self.hpAtual/self.maxHp
    self.avatar.lifebar.text = self.hpAtual .. ' / ' .. self.maxHp
    self.avatar.lifebar.e_value = self.energy/self.maxEnergy
end

return Character

