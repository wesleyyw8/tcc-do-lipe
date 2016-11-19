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
Insert into AMBIENTE (NOME_AMB) values ('H�brido');
Insert into AMBIENTE (NOME_AMB) values ('Aqu�tico');


CREATE TABLE CLASSIFICACAO_ETARIA
   (  
    ID_CLASS INT unsigned NOT NULL AUTO_INCREMENT,
    NOME_CLASS VARCHAR (150) NOT NULL,
    key (NOME_CLASS),
    PRIMARY KEY (ID_CLASS)
   ); 

Insert into CLASSIFICACAO_ETARIA (NOME_CLASS) values ('Primario');
Insert into CLASSIFICACAO_ETARIA (NOME_CLASS) values ('Fundamental');
Insert into CLASSIFICACAO_ETARIA (NOME_CLASS) values ('M�dio');


CREATE TABLE MATERIA 
   (  
    ID_MATERIA INT UNSIGNED NOT NULL AUTO_INCREMENT,
    NOME_MATERIA VARCHAR(150) NOT NULL,
      key (NOME_MATERIA),
    PRIMARY KEY (ID_MATERIA)
   ); 

Insert into MATERIA (NOME_MATERIA) values ('Geometria');
Insert into MATERIA (NOME_MATERIA) values ('Aritm�tica');
Insert into MATERIA (NOME_MATERIA) values ('Fra��es');
Insert into MATERIA (NOME_MATERIA) values ('Conjuntos');
Insert into MATERIA (NOME_MATERIA) values ('�lgebra');
Insert into MATERIA (NOME_MATERIA) values ('Fun��es');
Insert into MATERIA (NOME_MATERIA) values ('Trabalho em Equipe');
Insert into MATERIA (NOME_MATERIA) values ('Lideran�a');
Insert into MATERIA (NOME_MATERIA) values ('Raciocinio L�gico');

CREATE TABLE PORTE
   (  
    ID_PORTE INT UNSIGNED NOT NULL AUTO_INCREMENT,
    NOME_PORTE VARCHAR(150) NOT NULL,
      key (NOME_PORTE),
    PRIMARY KEY (ID_PORTE)
   ) ;
Insert into PORTE (NOME_PORTE) values ('Pequeno');
Insert into PORTE (NOME_PORTE) values ('M�dio');
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
 
Papel e l�pis
 
