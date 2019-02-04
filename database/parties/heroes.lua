local party_num = math.random(1,3)

if party_num == 3 then
  return {
    new 'database.characters.indio' {},
    new 'database.characters.dragon' {},
    new 'database.characters.fighter' {},
    new 'database.characters.wizard' {},
  }
end

if party_num == 2 then
  return {
    new 'database.characters.vampire' {},
    new 'database.characters.wizard' {},
    new 'database.characters.ranger' {},
    new 'database.characters.dragon' {},
  }
end

if party_num == 1 then
  return {
    new 'database.characters.ranger' {},
    new 'database.characters.fighter' {},
    new 'database.characters.wizard' {},
    new 'database.characters.vampire' {},
  }
end
