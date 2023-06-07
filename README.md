# Projeto (em dupla)
## Unidade Lógica Aritmética - ALU

Uma unidade aritmética lógica (arithmetic – logic unit) ALU é um módulo capaz de realizar um conjunto de funções aritméticas e lógicas. Para isso, uma ALU possui vetores de entrada/saída de dados, bem como entradas e saídas de controle. A Figura 1 mostra uma possível especificação de uma ALU de 4 bits.

![Figura 1: ALU de 4 bits](https://uploaddeimagens.com.br/images/004/499/122/full/imagem_2023-06-07_185118522.png?1686174837)

A ALU da Figura 1 possui entradas (A e B) de 4 bits, e s0 e s1 são sinais de controle para selecionar a operação (ver Tabela 1 a seguir). A saída F de 4 bits contém o resultado da operação. Z é 1 se o resultado da operação for zero, e 0 caso contrário.

Os sinais C, V e N são 0 para operações lógicas e possuem o seguinte significado para operações aritméticas: C é 1 se houver um carry-out em operações de soma, V é 1 se houver overflow e N é igual a 1 se o resultado for negativo. C, V e N são 0 nos demais casos.

![Tabela 1: Operações ALU](https://uploaddeimagens.com.br/images/004/499/123/original/imagem_2023-06-07_185316518.png?1686174950)

### Implementação da ALU

Usando o somador ripple-carry, implemente uma ALU de quatro bits (`alu.vhd`) com as operações descritas pela Tabela 1. A ALU deve implementar as operações de soma e subtração utilizando o mesmo ripple-carry (ou seja, instanciá-lo apenas uma vez). Não utilize pacotes (packages).

