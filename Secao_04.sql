--
SELECT * FROM TALUNO;

--
SELECT Concat(COD_ALUNO,NOME) FROM TALUNO;

--
SELECT COD_ALUNO||' -- '||NOME FROM TALUNO;

--
SELECT nome, InitCap(NOME) FROM TALUNO;

--
SELECT nome, InStr(NOME,'R') FROM TALUNO;

--
SELECT nome, Length(NOME) FROM TALUNO;

--
SELECT nome, Lower(NOME) FROM TALUNO;

--
SELECT nome, Upper(NOME) FROM TALUNO;

--
SELECT InitCap('JOSE DA SILVA') FROM dual;

-- left - esquerda
SELECT cod_aluno, LPad(COD_ALUNO,5,'0') FROM TALUNO;

-- direita
SELECT nome, salario, RPad(SALARIO,8,'0') FROM TALUNO;

--
SELECT nome, RPad(NOME,10,'$') FROM TALUNO;

-- copia parte de um texto
-- substr ( campo/texto, posicao, qtde de caract )
SELECT nome, SubStr(NOME,1,3) FROM TALUNO;

--
SELECT SubStr(NOME,1,1) FROM TALUNO;

--
SELECT nome, SubStr(NOME,3,1) FROM TALUNO;

--
SELECT REPLACE(Upper(NOME),'R','$') FROM TALUNO;

--

SELECT SubStr(NOME,Length(nome),1) FROM TALUNO;

--
SELECT SubStr(NOME,Length(nome)-1, 2) FROM TALUNO;

--
SELECT nome, SubStr(NOME, 3, Length(nome)-3 ) FROM TALUNO;


--
SELECT * FROM TALUNO
WHERE Lower(NOME) = 'marcio';

SELECT * FROM TALUNO
WHERE Upper(NOME) = 'MARCIO';

SELECT * FROM TALUNO
WHERE Upper(SubStr(CIDADE,1,3)) = 'CAN';


UPDATE TALUNO SET
SALARIO = 633.47
WHERE COD_ALUNO = 1;


SELECT
  SALARIO,
  REPLACE(SALARIO, ',' , ''),
  RPad(SALARIO, 10,'0'),     --Zeros a direita até 10 casas
  LPad(SALARIO, 10,'0'),     --Zeros a esquerda até 10 casas
  LPad(REPLACE(SALARIO,',',''),10,'0')
FROM TALUNO;



------------------Data
SELECT * FROM DUAL;

--SysDate retorna data/hora do Servidor.
SELECT SYSDATE FROM DUAL;

-- Round e Trunc
SELECT Round(45.925, 2 ),  --45.93
       Trunc(45.929, 2 ),  --45.92
       Mod(10, 2) AS RESTO_DIVISAO,
       Trunc(1.99),
       Trunc(1.99, 2)
FROM DUAL;

SELECT * FROM TCONTRATO;

--Funcoes de Data/Hora
SELECT DATA, SYSDATE, DATA + 5 FROM TCONTRATO;

SELECT SYSDATE - DATA AS DIF_DIAS FROM TCONTRATO;

SELECT Trunc(SYSDATE - DATA) as DIAS FROM TCONTRATO;

--Somando horas em uma data
SELECT SYSDATE, SYSDATE + 5 / 24 as ADD_HORAS FROM TCONTRATO;

--Somar minutos
SELECT SYSDATE, SYSDATE + 15 / 1440 as ADD_MINUTOS FROM TCONTRATO;

SELECT SYSDATE, SYSDATE + 30 / (3600 * 24) as ADD_SEGUNDOS FROM TCONTRATO;


--Hora fica 00:00:00
SELECT SYSDATE, Trunc(SYSDATE) FROM DUAL;

--Diferenca de meses entre datas
SELECT Months_Between(SYSDATE, SYSDATE-90) AS DIF_MES FROM DUAL;

--Adiciona meses
SELECT Add_Months(SYSDATE, 5) AS ADICIONA_MES_DATA FROM DUAL;

--Proxima data a partir de uma dia da semana
SELECT Next_Day(SYSDATE, 'QUARTA-FEIRA') AS PROXIMA_QUARTA_DATA FROM DUAL;

--Ultimo dia do mes
SELECT Last_Day(SYSDATE) AS ULTIMO_DIA_MES FROM DUAL;

