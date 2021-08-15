
resumo por periodo

DIA | PERIODO | VIAGENS | TOTAL
$sql = "select pope.data_ref as dia,  lper.periodo as periodo, COUNT(lanc.id) as viagem , lanc.liquido as liquido from lancamentos lanc join periodos_operacao pope on lanc.periodo = pope.id join lista_periodos lper on pope.periodo = lper.id GROUP by pope.data_ref,pope.id;";

resumo por terno

DIA | PERIODO | TERNO | VIAGENS | TOTAL
$sql = "select pope.data_ref as dia, lper.periodo as periodo, ter.terno as terno, if(lanc.armazem = ter.porao, COUNT(lanc.id),\'0\') as viagem , if(lanc.armazem = ter.porao, lanc.liquido,\'0\')  as liquido from lancamentos lanc join periodos_operacao pope on lanc.periodo = pope.id join lista_periodos lper on pope.periodo = lper.id JOIN ternos ter on ter.periodo = pope.id GROUP by pope.data_ref,pope.id,ter.porao;";






data
periodo
popeid
paralizacoes
tempo
porao1
porao2
porao3
porao4
porao5
total



select 
data,
periodo,
popeid,
paralizacoes,
tempo,
porao1,
porao2,
porao3,
porao4,
porao5,
total,
from atracao periodo operacao



RESUMO OPERACIONAL SEPARADO POR TERNO SEM POROES SEPARADOS
SELECT
pope.data_ref as dia, 
(select lper.abv from lista_periodos lper where lper.id = pope.periodo) as periodo,
ope.terno as terno,
ope.id as ternoid,
(select GROUP_CONCAT(par.id) from paralizacao_ope par where par.terno = ope.id )  as paralizacao,
(select sum(lanc.liquido) from lancamentos lanc where lanc.operacao = ope.id) as total
FROM atracacao atr 
join periodos_operacao pope on pope.atracacao = atr.id 
left join operacao ope on ope.periodo = pope.id 
WHERE atr.id = 1 
GROUP by atr.id,pope.id,ope.id;



realizar um query pra cada relatorio

o ROP será um geral por periodo, apenas as paralizações irão aparecer dos 2 ternos por meio de concatenãção


query base rop: falta colocar poroes separados.

SELECT atr.id,pope.data_ref as dope, pope.periodo as periodo , sum(lanc.liquido) as liquido,
(select GROUP_CONCAT(para.paralizacao) from paralizacao_ope para where para.periodo = pope.id ) as paratexto,
(select GROUP_CONCAT(para.paralizacao) from paralizacao_ope para where para.periodo = pope.id ) as paratempo
from atracacao atr 
join periodos_operacao pope on pope.atracacao = atr.id
LEFT join operacao ope on ope.periodo = pope.id
left join lancamentos lanc on ope.id = lanc.operacao 
GROUP by atr.id,pope.id;






o COP terá a separação por terno apenas.