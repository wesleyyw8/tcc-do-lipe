DROP DATABASE dbmesaj;
CREATE DATABASE dbmesaj;
USE dbmesaj;

CREATE TABLE AMBIENTE 
   (	
      ID_AMB INT unsigned NOT NULL AUTO_INCREMENT, 
	    NOME_AMB VARCHAR (150) NOT NULL,
      key (NOME_AMB),
      PRIMARY KEY (ID_AMB)
   );

Insert into AMBIENTE (NOME_AMB) values ('Interno');
Insert into AMBIENTE (NOME_AMB) values ('Externo');
Insert into AMBIENTE (NOME_AMB) values ('Híbrido');
Insert into AMBIENTE (NOME_AMB) values ('Aquático');


CREATE TABLE CLASSIFICACAO_ETARIA
   (  
    ID_CLASS INT unsigned NOT NULL AUTO_INCREMENT,
    NOME_CLASS VARCHAR (150) NOT NULL,
    key (NOME_CLASS),
    PRIMARY KEY (ID_CLASS)
   ); 

Insert into CLASSIFICACAO_ETARIA (NOME_CLASS) values ('Primario');
Insert into CLASSIFICACAO_ETARIA (NOME_CLASS) values ('Fundamental');
Insert into CLASSIFICACAO_ETARIA (NOME_CLASS) values ('Médio');


CREATE TABLE MATERIA 
   (  
    ID_MATERIA INT UNSIGNED NOT NULL AUTO_INCREMENT,
    NOME_MATERIA VARCHAR(150) NOT NULL,
      key (NOME_MATERIA),
    PRIMARY KEY (ID_MATERIA)
   ); 

Insert into MATERIA (NOME_MATERIA) values ('Geometria');
Insert into MATERIA (NOME_MATERIA) values ('Aritmética');
Insert into MATERIA (NOME_MATERIA) values ('Frações');
Insert into MATERIA (NOME_MATERIA) values ('Conjuntos');
Insert into MATERIA (NOME_MATERIA) values ('Álgebra');
Insert into MATERIA (NOME_MATERIA) values ('Funções');
Insert into MATERIA (NOME_MATERIA) values ('Trabalho em Equipe');
Insert into MATERIA (NOME_MATERIA) values ('Liderança');
Insert into MATERIA (NOME_MATERIA) values ('Raciocinio Lógico');

CREATE TABLE PORTE
   (  
    ID_PORTE INT UNSIGNED NOT NULL AUTO_INCREMENT,
    NOME_PORTE VARCHAR(150) NOT NULL,
      key (NOME_PORTE),
    PRIMARY KEY (ID_PORTE)
   ) ;
Insert into PORTE (NOME_PORTE) values ('Pequeno');
Insert into PORTE (NOME_PORTE) values ('Médio');
Insert into PORTE (NOME_PORTE) values ('Grande');
Insert into PORTE (NOME_PORTE) values ('Indiferente');

CREATE TABLE TIPO
   (  
    ID_TIPO INT UNSIGNED NOT NULL AUTO_INCREMENT, 
    NOME_TIPO VARCHAR(150) NOT NULL,
      key (NOME_TIPO),
    primary KEY (ID_TIPO)
   );

Insert into TIPO (NOME_TIPO) values ('Tabuleiro');
Insert into TIPO (NOME_TIPO) values ('Cartas');
Insert into TIPO (NOME_TIPO) values ('Social');
Insert into TIPO (NOME_TIPO) values ('Pega Bandeira');
Insert into TIPO (NOME_TIPO) values ('Monge');