--Primeiro dia do proximo mes
--até dia 15 do mes pega o primeiro dia do mes atual
--a partir do dia 16 retorna o primeiro dia do proximo mes
SELECT Round(SYSDATE, 'MONTH') AS PRIMEIRO_DIA_PROXIMO_MES FROM DUAL;


--Primeiro dia do mes
SELECT Trunc(SYSDATE,'MONTH') AS PRIMEIRO_DIA_MES_CORRENTE FROM DUAL;


---Formatação de data

--Conversor to_char(data, formato)

--DD -> dia do mes
SELECT SYSDATE, To_Char(SYSDATE,'DD') AS DIA_DO_MES FROM DUAL

--
SELECT To_Char(SYSDATE,'DD/MM/YYYY') DATA FROM DUAL;

SELECT To_Char(SYSDATE,'DD/MM') DIA_MES FROM DUAL;

SELECT To_Char(SYSDATE,'DD') DIA FROM DUAL;

SELECT To_Char(SYSDATE,'MM') MES FROM DUAL;

SELECT To_Char(SYSDATE,'YYYY') ANO FROM DUAL;

SELECT To_Char(SYSDATE,'YY') ANO FROM DUAL;

--
SELECT To_Char(SYSDATE,'MONTH') MES1 FROM DUAL;

--
SELECT To_Char(SYSDATE,'D') DIA_SEMANA FROM DUAL;

--
SELECT To_Char(SYSDATE,'DY') DIA_SEMANA FROM DUAL;   -- QUA

--
SELECT To_Char(SYSDATE,'DAY') DIA_SEMANA1 FROM DUAL; -- QUARTA

--
SELECT To_Char(SYSDATE,'YEAR') ANO FROM DUAL;        -- Em Ingles

--
SELECT To_Char(SYSDATE,'"NOVO HAMBURGO", fmDAY "," DD "de" fmMonth "de" YYYY') NOVA_DATA FROM DUAL;

--
SELECT To_Char(SYSDATE,'HH24:MI') HORA_MIN FROM DUAL;

--
SELECT To_Char(SYSDATE,'HH24:MI:SS') HORA_MIN_SEG FROM DUAL;

--
SELECT To_Char(SYSDATE,'DD/MM HH24:MI') DATA_HORA FROM DUAL;

--
SELECT To_Char(SYSDATE,'DD/MM/YYYY HH24:MI:SS') DATA_HORA FROM DUAL;




--L -> R$
--G -> ponto
--D -> casas decimais

SELECT * FROM TALUNO

SELECT Trim(To_Char(Salario,'L99999.99')) salario1, trim(To_Char(Salario,'L99G999D99')) salario2
FROM TALUNO;

--
SELECT 'R$ '||(Round(Salario,2)) AS salario FROM TALUNO;



-----
--NVL e NVL2
SELECT * FROM tcontrato;

SELECT Total,
       Desconto,
       Desconto+Total,
       Nvl(Desconto,0),
       Nvl(Desconto,0) + TOTAL,
       Nvl2(DESCONTO, TOTAL, 0)
FROM TContrato;

SELECT * FROM TALUNO

UPDATE TALUNO SET
NOME = NULL
WHERE COD_ALUNO = 5;

SELECT Cod_Aluno, Nvl(Nome, 'SEM NOME') FROM TALUNO

SELECT * FROM TALUNO;


UPDATE TAluno SET
Estado = 'SC'
WHERE Cod_Aluno=3;

UPDATE TAluno SET
Estado = 'RJ'
WHERE Cod_Aluno=5;

--Case
SELECT NOME, Estado,
       CASE
         WHEN Estado = 'RS' THEN 'GAUCHO'
         WHEN Estado = 'AC' THEN 'ACREANO'
         WHEN Estado = 'RJ' AND SALARIO > 500 THEN 'CARIOCA'
         ELSE 'OUTROS'
       END AS Apelido
FROM TALUNO;

--
SELECT SYSDATE AS DATA FROM DUAL

--
SELECT NOME, ESTADO,
       Decode(ESTADO,'RS','GAUCHO',
                     'AC','ACREANO',
                     'SP','PAULISTA',
                          'OUTROS' ) AS APELIDO
FROM TALUNO;



---------- Fim ----------