Regras:
Um representante do time I sorteia um envelope, l� o desafio, e mostra a carta ao time oposto (II);
Os integrantes do time II representam os intervalos A e B nas respectivas molduras, utilizando as placas vermelhas para o intervalo A, e as azuis para o intervalo B;
Colocando uma placa sobre a outra, verifica-se a opera��o do desafio de acordo com as cores:
A � B: somente a(s) �rea(s) apenas em vermelho deve(m) ser considerada(s)
B � A: somente a(s) �rea(s) apenas em azul deve(m) ser considerada(s)
A U B: toda a regi�o colorida deve ser considerada (vermelho, azul e vermelho sobre azul)
A n B: apenas a �rea coberta por ambas as placas vermelha e azul deve ser considerada. 
Os integrantes do time II devem ent�o escrever o intervalo resposta da opera��o, observando no cart�o desafio os limites do intervalo, e discutindo se devem ser abertos ou fechados;
Os integrantes do time oposto abrem o cart�o desafio e verificam a resposta;
Anota-se os pontos e os times invertem os pap�is.
Pontua��o
1 ponto para cada intervalo representado corretamente (A e B)
3 pontos para resposta correta final da opera��o (id�ntica � apresentada no cart�o)
Vence o time com mais pontos quando todos os desafios tiverem sido abertos.','Promover maior assimila��o da representa��o de intervalos reais e opera��es com os mesmos por meio de atividade l�dica.','Interno','M�dio','Conjuntos','Tabuleiro','Indiferente');
Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('Hex�gono Alg�brico','Materiais: Um tabuleiro, dados numerados com faces (-2; -1; 0; 1; 2; 3), marcadores.

1. Os jogadores decidem quem inicia o jogo (sugest�o: par ou �mpar). Cada jogador lan�a o dado na sua vez, em seguida substitui, na primeira express�o alg�brica do jogo que est� na casa INICIO, o n�mero que saiu no dado. Avan�a tantas casas quanto for o valor calculado. Caso o resultado da opera��o seja zero, permanece na mesma casa.
2. Se com o resultado o marcador cair na casa vazia (sem express�o), o jogador dever� colocar seu marcador na casa anterior (onde cont�m uma express�o) e l� permanecer� at� a pr�xima jogada.
3. A partir da segunda rodada, o jogador dever� substituir o valor do dado na express�o da casa onde seu marcador se encontra. Sendo o resultado positivo, o jogador dever� avan�ar � quantidade de casas correspondente ao resultado da express�o. Sendo negativo, o jogador dever� voltar a quantidade de casas tamb�m correspondente ao resultado da express�o.
4. O ganhador ser� o jogador que primeiro completar uma volta no tabuleiro. Para ganhar o jogo, � necess�rio tirar um n�mero maior ou exato de casas para atingir o FIM do percurso.
','Desenvolver habilidades envolvendo express�es alg�bricas e n�meros inteiros.','Interno','Fundamental','�lgebra','Tabuleiro','Pequeno');
Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('Batalha Naval de �ngulos','Este � um jogo para ser realizado em duplas, semelhante ao jogo batalha naval, no qual os alunos devem estimar as medidas dos �ngulos para localizar um
 ponto.
Cada jogador recebe um tabuleiro no qual deve marcar 12 embarca��es que
 correspondem a 12 pontos.
O tabuleiro com as marca��es n�o pode ser visto pelo advers�rio.
Portanto, (3,0�) e (3,360�) correspondem ao mesmo ponto no tabuleiro. Se julgarem necess�rio, os jogadores poder�o usar o transferidor.
O jogador deve informar seu advers�rio sobre o ponto atingido, dizendo �Afundou�, semo tiro acertou uma embarca��o, e ��gua�, se o tiro n�o acertou. O advers�rio ent�o deve fazer uma marca��o no �Campo Advers�rio� registrando se o ponto questionado foi um acerto ou �gua.
O vencedor � o primeiro que afundar toda a frota do advers�rio.','Relacionar os conceitos de �ngulo e coordenadas do plano, assim como levar o aluno a perceber a ideia de �ngulo como abertura, e estimular a estimativa como estrat�gia para que os alunos descubram as medidas dos �ngulos.','Interno','Fundamental','Geometria','Tabuleiro','Pequeno');
Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('Velha das Fun��es','O jogo consiste em 9 cartas num tabuleiro, onde cada carta representa um tipo de fun��o ao qual o aluno dever� resolver, estando o resultado correto o ponto fica para si, e uma pe�a, � colocada no tabuleiro; enquanto que, se ele errar, o advers�rio ganha a chance de colocar a sua pr�pria pe�a no tabuleiro. At� que um dos dois complete uma coluna, linha ou diagonal com todas as suas pe�as durante o jogo, obtendo assim, uma velha como no jogo j� conhecido.
','Podemos definir equa��o como uma senten�a matem�tica que possui igualdade entre duas express�es alg�bricas e uma ou mais vari�veis, ou inc�gnitas (valores desconhecidos) que s�o expressadas por letras. Resolver uma equa��o � encontrar todos os valores poss�veis para a inc�gnita que tornem a igualdade verdadeira.
Objetivo do Jogo: O jogo tem por objetivo incentivar o aluno a verificar seus conhecimentos com fun��es, e ao mesmo tempo faz�-lo pensar sobre uma estrat�gia para vencer seu advers�rio num jogo da velha comum.','Interno','M�dio','Fun��es','Tabuleiro','Pequeno');
Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('Quadrado M�gico','Montar um tabuleiro em forma de jogo da velha e recortar numeros que possibilitem a realiza��o da atividade, sugest�o: 3, 5, 4, 9, 9, 8, 7, 2, 1
Colocar as fichas no tabuleiro de tal forma que a soma das 3 linhas, das 3 colunas e das 2 diagonais seja igual a 15.','O quadrado m�gico � uma atividade de tentativa e erro. N�o � f�cil, � desafiador. O jogo consiste em explorar as possibilidades e coordenar ao mesmo tempo, a soma das linhas, colunas e diagonais.','Interno','Primario','Aritm�tica','Tabuleiro','Pequeno');
Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('Losango �mpar','Tabuleiro em formato de losango
Pe�as numeradas de 1 a 8

Regras.
2 participantes
Embaralhar as pe�as viradas para baixo
Empilhar as pe�as ainda viradas para baixo
Decide quem ir� come�ar jogando
O primeiro participante pega a primeira pe�a da pilha e escolhe um tri�ngulo do tabuleiro para colocar a pe�a
O pr�ximo deve colocar a pe�a em uma das casas adjacentes a pe�a colocada anteriormente de modo a obter soma �mpar
A cada jogada anota-se o n�mero de pontos obtidos (soma dos n�meros das duas �ltimas casas)
O jogo acaba quando um dos participantes n�o puder colocar mais pe�as
Ganha o jogo quem obtiver a maior soma.','Obter um n�mero �mpar atrav�s da soma','Interno','Primario','Aritm�tica','Tabuleiro','Pequeno');
Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('N�meros e Fra��es','Regras: O jogo � dividido em rodadas e cada uma delas possui 7 etapas.
S�o necess�rios dois jogadores. Mas antes de come�ar � preciso iniciar a prepara��o:
Cada Jogador embaralha seu pr�prio deck e, em seguida, compra 5 cartas. Feito isso, basta decidir de forma aleat�ria quem come�a o jogo e seguir as etapas.
1� ETAPA: O primeiro jogador escolhe uma das cartas em sua m�o e a joga, o segundo jogador pode optar por cancelar o efeito da carta jogada, descartando assim de sua m�o uma carta do mesmo tipo da carta jogada e que possua um valor igual ou superior. Caso a carta jogada n�o tenha sido cancelada ela ativa seu efeito.
2� ETAPA: O segundo jogador escolhe uma das cartas em sua m�o e a joga, o primeiro jogador pode optar por cancelar a carta jogada (nas mesmas condi��es citadas acima).
Caso a carta n�o seja cancelada ela ativa seu efeito.
3� ETAPA: Repete-se a 1� ETAPA.
4� ETAPA: Repete-se a 2� ETAPA.
5� ETAPA: Caso tenham sido utilizadas CARTAS +, nesta rodada, as mesmas devem ser removidas de jogo imediatamente. Em seguida, deve-se descartar as demais cartas nas pilhas de descarte apropriadas.
6� ETAPA: Cada jogador compra 7 novas cartas (se poss�vel).
7� ETAPA: Se ainda existirem cartas em ambos os decks, inicia-se uma nova rodada. Caso contr�rio, o jogador que possuir mais pontos � o vencedor.
REGRA DA SOMA:
Uma vez por rodada, cada jogador poder� somar duas cartas iguais (no caso das fra��es elas dever�o possuir o mesmo denominador), para cancelar uma carta jogada pelo advers�rio.
AS CARTAS:
CARTAS DE FRA��O: o efeito da carta de fra��o faz com que seu advers�rio tenha de descartar aquela quantidade (fra��o) de cartas de seu deck (sempre arredondando esse
valor para baixo, caso necess�rio). Para cada carta descartada desta maneira, o jogador que jogou a CARTA DE FRA��O ganhar� 1 PONTO por carta descartada.
CARTAS DE PORCENTAGEM: o efeito desta carta faz com que seu advers�rio tenha de descartar aquela quantidade (porcentagem) de cartas de seu deck (sempre arredondando esse valor para baixo, caso necess�rio). Para cada carta descartada desta maneira, o jogador que jogou a CARTA DE PORCENTAGEM ganhar� 2 PONTOS, por carta descartada.
CARTAS +: o efeito desta carta faz com que quem a jogou selecione (aleatoriamente) uma quantidade de cartas de sua pilha de descarte iguais ao impresso na carta jogada
e as coloque no fundo de seu deck (caso n�o haja cartas o suficiente, o jogador dever� retornar tantas quanto poss�vel). Para cada carta retornada desta maneira, o jogador que a jogou a CARTA + ganhar� 3 PONTOS por carta retornada para o deck.','O jogo tem por objetivo fazer com que o aluno aprenda e fixe o conceito de fra��es, em uma partida em que dever� utilizar as cartas em sua posse juntamente com uma estrat�gia pr�pria para fazer mais pontos que seu oponente, antes que um dos baralhos acabe.','Interno','Fundamental','Fra��es','Cartas','Pequeno');
Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('Dorminhoco Matem�tico','O Regras do Jogo: Divis�o dos alunos em grupos de quatro elementos. Esse � um jogo de cartas no qual primeiramente as cartas s�o embaralhadas e depois s�o divididas entre os participantes. Todos os alunos do grupo receber�o tr�s cartas e um receber� quatro cartas. O aluno que recebeu quatro cartas ser� quem iniciar� o jogo. Atr�s de 61 cada carta tem uma fun��o, um zero da fun��o e a representa��o de um gr�fico, e uma das cartas tem a palavra �Dorminhoco�. Quem recebe esta carta tem que ficar uma rodada com ela. No momento que os alunos recebem as cartas devem analisar se a fun��o, o zero e o gr�fico est�o corretos; se algum estiver errado, quando for sua vez de jogar voc� passa esta carta adiante. Quando voc� estiver formado o trio correto abaixa as cartas, o �ltimo que abaixar perde e � o Dorminhoco.','O jogo Dorminhoco Matem�tico consiste em uma atividade a qual cont�m cartas com fun��es, zeros da fun��o e gr�ficos. O objetivo neste jogo � fazer com que os alunos encontrem o zero da fun��o e gr�fico referente a cada fun��o dada. Neste jogo vamos trabalhar com os zeros e com gr�ficos envolvendo fun��es do 1� e do 2� grau.
Objetivos: - calcular corretamente os zeros das fun��es do 1� e do 2� grau; - reconhecer os gr�ficos das fun��es.','Interno','M�dio','Fun��es','Cartas','Pequeno');
Insert into BRINCADEIRA (NOME_BRINC,DESC_BRINC,APLICACAO_BRINC,AMB,CLASS,MAT,TIPO,PORTE) values ('Soma 28','O(s) jogador(es) devem completar o quadrado utilizando todas as pe�as;
Cada algarismo s� pode surgir uma �nica vez no quadrado;
Cada linha, coluna e diagonal deve totalizar a soma do n�mero 28;
Se alguma linha, coluna ou diagonal n�o totalizar a soma do n�mero 28, o quadrado est� errado e a pe�a deve ser trocada;
O jogo termina com o preenchimento de todas as dezesseis casas do tabuleiro.
De quantas maneiras diferentes � poss�vel distribuir os n�meros na tabela 4x4 mantendo a soma 28?','Distribuir os algarismos 2, 5, 6, 8 e 9 na tabela 4x4, de modo a manter a soma 28 no quadrado, isto �, a soma das linhas, das colunas e das diagonais seja sempre 28.','Interno','Primario','Aritm�tica','Tabuleiro','Pequeno');
