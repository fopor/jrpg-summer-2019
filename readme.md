# JRPG SUMMER 2019

# Descrição
 Projeto do curso de verão de desenvolvimento de jogos na engine Love2D.

# Mecânicas adicionadas
* Personagem: tipo Character criado, com os atributos vida atual e vida máxima, sendo que o método init define que a vida atual começa sendo igual à vida máxima. O método updateInfo atualiza a barra de vida para todos os Characters de acordo com o hp atual

* Ataque: a ação de ataque reduz a vida do alvo a partir de um valor fixo

* Morte: se um personagem tem zero ou menos de vida ele é removido do vetor de personagens 

* Poder: cada personagem tem o atributo 'atkFis' que representa seu poder. Tal valor está determinado no banco de dados. O dano do ataque é calculado a partir do atributo 'atkFis'.

* Velocidade: cada personagem tem o atributo 'speed' que representa sua velocidade (falta definir uma diferente pra cada character)

* Energia: o tipo Character possui o atributo 'energia', todo personagem começa com a energia atual igual à máxima e esta é determinada no banco de dados.

* Barra de energia: há uma barra de energia, assim como a barra de vida. O tamanho da barra é determinado pela fração que a energia atual representa da total.

* Turno dos Monstros: cada slime tem seu turno para atacar