CREATE TABLE BRINCADEIRA
   (  
    ID_BRINC INT NOT NULL AUTO_INCREMENT, 
    NOME_BRINC VARCHAR(150) NOT NULL, 
    DESC_BRINC VARCHAR(4000) NOT NULL, 
    APLICACAO_BRINC VARCHAR(4000) NOT NULL, 
    AMB varchar(150) NOT NULL, 
    CLASS varchar(150) NOT NULL, 
    MAT varchar(150) NOT NULL, 
    TIPO varchar(150) NOT NULL, 
    PORTE varchar(150) NOT NULL,
    PRIMARY KEY(ID_BRINC),
    FOREIGN KEY (AMB) REFERENCES AMBIENTE (NOME_AMB),
    FOREIGN KEY (CLASS) REFERENCES CLASSIFICACAO_ETARIA (NOME_CLASS),
    FOREIGN KEY (MAT) REFERENCES MATERIA(NOME_MATERIA),
    FOREIGN KEY (TIPO) REFERENCES TIPO(NOME_TIPO),
    FOREIGN KEY (PORTE) REFERENCES PORTE(NOME_PORTE)
   );

Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('Jogo dos Intervalos','Material: 
Molduras A e B
 
Placas transparentes vermelhas e azuis
 
Envelopes contendo os desafios
 
Papel e lápis
 
Regras:
Um representante do time I sorteia um envelope, lê o desafio, e mostra a carta ao time oposto (II);
Os integrantes do time II representam os intervalos A e B nas respectivas molduras, utilizando as placas vermelhas para o intervalo A, e as azuis para o intervalo B;
Colocando uma placa sobre a outra, verifica-se a operação do desafio de acordo com as cores:
A – B: somente a(s) área(s) apenas em vermelho deve(m) ser considerada(s)
B – A: somente a(s) área(s) apenas em azul deve(m) ser considerada(s)
A U B: toda a região colorida deve ser considerada (vermelho, azul e vermelho sobre azul)
A n B: apenas a área coberta por ambas as placas vermelha e azul deve ser considerada. 
Os integrantes do time II devem então escrever o intervalo resposta da operação, observando no cartão desafio os limites do intervalo, e discutindo se devem ser abertos ou fechados;
Os integrantes do time oposto abrem o cartão desafio e verificam a resposta;
Anota-se os pontos e os times invertem os papéis.
Pontuação
1 ponto para cada intervalo representado corretamente (A e B)
3 pontos para resposta correta final da operação (idêntica à apresentada no cartão)
Vence o time com mais pontos quando todos os desafios tiverem sido abertos.','Promover maior assimilação da representação de intervalos reais e operações com os mesmos por meio de atividade lúdica.','Interno','Médio','Conjuntos','Tabuleiro','Indiferente');
Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('Hexágono Algébrico','Materiais: Um tabuleiro, dados numerados com faces (-2; -1; 0; 1; 2; 3), marcadores.

1. Os jogadores decidem quem inicia o jogo (sugestão: par ou ímpar). Cada jogador lança o dado na sua vez, em seguida substitui, na primeira expressão algébrica do jogo que está na casa INICIO, o número que saiu no dado. Avança tantas casas quanto for o valor calculado. Caso o resultado da operação seja zero, permanece na mesma casa.
2. Se com o resultado o marcador cair na casa vazia (sem expressão), o jogador deverá colocar seu marcador na casa anterior (onde contém uma expressão) e lá permanecerá até a próxima jogada.
3. A partir da segunda rodada, o jogador deverá substituir o valor do dado na expressão da casa onde seu marcador se encontra. Sendo o resultado positivo, o jogador deverá avançar à quantidade de casas correspondente ao resultado da expressão. Sendo negativo, o jogador deverá voltar a quantidade de casas também correspondente ao resultado da expressão.
4. O ganhador será o jogador que primeiro completar uma volta no tabuleiro. Para ganhar o jogo, é necessário tirar um número maior ou exato de casas para atingir o FIM do percurso.
','Desenvolver habilidades envolvendo expressões algébricas e números inteiros.','Interno','Fundamental','Álgebra','Tabuleiro','Pequeno');
Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('Batalha Naval de Ângulos','Este é um jogo para ser realizado em duplas, semelhante ao jogo batalha naval, no qual os alunos devem estimar as medidas dos ângulos para localizar um
 ponto.
Cada jogador recebe um tabuleiro no qual deve marcar 12 embarcações que
 correspondem a 12 pontos.
O tabuleiro com as marcações não pode ser visto pelo adversário.
Portanto, (3,0º) e (3,360º) correspondem ao mesmo ponto no tabuleiro. Se julgarem necessário, os jogadores poderão usar o transferidor.
O jogador deve informar seu adversário sobre o ponto atingido, dizendo “Afundou”, semo tiro acertou uma embarcação, e “Água”, se o tiro não acertou. O adversário então deve fazer uma marcação no ‘Campo Adversário’ registrando se o ponto questionado foi um acerto ou água.
O vencedor é o primeiro que afundar toda a frota do adversário.','Relacionar os conceitos de ângulo e coordenadas do plano, assim como levar o aluno a perceber a ideia de ângulo como abertura, e estimular a estimativa como estratégia para que os alunos descubram as medidas dos ângulos.','Interno','Fundamental','Geometria','Tabuleiro','Pequeno');
Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('Velha das Funções','O jogo consiste em 9 cartas num tabuleiro, onde cada carta representa um tipo de função ao qual o aluno deverá resolver, estando o resultado correto o ponto fica para si, e uma peça, é colocada no tabuleiro; enquanto que, se ele errar, o adversário ganha a chance de colocar a sua própria peça no tabuleiro. Até que um dos dois complete uma coluna, linha ou diagonal com todas as suas peças durante o jogo, obtendo assim, uma velha como no jogo já conhecido.
','Podemos definir equação como uma sentença matemática que possui igualdade entre duas expressões algébricas e uma ou mais variáveis, ou incógnitas (valores desconhecidos) que são expressadas por letras. Resolver uma equação é encontrar todos os valores possíveis para a incógnita que tornem a igualdade verdadeira.
Objetivo do Jogo: O jogo tem por objetivo incentivar o aluno a verificar seus conhecimentos com funções, e ao mesmo tempo fazê-lo pensar sobre uma estratégia para vencer seu adversário num jogo da velha comum.','Interno','Médio','Funções','Tabuleiro','Pequeno');
Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('Quadrado Mágico','Montar um tabuleiro em forma de jogo da velha e recortar numeros que possibilitem a realização da atividade, sugestão: 3, 5, 4, 9, 9, 8, 7, 2, 1
Colocar as fichas no tabuleiro de tal forma que a soma das 3 linhas, das 3 colunas e das 2 diagonais seja igual a 15.','O quadrado mágico é uma atividade de tentativa e erro. Não é fácil, é desafiador. O jogo consiste em explorar as possibilidades e coordenar ao mesmo tempo, a soma das linhas, colunas e diagonais.','Interno','Primario','Aritmética','Tabuleiro','Pequeno');
Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('Losango ímpar','Tabuleiro em formato de losango
Peças numeradas de 1 a 8

Regras.
2 participantes
Embaralhar as peças viradas para baixo
Empilhar as peças ainda viradas para baixo
Decide quem irá começar jogando
O primeiro participante pega a primeira peça da pilha e escolhe um triângulo do tabuleiro para colocar a peça
O próximo deve colocar a peça em uma das casas adjacentes a peça colocada anteriormente de modo a obter soma ímpar
A cada jogada anota-se o número de pontos obtidos (soma dos números das duas últimas casas)
O jogo acaba quando um dos participantes não puder colocar mais peças
Ganha o jogo quem obtiver a maior soma.','Obter um número ímpar através da soma','Interno','Primario','Aritmética','Tabuleiro','Pequeno');
Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('Números e Frações','Regras: O jogo é dividido em rodadas e cada uma delas possui 7 etapas.
São necessários dois jogadores. Mas antes de começar é preciso iniciar a preparação:
Cada Jogador embaralha seu próprio deck e, em seguida, compra 5 cartas. Feito isso, basta decidir de forma aleatória quem começa o jogo e seguir as etapas.
1ª ETAPA: O primeiro jogador escolhe uma das cartas em sua mão e a joga, o segundo jogador pode optar por cancelar o efeito da carta jogada, descartando assim de sua mão uma carta do mesmo tipo da carta jogada e que possua um valor igual ou superior. Caso a carta jogada não tenha sido cancelada ela ativa seu efeito.
2ª ETAPA: O segundo jogador escolhe uma das cartas em sua mão e a joga, o primeiro jogador pode optar por cancelar a carta jogada (nas mesmas condições citadas acima).
Caso a carta não seja cancelada ela ativa seu efeito.
3ª ETAPA: Repete-se a 1ª ETAPA.
4ª ETAPA: Repete-se a 2ª ETAPA.
5ª ETAPA: Caso tenham sido utilizadas CARTAS +, nesta rodada, as mesmas devem ser removidas de jogo imediatamente. Em seguida, deve-se descartar as demais cartas nas pilhas de descarte apropriadas.
6ª ETAPA: Cada jogador compra 7 novas cartas (se possível).
7ª ETAPA: Se ainda existirem cartas em ambos os decks, inicia-se uma nova rodada. Caso contrário, o jogador que possuir mais pontos é o vencedor.
REGRA DA SOMA:
Uma vez por rodada, cada jogador poderá somar duas cartas iguais (no caso das frações elas deverão possuir o mesmo denominador), para cancelar uma carta jogada pelo adversário.
AS CARTAS:
CARTAS DE FRAÇÃO: o efeito da carta de fração faz com que seu adversário tenha de descartar aquela quantidade (fração) de cartas de seu deck (sempre arredondando esse
valor para baixo, caso necessário). Para cada carta descartada desta maneira, o jogador que jogou a CARTA DE FRAÇÃO ganhará 1 PONTO por carta descartada.
CARTAS DE PORCENTAGEM: o efeito desta carta faz com que seu adversário tenha de descartar aquela quantidade (porcentagem) de cartas de seu deck (sempre arredondando esse valor para baixo, caso necessário). Para cada carta descartada desta maneira, o jogador que jogou a CARTA DE PORCENTAGEM ganhará 2 PONTOS, por carta descartada.
CARTAS +: o efeito desta carta faz com que quem a jogou selecione (aleatoriamente) uma quantidade de cartas de sua pilha de descarte iguais ao impresso na carta jogada
e as coloque no fundo de seu deck (caso não haja cartas o suficiente, o jogador deverá retornar tantas quanto possível). Para cada carta retornada desta maneira, o jogador que a jogou a CARTA + ganhará 3 PONTOS por carta retornada para o deck.','O jogo tem por objetivo fazer com que o aluno aprenda e fixe o conceito de frações, em uma partida em que deverá utilizar as cartas em sua posse juntamente com uma estratégia própria para fazer mais pontos que seu oponente, antes que um dos baralhos acabe.','Interno','Fundamental','Frações','Cartas','Pequeno');
Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('Dorminhoco Matemático','O Regras do Jogo: Divisão dos alunos em grupos de quatro elementos. Esse é um jogo de cartas no qual primeiramente as cartas são embaralhadas e depois são divididas entre os participantes. Todos os alunos do grupo receberão três cartas e um receberá quatro cartas. O aluno que recebeu quatro cartas será quem iniciará o jogo. Atrás de 61 cada carta tem uma função, um zero da função e a representação de um gráfico, e uma das cartas tem a palavra “Dorminhoco”. Quem recebe esta carta tem que ficar uma rodada com ela. No momento que os alunos recebem as cartas devem analisar se a função, o zero e o gráfico estão corretos; se algum estiver errado, quando for sua vez de jogar você passa esta carta adiante. Quando você estiver formado o trio correto abaixa as cartas, o último que abaixar perde e é o Dorminhoco.','O jogo Dorminhoco Matemático consiste em uma atividade a qual contém cartas com funções, zeros da função e gráficos. O objetivo neste jogo é fazer com que os alunos encontrem o zero da função e gráfico referente a cada função dada. Neste jogo vamos trabalhar com os zeros e com gráficos envolvendo funções do 1º e do 2º grau.
Objetivos: - calcular corretamente os zeros das funções do 1º e do 2º grau; - reconhecer os gráficos das funções.','Interno','Médio','Funções','Cartas','Pequeno');
Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('Soma 28','O(s) jogador(es) devem completar o quadrado utilizando todas as peças;
Cada algarismo só pode surgir uma única vez no quadrado;
Cada linha, coluna e diagonal deve totalizar a soma do número 28;
Se alguma linha, coluna ou diagonal não totalizar a soma do número 28, o quadrado está errado e a peça deve ser trocada;
O jogo termina com o preenchimento de todas as dezesseis casas do tabuleiro.
De quantas maneiras diferentes é possível distribuir os números na tabela 4x4 mantendo a soma 28?','Distribuir os algarismos 2, 5, 6, 8 e 9 na tabela 4x4, de modo a manter a soma 28 no quadrado, isto é, a soma das linhas, das colunas e das diagonais seja sempre 28.','Interno','Primario','Aritmética','Tabuleiro','Pequeno');
