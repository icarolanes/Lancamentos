-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Ago-2021 às 19:31
-- Versão do servidor: 10.4.20-MariaDB
-- versão do PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pedras`
--
CREATE DATABASE IF NOT EXISTS `pedras` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pedras`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `armazem`
--

CREATE TABLE `armazem` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `descr` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `armazem`
--

INSERT INTO `armazem` (`id`, `numero`, `descr`) VALUES
(1, 1, '#1'),
(2, 2, '#2'),
(3, 3, '#3'),
(4, 4, '#4'),
(5, 5, '#5'),
(6, 6, '#6'),
(7, 7, '#7'),
(8, 8, '#8'),
(9, 9, '#9'),
(10, 10, '#10'),
(11, 50, 'Armazém'),
(12, 100, 'Pulmão');

-- --------------------------------------------------------

--
-- Estrutura da tabela `atracacao`
--

CREATE TABLE `atracacao` (
  `id` int(11) NOT NULL,
  `situacao` int(11) NOT NULL,
  `navio` int(11) NOT NULL COMMENT 'id do navio',
  `Natraca` varchar(10) NOT NULL,
  `operador` int(11) NOT NULL,
  `Datracacao` datetime DEFAULT NULL,
  `ope1` datetime DEFAULT NULL,
  `ope2` datetime DEFAULT NULL,
  `Ddesatracacao` datetime DEFAULT NULL,
  `berco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `atracacao`
--

INSERT INTO `atracacao` (`id`, `situacao`, `navio`, `Natraca`, `operador`, `Datracacao`, `ope1`, `ope2`, `Ddesatracacao`, `berco`) VALUES
(1, 1, 1, '01/21', 20, '2021-07-16 18:24:44', '2021-07-16 13:33:40', '2021-07-22 13:33:52', '2021-07-22 18:24:44', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `berco`
--

CREATE TABLE `berco` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `local` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `berco`
--

INSERT INTO `berco` (`id`, `numero`, `local`) VALUES
(1, 206, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `documentos`
--

CREATE TABLE `documentos` (
  `id` int(11) NOT NULL,
  `atracacao` int(11) NOT NULL,
  `tipo` int(11) NOT NULL COMMENT 'tipo de documento im/exp (tipo_doc)',
  `identificacao` varchar(30) NOT NULL COMMENT 'numero/codigo',
  `empresa` int(11) NOT NULL COMMENT 'id da Empresa responsavel (empresas)',
  `manifestado` double NOT NULL,
  `saldo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `documentos`
--

INSERT INTO `documentos` (`id`, `atracacao`, `tipo`, `identificacao`, `empresa`, `manifestado`, `saldo`) VALUES
(1, 1, 3, '21BR000948183-2', 1, 1000000, 0),
(2, 1, 3, '21BR000774182-9', 13, 2000000, 0),
(4, 1, 3, '21BR000768200-8', 6, 500000, 0),
(5, 1, 3, '21BR000949969-3', 3, 1500000, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresas`
--

CREATE TABLE `empresas` (
  `id` int(11) NOT NULL,
  `xCNPJ` varchar(20) NOT NULL,
  `xNome` varchar(50) NOT NULL,
  `fantasia` varchar(20) DEFAULT NULL,
  `ap` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `empresas`
--

INSERT INTO `empresas` (`id`, `xCNPJ`, `xNome`, `fantasia`, `ap`) VALUES
(1, '24042913000139', 'GRANSENA EXPORTACAO E COMERCIO LTDA', '', 'GRANSENA LTDA'),
(2, '999999999999', 'não informado', '', 'Não informado'),
(3, '20082261000105', 'RME COMERCIO DE MARMORES E GRANITOS LTDA', '', 'RME LTDA'),
(4, '92660604011974', 'YARA BRASIL FERTILIZANTES SA', '', 'YARA'),
(5, '15038402000152', 'SPORTOS TRANSPORTE RODOVIARIO', '', 'SPORTOS'),
(6, '19270937000105', 'NOVA COMERCIO INTERNACIONAL LTDA', '', 'NOVA LTDA'),
(7, '09049794000152', 'FORTUNA TRANSPORTES LTDA', '', 'FORTUNA'),
(8, '07783512000110', 'HMA TRANSPORTES LTDA', NULL, 'HMA'),
(9, '32464224000140', 'TRANSBYL TRANSPORTES LTDA', NULL, 'TRANSBYL'),
(10, '14412111000110', 'MARIANA COSTA PINHEIRO', NULL, 'MARIANA'),
(11, '14213611000122', 'TRANSPORTADORA F & R LTDA EPP', NULL, 'F & R'),
(12, '22990172000192', 'GENILTON EVANGELISTA DOS SANTOS ME', NULL, 'GENILTON'),
(13, '03799534000118', 'AMAGRAN IMPORTACAO E EXPORTACAO LTDA', NULL, 'AMAGRAN'),
(14, '04367263000194', 'TRANSCAMILO TRANSPORTES LTDA ME', NULL, 'TRANSCAMILO'),
(15, '07479402000160', 'STONEVAL DO BRASIL MARMORES E GRANITOS LTDA', NULL, 'STONEVAL'),
(16, '01184095000103', 'MGA MARMORES E GRANITOS ALTOE LTDA', NULL, 'MGA'),
(17, '08919924000106', 'PORTO SEGURO LOGISTICA TRANSPORTES LTDA ME', NULL, 'PORTO SEGURO'),
(18, '09201403000173', 'GMA TRANSPORTES LTDA', NULL, 'GMA'),
(19, '02385710000102', 'Peiú sociedade de proposito especifico SPE SA', 'Peiú SA', 'Peiú'),
(20, '02385710000102', 'VOL Vitória Offshore Logistics S/A', NULL, 'VOL');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lancamentos`
--

CREATE TABLE `lancamentos` (
  `id` int(11) NOT NULL,
  `atracacao` int(11) NOT NULL,
  `documento` int(11) NOT NULL COMMENT 'id do documento de im/exp',
  `nf` int(11) DEFAULT NULL COMMENT 'id da nota fiscal (se tiver)',
  `transp` int(11) DEFAULT NULL COMMENT 'id da transportadora (empresas)',
  `motorista` int(11) DEFAULT NULL COMMENT 'motorista (usar consulta de ultimo lançamento)',
  `placa` int(11) NOT NULL COMMENT 'placa do veiculo de transporta',
  `carreta1` int(11) DEFAULT NULL COMMENT 'placa do veiculo de transporta',
  `carreta2` int(11) DEFAULT NULL COMMENT 'placa do veiculo de transporta',
  `data` datetime NOT NULL COMMENT 'data da movimentação',
  `tara` float DEFAULT NULL COMMENT 'peso de entrada',
  `bruto` float DEFAULT NULL COMMENT 'peso de saída',
  `liquido` float DEFAULT NULL COMMENT 'diferença',
  `operacao` int(11) DEFAULT NULL COMMENT 'operacao ou terno',
  `usuario` int(11) NOT NULL,
  `dlancamento` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `lancamentos`
--

INSERT INTO `lancamentos` (`id`, `atracacao`, `documento`, `nf`, `transp`, `motorista`, `placa`, `carreta1`, `carreta2`, `data`, `tara`, `bruto`, `liquido`, `operacao`, `usuario`, `dlancamento`) VALUES
(1, 1, 1, NULL, 5, 1, 11, 12, NULL, '2021-07-24 11:10:00', 16180, 41500, 25320, 5, 1, '2021-07-24 14:11:16'),
(2, 1, 4, NULL, 5, 1, 11, 12, NULL, '2021-07-24 11:14:00', 21650, 41500, 25320, 6, 1, '2021-07-24 14:15:34'),
(3, 1, 5, NULL, 5, 1, 11, 67, NULL, '2021-07-24 11:16:00', 17800, 53200, 25320, 7, 1, '2021-07-24 14:16:49'),
(4, 1, 2, NULL, 5, 1, 11, 67, NULL, '2021-07-24 11:17:00', 16100, 48600, 25320, 8, 1, '2021-07-24 14:17:49'),
(5, 1, 2, NULL, 5, 1, 11, 12, NULL, '2021-07-24 11:47:00', 24000, 74000, 25320, 9, 1, '2021-07-24 14:48:20'),
(6, 1, 1, NULL, 5, 1, 11, 12, NULL, '2021-07-24 11:48:00', 10500, 30800, 25320, 10, 1, '2021-07-24 14:49:32'),
(7, 1, 1, NULL, 5, 1, 11, 12, NULL, '2021-07-24 11:10:00', 16180, 41500, 25320, 11, 1, '2021-07-24 14:11:16'),
(8, 1, 4, NULL, 5, 1, 11, 12, NULL, '2021-07-24 11:14:00', 21650, 53000, 25320, 12, 1, '2021-07-24 14:15:34'),
(9, 1, 5, NULL, 5, 1, 11, 67, NULL, '2021-07-24 11:16:00', 17800, 53200, 25320, 13, 1, '2021-07-24 14:16:49'),
(10, 1, 2, NULL, 5, 1, 11, 67, NULL, '2021-07-24 11:17:00', 16100, 48600, 25320, 14, 1, '2021-07-24 14:17:49'),
(11, 1, 2, NULL, 5, 1, 11, 67, NULL, '2021-07-24 11:17:00', 16100, 48600, 25320, 15, 1, '2021-07-24 14:17:49');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lista_grupos`
--

CREATE TABLE `lista_grupos` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lista_paralizacoes`
--

CREATE TABLE `lista_paralizacoes` (
  `id` int(11) NOT NULL,
  `pt_br` varchar(50) NOT NULL,
  `eng` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `lista_paralizacoes`
--

INSERT INTO `lista_paralizacoes` (`id`, `pt_br`, `eng`) VALUES
(1, 'Reunião de Segurança', 'Safety Meeting'),
(2, 'Embarque de Excavadeira', 'Load Excavator'),
(3, 'Falta de veículos', 'No trucks');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lista_periodos`
--

CREATE TABLE `lista_periodos` (
  `id` int(11) NOT NULL,
  `periodo` varchar(10) NOT NULL,
  `abv` varchar(5) NOT NULL,
  `ordem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `lista_periodos`
--

INSERT INTO `lista_periodos` (`id`, `periodo`, `abv`, `ordem`) VALUES
(1, '01X07', '01h', 1),
(2, '07X13', '07h', 2),
(3, '13X19', '13h', 3),
(4, '19X01', '19h', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `navios`
--

CREATE TABLE `navios` (
  `id` int(11) NOT NULL,
  `Nnome` varchar(20) NOT NULL,
  `imo` int(11) NOT NULL,
  `poroes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `navios`
--

INSERT INTO `navios` (`id`, `Nnome`, `imo`, `poroes`) VALUES
(1, 'navio generico', 123456, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `nf_ident`
--

CREATE TABLE `nf_ident` (
  `id` int(11) NOT NULL,
  `chave` text NOT NULL,
  `serie` int(11) NOT NULL,
  `tpNF` int(11) NOT NULL,
  `dhEmi` datetime NOT NULL,
  `emissor` int(11) NOT NULL,
  `qtdvol` int(11) NOT NULL,
  `Numeracao_item` text NOT NULL,
  `Pbruto` double NOT NULL,
  `Pliquido` double NOT NULL,
  `vProd` double NOT NULL,
  `vNF` double NOT NULL,
  `transport` int(11) NOT NULL,
  `info_comp_nota` longtext DEFAULT NULL,
  `nNF` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `nf_ident`
--

INSERT INTO `nf_ident` (`id`, `chave`, `serie`, `tpNF`, `dhEmi`, `emissor`, `qtdvol`, `Numeracao_item`, `Pbruto`, `Pliquido`, `vProd`, `vNF`, `transport`, `info_comp_nota`, `nNF`) VALUES
(1, '31210624042913000139550000000164721100164725', 0, 1, '2021-06-18 11:14:01', 1, 40, '', 1196650, 1196650, 792376.86, 792376.86, 2, 'Os Blocos serao retirados do recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER. NF. De Remessa: 16426-162427-16428-16429-16430 de 11.05.21 - 16431-16432-16433-16434-16436 de 12.05.21 - 16437-16438-16439 de 13.05.21 - 16441-16442-16443 de 14.05.21 - 16444-16445-16446-16447-16448-16449-16450 de 17.05.21 - 16451-16452-16453-16454-16455-16456 de 18.05.21 - 16457-16458-16459-16460-16461-16462-16463 de 19.05.12 - 16464-16465-16466-16467 de 20.05.21M1. NF. De Retorno Simbolico n 16471 de 18.06.21M1. - TOTAL: 327,843M3. - REGIME DRAWBACK - ATO CONCESSORIO: 20200010999 DE 12.03.2020. ;NAO INCIDENCIA DO IMPOSTO, POR SE TRATAR DE SAIDA DE MERCADORIA COM DESTINO AO EXTERIOR', 16472),
(2, '31210792660604011974550570000020101323482447', 57, 1, '2021-07-12 08:23:18', 4, 30, '0', 30420, 30420, 58927.8, 58927.8, 5, 'BRUTO 46.230 TARA 15.810 LIQUIDO 30.420  CV MPP 7166MERCADORIA SEGUIU DIRETAMENTE DO PORTO DE VITORIA-ES NOS TERMOS DO ANEXO V, ARTIGO 13 DO RICMSMGICMS SUSPENSO, NOS TERMOS DO ARTIGO 19, COMBINADO COM ANEXO III, ITEM 1 DO RICMSMGSUSPENSAO DO IPI CONF. ARTIGO 43, INCISO VI DO RIPI10RMA RS5207 105911PRODUTO IMPORTADO, ARMAZENAR EM LUGAR SECO, COBERTO E AREJADOMERCADORIA SADA DO PORTO DE VILA VELHA-ESPEDIDO 92521DATA DE FABRICACAO 12072021 DATA DE VALIDADE 12072023DI 211167114-1, DATA DA DI 18062021, NAVIO BERGE BEN NEVIS, NR. IMP 0000925I21NR NF MAE 1995, DATA NF MAE 30062021, PEDIDO 92521, TIQUETE 21006261', 2010),
(3, '31210524042913000139550000000164361100164369', 0, 1, '2021-05-13 08:03:04', 1, 1, '25444', 33380, 33380, 21797.48, 21797.48, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: OMD-2C18;PLACA DO REBOQUE: NYE-6728;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001; ;Com. 3,100 - Lar. 1,650 - Alt. 1,700', 16436),
(4, '31210524042913000139550000000164371100164374', 0, 1, '2021-05-13 15:14:21', 1, 1, '25415', 30730, 30730, 22108.3, 22108.3, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: HHK-9013;PLACA DA CARRETA: OMD-2223;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001; ;Com. 2,400 - Lar. 2,100 - Alt. 1,750', 16437),
(5, '32210519270937000105550010000079361000075071', 1, 1, '2021-05-05 17:10:58', 6, 1, 'IZBEH 2454', 37932, 37932, 11374.21, 11374.21, 7, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES, ATO DECLARATORIO NO. 25, DE 29.07.1996. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002.;LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825.;E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352.;;(IZBEH 2454) ** UF:ES - NF Origem:057262 - Comp:2,700 - Alt:1,600 - Larg:2,000', 7936),
(6, '32210520082261000105550000000094011100094019', 0, 1, '2021-05-28 09:18:53', 3, 1, '16019', 36000, 36000, 4826.55, 4826.55, 3, 'MOTORISTA: GENESES ANDERSON DA SILVEIRA CPF:07247862793;PLACA DO CAVALO:OYJ-9A06 PLACA REBOQUE: MSP-1B25;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16064 - Com. 2,750 - Lar. 1,850 - Alt. 1,650', 9401),
(7, '32210520082261000105550000000094021100094024', 0, 1, '2021-05-28 09:23:49', 3, 1, '15906', 33000, 33000, 3202.18, 3202.18, 3, 'MOTORISTA: JOAO PEDRO DA SILVA OLIOSI - CPF: 173.800.927-07. PLACA: OVK7A39 PLACA:OQW6E35;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15923 - Com. 2,500 - Lar. 1,650 - Alt. 1,350', 9402),
(8, '32210520082261000105550000000094031100094030', 0, 1, '2021-05-28 09:27:51', 3, 1, '15888', 36000, 36000, 4995.03, 4995.03, 3, 'MOTORISTA:ELIFAZ POSSEBON CAMPIN CPF:13631787766 -PLACA REBOQUE:OYH-4H89;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15871 - Com. 2,700 - Lar. 1,950 - Alt. 1,650', 9403),
(9, '32210520082261000105550000000094041100094045', 0, 1, '2021-05-28 09:34:34', 3, 1, '15921', 36000, 36000, 4129.65, 4129.65, 3, 'MOTORISTA:Felipe Silva Acerbi CPF:144.844.227-35. PLACA DO REBOQUE: MSD-1D71.;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15956 - Com. 2,850 - Lar. 1,800 - Alt. 1,400', 9404),
(10, '32210520082261000105550000000094051100094050', 0, 1, '2021-05-28 09:41:35', 3, 1, '15915', 33000, 33000, 3827.2, 3827.2, 8, 'Motorista: Pedro silva dos santos;Cpf:08768228716 Placa:OHP-9J37 /Placa:ODG:2J28;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15942 - Com. 2,600 - Lar. 1,600 - Alt. 1,600', 9405),
(11, '32210520082261000105550000000094061100094066', 0, 1, '2021-05-28 09:50:22', 3, 1, '15908', 36000, 36000, 4154.95, 4154.95, 3, 'MOTORISTA:RODRIGO MOYSES DE SOUZA - CPF: 041.905.116-33. PLACA DO CAVALO: QRI-3I31 PLACA DO REBOQUE: OVF-5403.;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15928 - Com. 2,350 - Lar. 1,500 - Alt. 2,050', 9406),
(12, '32210520082261000105550000000094071100094071', 0, 1, '2021-05-28 09:56:29', 3, 1, '15940', 36000, 36000, 4686.83, 4686.83, 3, 'MOTORISTA: RODRIGO OLIVEIRA CPF:09488209771;PLACA DO CAVALO:QRL-1D62 PLACA REBOQUE: OYD4J20;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15990 - Com. 2,600 - Lar. 1,900 - Alt. 1,650', 9407),
(13, '32210520082261000105550000000094081100094087', 0, 1, '2021-05-31 16:21:48', 3, 1, '16017', 14000, 14000, 1760.08, 1760.08, 3, 'MOTORISTA: GENESES ANDERSON DA SILVEIRA CPF:07247862793;PLACA DO CAVALO:OYJ-9A06 PLACA REBOQUE: MSP-1B25;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16060 - Com. 2,650 - Lar. 0,700 - Alt. 1,650', 9408),
(14, '32210520082261000105550000000094091100094092', 0, 1, '2021-05-31 16:25:28', 3, 1, '15951', 24000, 24000, 3083.73, 3083.73, 3, 'MOTORISTA: GENESES ANDERSON DA SILVEIRA CPF:07247862793;PLACA DO CAVALO:OYJ-9A06 PLACA REBOQUE: MSP-1B25;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16012 - Com. 2,600 - Lar. 1,250 - Alt. 1,650', 9409),
(15, '32210520082261000105550000000094101100094107', 0, 1, '2021-05-31 16:30:38', 3, 1, '15918', 13000, 13000, 906.78, 906.78, 3, 'MOTORISTA:RODRIGO MOYSES DE SOUZA - CPF: 041.905.116-33. PLACA DO CAVALO: QRI-3I31 PLACA DO REBOQUE: OVF-5403.;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15950 - Com. 2,650 - Lar. 0,350 - Alt. 1,700', 9410),
(16, '32210520082261000105550000000094111100094112', 0, 1, '2021-05-31 16:34:48', 3, 1, '15895', 24000, 24000, 2964.7, 2964.7, 3, 'MOTORISTA:RODRIGO MOYSES DE SOUZA - CPF: 041.905.116-33. PLACA DO CAVALO: QRI-3I31 PLACA DO REBOQUE: OVF-5403.;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15901 - Com. 2,500 - Lar. 1,250 - Alt. 1,650', 9411),
(17, '32210520082261000105550000000094121100094128', 0, 1, '2021-05-31 16:38:31', 3, 1, '15953', 14000, 14000, 1486.95, 1486.95, 3, 'MOTORISTA: RODRIGO OLIVEIRA CPF:09488209771;PLACA DO CAVALO:QRL-1D62 PLACA REBOQUE: OYD4J20;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16016 - Com. 2,850 - Lar. 0,550 - Alt. 1,650', 9412),
(18, '32210520082261000105550000000094131100094133', 0, 1, '2021-05-31 16:43:20', 3, 1, '15932', 23000, 23000, 2979.08, 2979.08, 3, 'MOTORISTA: RODRIGO OLIVEIRA CPF:09488209771;PLACA DO CAVALO:QRL-1D62 PLACA REBOQUE: OYD4J20;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15978 - Com. 2,650 - Lar. 1,150 - Alt. 1,700', 9413),
(19, '32210620082261000105550000000094331100094334', 0, 1, '2021-06-01 14:43:51', 3, 1, '15956', 25000, 25000, 3172.28, 3172.28, 3, 'MOTORISTA: JOCEMAR DA SILVA CPF: 077.647.817-62 ;PLACA CAVALO: QRI-4B03 REBOQUE: MRX-8H74 REBOQUE: MRX-8H75;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138 ;UF: ES NF:16022 - Com. 2,950 - Lar. 1,100 - Alt. 1,700', 9433),
(20, '32210620082261000105550000000094341100094340', 0, 1, '2021-06-01 14:52:14', 3, 1, '15950', 20000, 20000, 2689.85, 2689.85, 3, 'MOTORISTA: JOCEMAR DA SILVA CPF: 077.647.817-62 ;PLACA CAVALO: QRI-4B03 REBOQUE: MRX-8H74 REBOQUE: MRX-8H75;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138 ;UF: ES NF:16010 - Com. 2,700 - Lar. 1,050 - Alt. 1,650', 9434),
(21, '32210520082261000105550000000093951100093951', 0, 1, '2021-05-28 08:47:10', 3, 1, '15914', 30000, 30000, 4403.93, 4403.93, 3, 'MOTORISTA: TIAGO GONCALVES DE MATOS CPF: 09138545730;PLACA DO CAVALO: RBA-8I59 PLACA DO REBOQUE: AKF-4483-ES PLACA DO REBOQUE: AKF-4482-ES;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138 ;UF: ES NF:15940 - Com. 2,650 - Lar. 1,700 - Alt. 1,700', 9395),
(22, '32210520082261000105550000000093961100093967', 0, 1, '2021-05-28 08:52:55', 3, 1, '16016', 18000, 18000, 1883.7, 1883.7, 3, 'MOTORISTA: TIAGO GONCALVES DE MATOS CPF: 09138545730;PLACA DO CAVALO: RBA-8I59 PLACA DO REBOQUE: AKF-4483-ES PLACA DO REBOQUE: AKF-4482-ES;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138 ;UF: ES NF:16058 - Com. 2,600 - Lar. 0,900 - Alt. 1,400', 9396),
(23, '32210520082261000105550000000093971100093972', 0, 1, '2021-05-28 08:57:44', 3, 1, '15905', 29000, 29000, 3680, 3680, 3, 'MOTORISTA: JOCEMAR DA SILVA CPF: 077.647.817-62 ;PLACA CAVALO: QRI-4B03 REBOQUE: MRX-8H74 REBOQUE: MRX-8H75;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138 ;UF: ES NF:15921 - Com. 3,200 - Lar. 1,600 - Alt. 1,250', 9397),
(24, '32210520082261000105550000000093981100093988', 0, 1, '2021-05-28 09:02:52', 3, 1, '15942', 19000, 19000, 2590.38, 2590.38, 3, 'MOTORISTA: JOCEMAR DA SILVA CPF: 077.647.817-62 ;PLACA CAVALO: QRI-4B03 REBOQUE: MRX-8H74 REBOQUE: MRX-8H75;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138 ;UF: ES NF:15994 - Com. 2,600 - Lar. 1,050 - Alt. 1,650', 9398),
(25, '32210520082261000105550000000093991100093993', 0, 1, '2021-05-28 09:06:00', 3, 1, '15934', 36000, 36000, 4743.75, 4743.75, 9, 'MOTORISTA: DEYVID ALISSON DOMINGOS CPF:05830063700;PLACA CAVALO: EZU-2H94 PLACA REBOQUE: MRY8993;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15980 - Com. 2,750 - Lar. 2,000 - Alt. 1,500', 9399),
(26, '32210520082261000105550000000094001100094003', 0, 1, '2021-05-28 09:15:03', 3, 1, '16015', 36000, 36000, 5028.38, 5028.38, 9, 'MOTORISTA:JOANDO LOPES SOUZA CPF:08670066769;PLACA CAVALO: MTZ-1A78 PLACA REBOQUE :MPT0994;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16056 - Com. 2,650 - Lar. 2,000 - Alt. 1,650', 9400),
(27, '32210620082261000105550000000094351100094355', 0, 1, '2021-06-01 14:57:34', 3, 1, '15944', 12000, 12000, 1357, 1357, 3, 'MOTORISTA:RODRIGO MOYSES DE SOUZA - CPF: 041.905.116-33. PLACA DO CAVALO: QRI-3I31 PLACA DO REBOQUE: OVF-5403.;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15998 - Com. 2,600 - Lar. 0,550 - Alt. 1,650', 9435),
(28, '32210620082261000105550000000094361100094360', 0, 1, '2021-06-01 15:01:34', 3, 1, '15926', 24000, 24000, 3277.5, 3277.5, 3, 'MOTORISTA:RODRIGO MOYSES DE SOUZA - CPF: 041.905.116-33. PLACA DO CAVALO: QRI-3I31 PLACA DO REBOQUE: OVF-5403.;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15966 - Com. 2,850 - Lar. 1,250 - Alt. 1,600', 9436),
(29, '32210620082261000105550000000094371100094376', 0, 1, '2021-06-01 15:07:45', 3, 1, '15965', 12000, 12000, 1408.75, 1408.75, 9, 'MOTORISTA: DEYVID ALISSON DOMINGOS CPF:05830063700;PLACA CAVALO: EZU-2H94 PLACA REBOQUE: MRY8993;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16042 - Com. 2,700 - Lar. 0,550 - Alt. 1,650', 9437),
(30, '32210620082261000105550000000094381100094381', 0, 1, '2021-06-01 15:12:30', 3, 1, '15967', 24000, 24000, 3162.5, 3162.5, 9, 'MOTORISTA: DEYVID ALISSON DOMINGOS CPF:05830063700;PLACA CAVALO: EZU-2H94 PLACA REBOQUE: MRY8993;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16046 - Com. 2,750 - Lar. 1,250 - Alt. 1,600', 9438),
(31, '32210620082261000105550000000094391100094397', 0, 1, '2021-06-01 15:18:49', 3, 1, '15949', 11000, 11000, 1045.93, 1045.93, 3, 'MOTORISTA: GENESES ANDERSON DA SILVEIRA CPF:07247862793;PLACA DO CAVALO:OYJ-9A06 PLACA REBOQUE: MSP-1B25;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16008 - Com. 2,450 - Lar. 0,450 - Alt. 1,650', 9439),
(32, '32210620082261000105550000000094401100094401', 0, 1, '2021-06-01 15:22:17', 3, 1, '15961', 24000, 24000, 3268.3, 3268.3, 3, 'MOTORISTA: GENESES ANDERSON DA SILVEIRA CPF:07247862793;PLACA DO CAVALO:OYJ-9A06 PLACA REBOQUE: MSP-1B25;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16034 - Com. 2,650 - Lar. 1,300 - Alt. 1,650', 9440),
(33, '32210620082261000105550000000094411100094417', 0, 1, '2021-06-01 15:29:27', 3, 1, '15946', 14000, 14000, 1541.58, 1541.58, 3, 'MOTORISTA: RODRIGO OLIVEIRA CPF:09488209771;PLACA DO CAVALO:QRL-1D62 PLACA REBOQUE: OYD4J20;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16002 - Com. 3,250 - Lar. 0,500 - Alt. 1,650', 9441),
(34, '32210620082261000105550000000094421100094422', 0, 1, '2021-06-01 15:32:46', 3, 1, '15966', 23000, 23000, 2285.63, 2285.63, 3, 'MOTORISTA: RODRIGO OLIVEIRA CPF:09488209771;PLACA DO CAVALO:QRL-1D62 PLACA REBOQUE: OYD4J20;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16044 - Com. 2,650 - Lar. 1,000 - Alt. 1,500', 9442),
(35, '32210620082261000105550000000094431100094438', 0, 1, '2021-06-01 15:40:32', 3, 1, '16014', 36000, 36000, 5057.13, 5057.13, 3, 'MOTORISTA:ELIFAZ POSSEBON CAMPIN CPF:13631787766 -PLACA REBOQUE:OYH-4H89;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16054 - Com. 2,600 - Lar. 2,050 - Alt. 1,650', 9443),
(36, '32210620082261000105550000000094441100094443', 0, 1, '2021-06-01 15:45:54', 3, 1, '15891', 35000, 35000, 4140, 4140, 8, 'Motorista: Pedro silva dos santos;Cpf:08768228716 Placa:OHP-9J37 /Placa:ODG:2J28;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15893 - Com. 2,500 - Lar. 1,800 - Alt. 1,600', 9444),
(37, '32210620082261000105550000000094631100094635', 0, 1, '2021-06-02 14:27:07', 3, 1, '15901', 34000, 34000, 4705.8, 4705.8, 3, 'MOTORISTA: JOAO PEDRO DA SILVA OLIOSI - CPF: 173.800.927-07. PLACA: OVK7A39 PLACA:OQW6E35;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15913 - Com. 3,100 - Lar. 1,650 - Alt. 1,600', 9463),
(38, '32210620082261000105550000000094641100094640', 0, 1, '2021-06-02 14:33:26', 3, 1, '15945', 34000, 34000, 4692, 4692, 8, 'Motorista: Pedro silva dos santos;Cpf:08768228716 Placa:OHP-9J37 /Placa:ODG:2J28;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16000 - Com. 2,400 - Lar. 2,000 - Alt. 1,700', 9464),
(39, '32210620082261000105550000000094651100094656', 0, 1, '2021-06-02 14:39:21', 3, 1, '14648', 36000, 36000, 4743.75, 4743.75, 3, 'MOTORISTA:Felipe Silva Acerbi CPF:144.844.227-35. PLACA DO REBOQUE: MSD-1D71.;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15948 - Com. 2,500 - Lar. 2,000 - Alt. 1,650', 9465),
(40, '32210620082261000105550000000094661100094661', 0, 1, '2021-06-02 15:24:34', 3, 1, '15963', 27000, 27000, 3602.95, 3602.95, 3, 'MOTORISTA: TIAGO GONCALVES DE MATOS CPF: 09138545730;PLACA DO CAVALO: RBA-8I59 PLACA DO REBOQUE: AKF-4483-ES PLACA DO REBOQUE: AKF-4482-ES;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138 ;UF: ES NF:16038 - Com. 2,450 - Lar. 1,550 - Alt. 1,650', 9466),
(41, '32210620082261000105550000000094671100094677', 0, 1, '2021-06-02 15:28:17', 3, 1, '15912', 19000, 19000, 2789.33, 2789.33, 3, 'MOTORISTA: TIAGO GONCALVES DE MATOS CPF: 09138545730;PLACA DO CAVALO: RBA-8I59 PLACA DO REBOQUE: AKF-4483-ES PLACA DO REBOQUE: AKF-4482-ES;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138 ;UF: ES NF:15936 - Com. 2,800 - Lar. 1,050 - Alt. 1,650', 9467),
(42, '32210620082261000105550000000094681100094682', 0, 1, '2021-06-02 15:33:14', 3, 1, '15919', 15000, 15000, 1915.9, 1915.9, 3, 'MOTORISTA:RODRIGO MOYSES DE SOUZA - CPF: 041.905.116-33. PLACA DO CAVALO: QRI-3I31 PLACA DO REBOQUE: OVF-5403.;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15952 - Com. 2,450 - Lar. 0,800 - Alt. 1,700', 9468),
(43, '32210620082261000105550000000094691100094698', 0, 1, '2021-06-02 15:50:19', 3, 1, '15923', 23000, 23000, 2922.73, 2922.73, 3, 'MOTORISTA:RODRIGO MOYSES DE SOUZA - CPF: 041.905.116-33. PLACA DO CAVALO: QRI-3I31 PLACA DO REBOQUE: OVF-5403.;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15960 - Com. 2,600 - Lar. 1,150 - Alt. 1,700', 9469),
(44, '32210620082261000105550000000094701100094702', 0, 1, '2021-06-02 15:55:16', 3, 1, '16018', 18000, 18000, 1994.1, 1994.1, 3, 'MOTORISTA: RODRIGO OLIVEIRA CPF:09488209771;PLACA DO CAVALO:QRL-1D62 PLACA REBOQUE: OYD4J20;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16062 - Com. 2,550 - Lar. 0,850 - Alt. 1,600', 9470),
(45, '32210620082261000105550000000094711100094718', 0, 1, '2021-06-02 15:58:13', 3, 1, '15968', 20000, 20000, 2590.38, 2590.38, 3, 'MOTORISTA: RODRIGO OLIVEIRA CPF:09488209771;PLACA DO CAVALO:QRL-1D62 PLACA REBOQUE: OYD4J20;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16048 - Com. 2,650 - Lar. 1,000 - Alt. 1,700', 9471),
(46, '32210620082261000105550000000094721100094723', 0, 1, '2021-06-02 16:02:20', 3, 1, '15959', 14000, 14000, 1781.93, 1781.93, 3, 'MOTORISTA: GENESES ANDERSON DA SILVEIRA CPF:07247862793;PLACA DO CAVALO:OYJ-9A06 PLACA REBOQUE: MSP-1B25;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16028 - Com. 2,250 - Lar. 1,450 - Alt. 0,950', 9472),
(47, '32210620082261000105550000000094731100094739', 0, 1, '2021-06-02 16:06:44', 3, 1, '15913', 23000, 23000, 2668.58, 2668.58, 3, 'MOTORISTA: GENESES ANDERSON DA SILVEIRA CPF:07247862793;PLACA DO CAVALO:OYJ-9A06 PLACA REBOQUE: MSP-1B25;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15938 - Com. 2,600 - Lar. 1,050 - Alt. 1,700', 9473),
(48, '32210620082261000105550000000094741100094744', 0, 1, '2021-06-02 16:13:52', 3, 1, '16020', 16000, 16000, 1517.43, 1517.43, 3, 'MOTORISTA: JOAO PEDRO DA SILVA OLIOSI - CPF: 173.800.927-07. PLACA: OVK7A39 PLACA:OQW6E35;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16066 - Com. 2,600 - Lar. 0,700 - Alt. 1,450', 9474),
(49, '32210620082261000105550000000094751100094750', 0, 1, '2021-06-02 16:15:58', 3, 1, '15948', 21000, 21000, 3030.25, 3030.25, 3, 'MOTORISTA: JOAO PEDRO DA SILVA OLIOSI - CPF: 173.800.927-07. PLACA: OVK7A39 PLACA:OQW6E35;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16006 - Com. 2,000 - Lar. 1,700 - Alt. 1,550', 9475),
(50, '31210524042913000139550000000164261100164265', 0, 1, '2021-05-11 08:49:50', 1, 1, '25440', 33500, 33500, 22627.17, 22627.17, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), em carater eventual, com fulcro nos artigos 1 , inciso I, 3 , e 13, 1 , da Portaria ALF/VIT n 07/2015, a pessoa juridica VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ (matriz) n 32.318.949/0001-20, localizada a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo, com area REDEX de 21.169m situada nas coordenadas geograficas 20,368027 S, e 40,328825 O. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: OMD-2C18;PLACA DO REBOQUE: NYE-6728;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001; ;Com. 2,950 - Lar. 1,800 - Alt. 1,700', 16426),
(51, '31210524042913000139550000000164271100164270', 0, 1, '2021-05-11 08:55:32', 1, 1, '25446', 33580, 33580, 25041.03, 25041.03, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), em carater eventual, com fulcro nos artigos 1 , inciso I, 3 , e 13, 1 , da Portaria ALF/VIT n 07/2015, a pessoa juridica VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ (matriz) n 32.318.949/0001-20, localizada a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo, com area REDEX de 21.169m situada nas coordenadas geograficas 20,368027 S, e 40,328825 O. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: HHK-9013;PLACA DA CARRETA: OMD-2223;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001; ;Com. 3,000 - Lar. 1,850 - Alt. 1,800', 16427),
(52, '31210524042913000139550000000164281100164286', 0, 1, '2021-05-11 08:57:03', 1, 1, '25441', 32890, 32890, 22504.34, 22504.34, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), em carater eventual, com fulcro nos artigos 1 , inciso I, 3 , e 13, 1 , da Portaria ALF/VIT n 07/2015, a pessoa juridica VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ (matriz) n 32.318.949/0001-20, localizada a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo, com area REDEX de 21.169m situada nas coordenadas geograficas 20,368027 S, e 40,328825 O. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: HHK-9A14;PLACA DO REBOQUE: OYJ-9628;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001; ;Com. 2,850 - Lar. 1,800 - Alt. 1,750', 16428),
(53, '31210524042913000139550000000164291100164291', 0, 1, '2021-05-11 09:01:15', 1, 1, '25436', 34870, 34870, 23118.46, 23118.46, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), em carater eventual, com fulcro nos artigos 1 , inciso I, 3 , e 13, 1 , da Portaria ALF/VIT n 07/2015, a pessoa juridica VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ (matriz) n 32.318.949/0001-20, localizada a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo, com area REDEX de 21.169m situada nas coordenadas geograficas 20,368027 S, e 40,328825 O. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: OMD-2C23;PLACA DO REBOQUE: OQI-6571;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001; ;Com. 3,100 - Lar. 1,700 - Alt. 1,750', 16429),
(54, '31210524042913000139550000000164301100164306', 0, 1, '2021-05-11 16:54:47', 1, 1, '25410', 30440, 30440, 21133.23, 21133.23, 10, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), em carater eventual, com fulcro nos artigos 1 , inciso I, 3 , e 13, 1 , da Portaria ALF/VIT n 07/2015, a pessoa juridica VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ (matriz) n 32.318.949/0001-20, localizada a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo, com area REDEX de 21.169m situada nas coordenadas geograficas 20,368027 S, e 40,328825 O. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: MYB-8874;;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 2,350 - Lar. 2,050 - Alt. 1,750', 16430),
(55, '31210524042913000139550000000164311100164311', 0, 1, '2021-05-12 07:57:55', 1, 1, '25411', 29880, 29880, 21205.92, 21205.92, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: HHK-9013;PLACA DA CARRETA: OMD-2223;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001; ;Com. 2,350 - Lar. 2,000 - Alt. 1,800', 16431),
(56, '31210524042913000139550000000164321100164327', 0, 1, '2021-05-12 08:00:36', 1, 1, '25412', 30600, 30600, 22198.54, 22198.54, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: OMD-2C18;PLACA DO REBOQUE: NYE-6728;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001; ;Com. 2,400 - Lar. 2,050 - Alt. 1,800', 16432),
(57, '31210524042913000139550000000164331100164332', 0, 1, '2021-05-12 08:23:06', 1, 1, '25413', 27610, 27610, 18807.09, 18807.09, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: HHK-9A14;PLACA DO REBOQUE: OYJ-9628;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001; ;Com. 2,450 - Lar. 1,750 - Alt. 1,750', 16433);
INSERT INTO `nf_ident` (`id`, `chave`, `serie`, `tpNF`, `dhEmi`, `emissor`, `qtdvol`, `Numeracao_item`, `Pbruto`, `Pliquido`, `vProd`, `vNF`, `transport`, `info_comp_nota`, `nNF`) VALUES
(58, '31210524042913000139550000000164341100164348', 0, 1, '2021-05-12 09:43:54', 1, 1, '25434', 27080, 27080, 16513.55, 16513.55, 11, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: HEH-2615;PLACA DO REBOQUE: MRA-1349;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001; ;Com. 3,100 - Lar. 1,250 - Alt. 1,700', 16434),
(59, '31210524042913000139550000000164381100164380', 0, 1, '2021-05-13 16:08:09', 1, 1, '25442', 33770, 33770, 22371.49, 22371.49, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: OMD-2C23;PLACA DO REBOQUE: OQI-6571;;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001; ;Com. 3,000 - Lar. 1,700 - Alt. 1,750', 16438),
(60, '31210524042913000139550000000164391100164395', 0, 1, '2021-05-13 16:40:18', 1, 1, '25448', 26700, 26700, 18002.47, 18002.47, 11, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: HEH-2615;PLACA DO REBOQUE: MRA-1349;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001; ;Com. 2,850 - Lar. 1,400 - Alt. 1,800', 16439),
(61, '31210524042913000139550000000164411100164415', 0, 1, '2021-05-14 15:16:11', 1, 1, '25432', 30380, 30380, 22266.22, 22266.22, 11, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: OQH-4301 ;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 2,350 - Lar. 2,100 - Alt. 1,800', 16441),
(62, '31210524042913000139550000000164421100164420', 0, 1, '2021-05-14 15:18:09', 1, 1, '25424', 29990, 29990, 20812.38, 20812.38, 10, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: MYB-8874 ;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 2,250 - Lar. 2,050 - Alt. 1,800', 16442),
(63, '31210524042913000139550000000164431100164436', 0, 1, '2021-05-14 16:05:58', 1, 1, '25447', 33740, 33740, 24083.51, 24083.51, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: HHK-9A14;PLACA DO REBOQUE: OYJ-9628;;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 3,050 - Lar. 1,800 - Alt. 1,750', 16443),
(64, '31210524042913000139550000000164441100164441', 0, 1, '2021-05-17 08:05:54', 1, 1, '25438', 33570, 33570, 22333.9, 22333.9, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: OMD-2C23;PLACA DO REBOQUE: OQI-6571;;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001;\' ;Com. 3,000 - Lar. 1,650 - Alt. 1,800', 16444),
(65, '31210524042913000139550000000164451100164457', 0, 1, '2021-05-17 08:08:54', 1, 1, '25435', 33700, 33700, 24477.05, 24477.05, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: OMD-2C18;PLACA DO REBOQUE: NYE-6728;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001; ;Com. 3,100 - Lar. 1,750 - Alt. 1,800', 16445),
(66, '31210524042913000139550000000164461100164462', 0, 1, '2021-05-17 08:17:06', 1, 1, '25439', 33990, 33990, 23489.44, 23489.44, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: HHK-9013;PLACA DA CARRETA: OMD-2223;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 3,150 - Lar. 1,700 - Alt. 1,750', 16446),
(67, '31210524042913000139550000000164471100164478', 0, 1, '2021-05-17 09:10:18', 1, 1, '25443', 32650, 32650, 21444.05, 21444.05, 11, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: OQH-4301 ;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 3,050 - Lar. 1,650 - Alt. 1,700', 16447),
(68, '31210524042913000139550000000164481100164483', 0, 1, '2021-05-17 10:18:14', 1, 1, '25418', 30610, 30610, 20303.54, 20303.54, 12, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: GLC-6116;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 2,250 - Lar. 2,000 - Alt. 1,800', 16448),
(69, '31210524042913000139550000000164491100164499', 0, 1, '2021-05-17 15:59:37', 1, 1, '25426', 24140, 24140, 15227.66, 15227.66, 11, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: HEH-2615;PLACA DO REBOQUE: MRA-1349;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 2,250 - Lar. 1,500 - Alt. 1,800', 16449),
(70, '31210524042913000139550000000164501100164503', 0, 1, '2021-05-17 16:02:11', 1, 1, '25417', 30280, 30280, 21188.37, 21188.37, 10, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: MYB-8874;;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 2,300 - Lar. 2,100 - Alt. 1,750', 16450),
(71, '31210524042913000139550000000164511100164519', 0, 1, '2021-05-18 08:10:34', 1, 1, '25414', 29120, 29120, 21002.89, 21002.89, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: OMD-2C23;PLACA DO REBOQUE: OQI-6571;;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001;\' ;Com. 2,450 - Lar. 1,900 - Alt. 1,800', 16451),
(72, '31210524042913000139550000000164521100164524', 0, 1, '2021-05-18 08:17:52', 1, 1, '25422', 30430, 30430, 20178.21, 20178.21, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: HHK-9A14;PLACA DO REBOQUE: OYJ-9628;;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 2,300 - Lar. 2,000 - Alt. 1,750', 16452),
(73, '31210524042913000139550000000164531100164530', 0, 1, '2021-05-18 08:28:53', 1, 1, '25425', 29290, 29290, 20581.77, 20581.77, 11, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: OQH-4301 ;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 2,300 - Lar. 2,100 - Alt. 1,700', 16453),
(74, '31210524042913000139550000000164541100164545', 0, 1, '2021-05-18 16:55:30', 1, 1, '25421', 30360, 30360, 21273.6, 21273.6, 12, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: GLC-6116;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 2,300 - Lar. 2,050 - Alt. 1,800', 16454),
(75, '31210524042913000139550000000164551100164550', 0, 1, '2021-05-18 16:58:04', 1, 1, '25427', 25370, 25370, 16646.4, 16646.4, 11, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: HEH-2615;PLACA DO REBOQUE: MRA-1349;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 2,300 - Lar. 1,650 - Alt. 1,750', 16455),
(76, '31210524042913000139550000000164561100164566', 0, 1, '2021-05-18 17:03:55', 1, 1, '25423', 29640, 29640, 20682.04, 20682.04, 10, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: MYB-8874;;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 2,300 - Lar. 2,050 - Alt. 1,750', 16456),
(77, '31210524042913000139550000000164571100164571', 0, 1, '2021-05-19 08:09:06', 1, 1, '25437', 28530, 28530, 20641.93, 20641.93, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: HHK-9013;PLACA DA CARRETA: OMD-2223;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 3,050 - Lar. 1,500 - Alt. 1,800', 16457),
(78, '31210524042913000139550000000164581100164587', 0, 1, '2021-05-19 08:11:33', 1, 1, '25433', 27640, 27640, 19288.36, 19288.36, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: OMD-2C23;PLACA DO REBOQUE: OQI-6571;;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001;\' ;Com. 2,250 - Lar. 1,900 - Alt. 1,800', 16458),
(79, '31210524042913000139550000000164591100164592', 0, 1, '2021-05-19 08:14:05', 1, 1, '25429', 29270, 29270, 19175.57, 19175.57, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: HHK-9A14;PLACA DO REBOQUE: OYJ-9628;;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 2,250 - Lar. 2,000 - Alt. 1,700', 16459),
(80, '31210524042913000139550000000164601100164607', 0, 1, '2021-05-19 08:17:45', 1, 1, '25430', 29620, 29620, 20303.54, 20303.54, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: OMD-2C18;PLACA DO REBOQUE: NYE-6728;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001; ;Com. 2,250 - Lar. 2,000 - Alt. 1,800', 16460),
(81, '31210524042913000139550000000164611100164612', 0, 1, '2021-05-19 08:43:21', 1, 1, '25431', 28540, 28540, 19288.36, 19288.36, 11, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: OQH-4301 ;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 2,250 - Lar. 1,900 - Alt. 1,800', 16461),
(82, '31210524042913000139550000000164621100164628', 0, 1, '2021-05-19 16:58:15', 1, 1, '25420', 25380, 25380, 17215.4, 17215.4, 11, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: HEH-2615;PLACA DO REBOQUE: MRA-1349;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 2,250 - Lar. 1,650 - Alt. 1,850', 16462),
(83, '31210524042913000139550000000164631100164633', 0, 1, '2021-05-19 17:00:38', 1, 1, '25409', 28480, 28480, 20754.73, 20754.73, 12, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: GLC-6116;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 2,300 - Lar. 2,000 - Alt. 1,800', 16463),
(84, '31210524042913000139550000000164641100164649', 0, 1, '2021-05-20 08:21:59', 1, 1, '25445', 27090, 27090, 17679.12, 17679.12, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: HHK-9013;PLACA DA CARRETA: OMD-2223;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 3,100 - Lar. 1,300 - Alt. 1,750', 16464),
(85, '31210524042913000139550000000164651100164654', 0, 1, '2021-05-20 08:23:22', 1, 1, '25419', 26260, 26260, 18160.39, 18160.39, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: HHK-9A14;PLACA DO REBOQUE: OYJ-9628;;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 2,300 - Lar. 1,750 - Alt. 1,800', 16465),
(86, '31210524042913000139550000000164661100164660', 0, 1, '2021-05-20 08:25:29', 1, 1, '25416', 27150, 27150, 17686.64, 17686.64, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: OMD-2C23;PLACA DO REBOQUE: OQI-6571;;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 2,450 - Lar. 1,600 - Alt. 1,800', 16466),
(87, '31210524042913000139550000000164671100164675', 0, 1, '2021-05-20 08:28:33', 1, 1, '25428', 26680, 26680, 18160.39, 18160.39, 1, 'Mercadoria destinada a formacao de lote para exportacao, enviada para Recinto Especial para Despacho Aduaneiro de Exportacao (Redex), ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020, VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA, CNPJ n 32.318.949/0001-20, a Rodovia Darly Santos, n 1625, Jardim Asteca, municipio de Vila Velha, estado do Espirito Santo. Posteriormente os Blocos Serao Transportados ate o Porto para EMBARQUE COM A COSCO. NR. DO BOOKING DA COSCO: 1COSVIX5069. XIAMEN SUNEVER.;1Transportes Rodoferroviario. Transporte efetuado de MEDINA - MG. ate G. Valadares - MG. Onde os blocos. ;2Serao Embarcados e Redespachados atraves EFVM.;3Nota Fiscal emitida nos termos do anexo IX Art. 253-A;4Transp. mercadoria destinada ao exterior. Isenta ICMS - Item 126 parte 1 Anexo I RICMS;PLACA DO CAVALO: OMD-2C18;PLACA DO REBOQUE: NYE-6728;;Processo ANM - 831.459/1986;Portaria de Lavra n 063 de 09/04/2001;D.O.U de 09/04/2001 ;Com. 2,300 - Lar. 1,750 - Alt. 1,800', 16467),
(88, '32210519270937000105550010000079341000075050', 1, 1, '2021-05-05 17:00:24', 6, 1, 'IZBES 2455', 32760, 32760, 10572.49, 10572.49, 7, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES, ATO DECLARATORIO NO. 25, DE 29.07.1996. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002.;LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825.;E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352.;;(IZBES 2455) ** UF:ES - NF Origem:057260 - Comp:2,950 - Alt:1,650 - Larg:1,650', 7934),
(89, '32210519270937000105550010000079351000075066', 1, 1, '2021-05-05 17:05:18', 6, 1, 'IZBEB 2458', 28269, 28269, 8264.74, 8264.74, 7, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES, ATO DECLARATORIO NO. 25, DE 29.07.1996. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002.;LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825.;E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352.;;(IZBEB 2458) ** UF:ES - NF Origem:057261 - Comp:2,700 - Alt:1,550 - Larg:1,500', 7935),
(90, '32210519270937000105550010000079391000075103', 1, 1, '2021-05-07 15:52:46', 6, 0, '', 0, 0, 7560.43, 7560.43, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MQV7314.;;(IZBBI 2501) ** UF:ES - NF Origem:057265 - Comp:3,900 - Alt:1,550 - Larg:0,950', 7939),
(91, '32210519270937000105550010000079401000075112', 1, 1, '2021-05-07 16:04:38', 6, 0, '', 0, 0, 5675.26, 5675.26, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. EMAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MQV7316;;(IZBBC 2500) ** UF:ES - NF Origem:057264 - Comp:2,750 - Alt:1,650 - Larg:0,950', 7940),
(92, '32210519270937000105550010000079411000075128', 1, 1, '2021-05-07 16:11:10', 6, 0, '', 0, 0, 5302.7, 5302.7, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. EMAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA PPI2183;;(IZBBZ 2502) ** UF:ES - NF Origem:057263 - Comp:2,650 - Alt:1,900 - Larg:0,800', 7941),
(93, '32210519270937000105550010000079421000075133', 1, 1, '2021-05-10 11:34:10', 6, 0, '', 0, 0, 4795.86, 4795.86, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA PPI2183;;(IZBEA 2459) ** UF:ES - NF Origem:057266 - Comp:2,950 - Alt:1,300 - Larg:0,950', 7942),
(94, '32210519270937000105550010000079431000075149', 1, 1, '2021-05-10 11:38:48', 6, 0, '', 0, 0, 5612.07, 5612.07, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MQV7316;;(IZBHI 2461) ** UF:ES - NF Origem:057267 - Comp:2,750 - Alt:1,550 - Larg:1,000', 7943),
(95, '32210519270937000105550010000079441000075154', 1, 1, '2021-05-10 11:41:52', 6, 0, '', 0, 0, 6661.29, 6661.29, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MQV 7314;;(IZBHG 2466) ** UF:ES - NF Origem:057268 - Comp:2,750 - Alt:1,600 - Larg:1,150', 7944),
(96, '32210519270937000105550010000079451000075160', 1, 1, '2021-05-10 15:19:12', 6, 0, '', 0, 0, 10805.5, 10805.5, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MTR3B67;;(IZBLB 2498) ** UF:ES - NF Origem:057269 - Comp:2,700 - Alt:1,600 - Larg:1,900', 7945),
(97, '32210519270937000105550010000079491000075207', 1, 1, '2021-05-11 13:15:34', 6, 0, '', 0, 0, 4497.03, 4497.03, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MTB5F65;;(IZBSE 2473) ** UF:ES - NF Origem:057270 - Comp:2,300 - Alt:1,650 - Larg:0,900', 7949),
(98, '32210519270937000105550010000079501000075216', 1, 1, '2021-05-11 13:22:01', 6, 0, '', 0, 0, 4923.56, 4923.56, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5669;;(IZBSA 2479) ** UF:ES - NF Origem:057271 - Comp:2,750 - Alt:1,600 - Larg:0,850', 7950),
(99, '32210519270937000105550010000079511000075221', 1, 1, '2021-05-11 13:25:43', 6, 0, '', 0, 0, 7482.76, 7482.76, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MQV5670;;(IZBHS 2465) ** UF:ES - NF Origem:057272 - Comp:2,650 - Alt:1,650 - Larg:1,300', 7951),
(100, '32210519270937000105550010000079521000075237', 1, 1, '2021-05-11 13:30:15', 6, 0, '', 0, 0, 3928.32, 3928.32, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA PPI2B82;;(IZBGC 2480) ** UF:ES - NF Origem:057273 - Comp:2,700 - Alt:1,700 - Larg:0,650', 7952),
(101, '32210519270937000105550010000079531000075242', 1, 1, '2021-05-11 13:42:53', 6, 0, '', 0, 0, 7100.99, 7100.99, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5662;;(IZBSB 2478) ** UF:ES - NF Origem:057274 - Comp:2,900 - Alt:1,550 - Larg:1,200', 7953),
(102, '32210519270937000105550010000079541000075258', 1, 1, '2021-05-11 13:55:07', 6, 0, '', 0, 0, 8351.62, 8351.62, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5663;;(IZBGI 2481) ** UF:ES - NF Origem:057275 - Comp:2,900 - Alt:1,750 - Larg:1,250', 7954),
(103, '32210519270937000105550010000079551000075263', 1, 1, '2021-05-11 16:37:19', 6, 0, '', 0, 0, 6172.88, 6172.88, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MSV1193;;(IZBGA 2489) ** UF:ES - NF Origem:057276 - Comp:2,750 - Alt:1,550 - Larg:1,100', 7955),
(104, '32210519270937000105550010000079561000075279', 1, 1, '2021-05-11 16:44:37', 6, 0, '', 0, 0, 6451.97, 6451.97, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5556;;(IZBLI 2491) ** UF:ES - NF Origem:057277 - Comp:2,700 - Alt:1,650 - Larg:1,100', 7956),
(105, '32210519270937000105550010000079571000075284', 1, 1, '2021-05-11 16:49:20', 6, 0, '', 0, 0, 6146.55, 6146.55, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5657;;(IZBLC 2490) ** UF:ES - NF Origem:057278 - Comp:2,800 - Alt:1,450 - Larg:1,150', 7957),
(106, '32210519270937000105550010000079611000075325', 1, 1, '2021-05-13 16:13:33', 6, 0, '', 0, 0, 10384.24, 10384.24, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MTR3157;;(IZBHC 2460) ** UF:ES - NF Origem:057279 - Comp:2,900 - Alt:1,600 - Larg:1,700', 7961);
INSERT INTO `nf_ident` (`id`, `chave`, `serie`, `tpNF`, `dhEmi`, `emissor`, `qtdvol`, `Numeracao_item`, `Pbruto`, `Pliquido`, `vProd`, `vNF`, `transport`, `info_comp_nota`, `nNF`) VALUES
(107, '32210519270937000105550010000079621000075330', 1, 1, '2021-05-13 16:18:26', 6, 0, '', 0, 0, 10252.59, 10252.59, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MTR3B67;;(IZBHZ 2462) ** UF:ES - NF Origem:057280 - Comp:2,950 - Alt:1,600 - Larg:1,650', 7962),
(108, '32210519270937000105550010000079631000075346', 1, 1, '2021-05-13 16:51:58', 6, 0, '', 0, 0, 3349.07, 3349.07, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MTB5F65;;(IZBGS 2485) ** UF:ES - NF Origem:057281 - Comp:2,650 - Alt:1,600 - Larg:0,600', 7963),
(109, '32210519270937000105550010000079641000075351', 1, 1, '2021-05-13 16:55:44', 6, 0, '', 0, 0, 5860.88, 5860.88, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5669;;(IZBLZ 2492) ** UF:ES - NF Origem:057282 - Comp:2,650 - Alt:1,600 - Larg:1,050', 7964),
(110, '32210519270937000105550010000079651000075367', 1, 1, '2021-05-13 16:59:13', 6, 0, '', 0, 0, 8284.48, 8284.48, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5670;;(IZBGH 2484) ** UF:ES - NF Origem:057283 - Comp:2,800 - Alt:1,550 - Larg:1,450', 7965),
(111, '32210519270937000105550010000079661000075372', 1, 1, '2021-05-14 09:48:09', 6, 0, '', 0, 0, 3857.23, 3857.23, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MSV1193;;(IZBHB 2468) ** UF:ES - NF Origem:057284 - Comp:2,700 - Alt:1,550 - Larg:0,700', 7966),
(112, '32210519270937000105550010000079671000075388', 1, 1, '2021-05-14 09:52:45', 6, 0, '', 0, 0, 5571.26, 5571.26, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5556;;(IZBLE 2493) ** UF:ES - NF Origem:057285 - Comp:2,700 - Alt:1,650 - Larg:0,950', 7967),
(113, '32210519270937000105550010000079681000075393', 1, 1, '2021-05-14 09:57:06', 6, 0, '', 0, 0, 10893.71, 10893.71, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5657;;(IZBGL 2487) ** UF:ES - NF Origem:057286 - Comp:2,950 - Alt:1,650 - Larg:1,700', 7968),
(114, '32210519270937000105550010000079711000075429', 1, 1, '2021-05-14 15:36:50', 6, 0, '', 0, 0, 10663.33, 10663.33, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MTR3157;;(IZBEL 2457) ** UF:ES - NF Origem:057287 - Comp:2,700 - Alt:1,500 - Larg:2,000', 7971),
(115, '32210519270937000105550010000079721000075434', 1, 1, '2021-05-14 15:49:51', 6, 0, '', 0, 0, 11374.21, 11374.21, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MSQ1332;;(IZBEE 2453) ** UF:ES - NF Origem:057288 - Comp:2,700 - Alt:1,600 - Larg:2,000', 7972),
(116, '32210519270937000105550010000079751000075460', 1, 1, '2021-05-17 11:35:20', 6, 0, '', 0, 0, 3671.61, 3671.61, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MSV1193;;(IZBHL 2467) ** UF:ES - NF Origem:057291 - Comp:2,600 - Alt:1,650 - Larg:0,650', 7975),
(117, '32210519270937000105550010000079761000075476', 1, 1, '2021-05-17 11:39:35', 6, 0, '', 0, 0, 5594.96, 5594.96, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5656;;(IZBLA 2499) ** UF:ES - NF Origem:057292 - Comp:2,500 - Alt:1,700 - Larg:1,000', 7976),
(118, '32210519270937000105550010000079771000075481', 1, 1, '2021-05-17 11:43:07', 6, 0, '', 0, 0, 6871.92, 6871.92, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5657;;(IZBLH 2494) ** UF:ES - NF Origem:057293 - Comp:2,400 - Alt:1,500 - Larg:1,450', 7977),
(119, '32210519270937000105550010000079781000075497', 1, 1, '2021-05-17 14:33:39', 6, 0, '', 0, 0, 12174.62, 12174.62, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MTR3157;;(IZBEZ 2452) ** UF:ES - NF Origem:057296 - Comp:2,950 - Alt:1,650 - Larg:1,900', 7978),
(120, '32210519270937000105550010000079791000075508', 1, 1, '2021-05-17 15:00:04', 6, 0, '', 0, 0, 2581.58, 2581.58, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MTT6170;;(IZBGE 2483) ** UF:ES - NF Origem:057297 - Comp:2,300 - Alt:1,550 - Larg:0,550', 7979),
(121, '32210519270937000105550010000079801000075517', 1, 1, '2021-05-17 15:02:56', 6, 0, '', 0, 0, 6139.97, 6139.97, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5669;;(IZBBE 2503) ** UF:ES - NF Origem:057298 - Comp:2,650 - Alt:1,600 - Larg:1,100', 7980),
(122, '32210519270937000105550010000079811000075522', 1, 1, '2021-05-17 15:05:32', 6, 0, '', 0, 0, 6733.69, 6733.69, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5670;;(IZBGG 2486) ** UF:ES - NF Origem:057299 - Comp:3,000 - Alt:1,550 - Larg:1,100', 7981),
(123, '32210519270937000105550010000079821000075538', 1, 1, '2021-05-17 17:09:13', 6, 0, '', 0, 0, 10384.24, 10384.24, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MQV7316;;(IZBEG 2456) ** UF:ES - NF Origem:057300 - Comp:2,900 - Alt:1,600 - Larg:1,700', 7982),
(124, '32210519270937000105550010000079831000075543', 1, 1, '2021-05-17 17:13:15', 6, 0, '', 0, 0, 10893.71, 10893.71, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MQV7314;;(IZBGB 2488) ** UF:ES - NF Origem:057301 - Comp:2,950 - Alt:1,700 - Larg:1,650', 7983),
(125, '32210519270937000105550010000079841000075559', 1, 1, '2021-05-17 17:17:29', 6, 0, '', 0, 0, 11374.21, 11374.21, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5667;;(IZBHE 2463) ** UF:ES - NF Origem:057302 - Comp:2,700 - Alt:1,600 - Larg:2,000', 7984),
(126, '32210519270937000105550010000079851000075564', 1, 1, '2021-05-17 17:24:10', 6, 0, '', 0, 0, 10873.96, 10873.96, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5668;;(IZBHH 2464) ** UF:ES - NF Origem:057303 - Comp:2,950 - Alt:1,600 - Larg:1,750', 7985),
(127, '32210519270937000105550010000079861000075570', 1, 1, '2021-05-18 13:32:00', 6, 0, '', 0, 0, 11024.04, 11024.04, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5656;;(IZBHA 2469) ** UF:ES - NF Origem:057304 - Comp:2,900 - Alt:1,650 - Larg:1,750', 7986),
(128, '32210519270937000105550010000079871000075585', 1, 1, '2021-05-18 13:35:13', 6, 0, '', 0, 0, 11534.82, 11534.82, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5657;;(IZBSC 2470) ** UF:ES - NF Origem:057305 - Comp:2,950 - Alt:1,650 - Larg:1,800', 7987),
(129, '32210519270937000105550010000079881000075590', 1, 1, '2021-05-18 14:00:15', 6, 0, '', 0, 0, 11163.58, 11163.58, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MTT6B69;;(IZBSG 2476) ** UF:ES - NF Origem:057306 - Comp:2,650 - Alt:1,600 - Larg:2,000', 7988),
(130, '32210519270937000105550010000079941000075652', 1, 1, '2021-05-19 11:17:22', 6, 0, '', 0, 0, 11143.83, 11143.83, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5667;;(IZBSI 2471) ** UF:ES - NF Origem:057308 - Comp:2,700 - Alt:1,650 - Larg:1,900', 7994),
(131, '32210519270937000105550010000079951000075668', 1, 1, '2021-05-19 11:22:27', 6, 0, '', 0, 0, 10752.85, 10752.85, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5668;;(IZBSS 2475) ** UF:ES - NF Origem:057309 - Comp:2,750 - Alt:1,650 - Larg:1,800', 7995),
(132, '32210519270937000105550010000079961000075673', 1, 1, '2021-05-19 13:10:27', 6, 0, '', 0, 0, 11555.89, 11555.89, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5669;;(IZBEI 2451) ** UF:ES - NF Origem:057310 - Comp:2,800 - Alt:1,650 - Larg:1,900', 7996),
(133, '32210519270937000105550010000079971000075689', 1, 1, '2021-05-19 13:14:42', 6, 0, '', 0, 0, 10662.01, 10662.01, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5670;;(IZBLS 2495) ** UF:ES - NF Origem:057311 - Comp:2,750 - Alt:1,550 - Larg:1,900', 7997),
(134, '32210519270937000105550010000079981000075694', 1, 1, '2021-05-19 14:38:54', 6, 0, '', 0, 0, 10730.47, 10730.47, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5656;;(IZBLG 2496) ** UF:ES - NF Origem:057312 - Comp:2,600 - Alt:1,650 - Larg:1,900', 7998),
(135, '32210519270937000105550010000079991000075705', 1, 1, '2021-05-19 14:43:08', 6, 0, '', 0, 0, 11436.09, 11436.09, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA OVK5657;;(IZBLL 2497) ** UF:ES - NF Origem:057313 - Comp:2,700 - Alt:1,650 - Larg:1,950', 7999),
(136, '32210519270937000105550010000080001000075716', 1, 1, '2021-05-19 15:57:56', 6, 0, '', 0, 0, 11268.9, 11268.9, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MTR3157;;(IZBSH 2474) ** UF:ES - NF Origem:057314 - Comp:2,650 - Alt:1,700 - Larg:1,900', 8000),
(137, '32210519270937000105550010000080011000075721', 1, 1, '2021-05-19 16:01:56', 6, 0, '', 0, 0, 3359.61, 3359.61, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MTT6B89;;(IZBGZ 2482) ** UF:ES - NF Origem:057315 - Comp:2,900 - Alt:1,600 - Larg:0,550', 8001),
(138, '32210519270937000105550010000080021000075737', 1, 1, '2021-05-19 16:05:27', 6, 0, '', 0, 0, 6835.06, 6835.06, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MSW7D32;;(IZBSL 2477) ** UF:ES - NF Origem:057316 - Comp:2,950 - Alt:1,600 - Larg:1,100', 8002),
(139, '32210519270937000105550010000080031000075742', 1, 1, '2021-05-20 09:29:10', 6, 0, '', 0, 0, 11436.09, 11436.09, 2, 'BOOKING COSCO: 1COSVIX5102, PORTO DESTINO: XIAMEN. MERCADORIA PARA FORMACAO DE LOTE DE EXPORTACAO, NAVIO TIAN JIAN A SER DESCARREGADO NO PORTO DE VITORIA/ES. TERMOS DA LEI COMPL 87/96 DE 13/09/96 ART 3 INC II, NAO INC ICMS CONF ART 4INC.II DO DECRETO N 1090 R 25/10/2002. LOCAL DE ENTREGA: VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. ROD DARLY SANTOS, 1191, VILA VELHA, CEP 29.104-491 - ES. CNPJ. 32.318.949/ 0001-20. DETALHES DO REDEX: LATITUDE: 20.368027 / LONGITUDE: 40.328825. ATO DECLARATORIO EXECUTIVO N 5, DE 22 DE JULHO DE 2020. E-MAIL: redex@vilavelhaterminais.com.br / controle@vilavelhaterminais.com.br. PHONE: (27) 3329-9352. PLACA MTR3B67;;(IZBSZ 2472) ** UF:ES - NF Origem:057354 - Comp:2,700 - Alt:1,650 - Larg:1,950', 8003),
(140, '32210403799534000118550010000172551764310401', 1, 1, '2021-04-06 09:10:36', 13, 1, '11098', 34755, 34755, 5801.25, 5801.25, 14, 'NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11098 - ORIGEM ES NF: 23313 - F2C/451/20C.MOTORISTA: JOAO PAULO PEREIRA GASTALDI, CPF: 135.687.657-99 , PLACA DA CARRETA: ODL7F03--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17255),
(141, '32210403799534000118550010000172571324790000', 1, 1, '2021-04-06 09:29:18', 13, 1, '11099', 33390, 33390, 5646.25, 5646.25, 14, 'NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11099 - ORIGEM ES NF: 23311 - F2C/451/20C.MOTORISTA: LUIZ CARLOS TIMOTEO, CPF: 001.547.747-90, PLACA DA CARRETA: MTL8C42--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | ES NF 23322 BL 11099 2,9499999999999997 x 1,75 x 1,75', 17257),
(142, '32210403799534000118550010000172581823889778', 1, 1, '2021-04-06 09:34:23', 13, 1, '11100', 28859, 28859, 4503.75, 4503.75, 14, 'NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11100 - ORIGEM ES NF: 23306 - F2C/451/20C.MOTORISTA: JOCIMAR DA SILVA, CPF: 082.459.847-44, PLACA DA CARRETA: MRU-6E34.--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17258),
(143, '32210403799534000118550010000172591378438369', 1, 1, '2021-04-06 09:41:16', 13, 1, '11101', 27233, 27233, 4250, 4250, 14, 'NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11101 - ORIGEM ES NF: 23307 - F2C/451/20C.MOTORISTA: LUCIOMAR FORTUNA, CPF: 035.733.287-33, PLACA DA CARRETA: MTV4C29.--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17259),
(144, '32210403799534000118550010000172601871052554', 1, 1, '2021-04-06 09:49:48', 13, 1, '11102', 34238, 34238, 5610, 5610, 14, 'NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11102 - ORIGEM ES NF: 23314 - F2C/451/20C.MOTORISTA: RONISON PESSOA DA SILVA, CPF 030.971.647-07, PLACA DA CARRETA:NCK-4387--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17260),
(145, '32210403799534000118550010000172611206979114', 1, 1, '2021-04-06 09:56:58', 13, 1, '11104', 36506.4, 36506.4, 5825, 5825, 14, 'NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11104 - ORIGEM ES NF: 23315 - F2C/451/20C.MOTORISTA: RODRIGO GRILLO MILANEZ, CPF: 125.980.617-05, PLACA DA CARRETA: QRK 9I83--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17261),
(146, '32210403799534000118550010000172621333468876', 1, 1, '2021-04-06 10:06:08', 13, 1, '11105', 36896, 36896, 5940, 5940, 14, 'NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11105 - ORIGEM ES NF: 23312 - F2C/451/20C.MOTORISTA: CRISTIAN JOSE MATOS, CPF: 080.797.987-29 , PLACA DA CARRETA:MTI6C85.--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17262),
(147, '32210403799534000118550010000172661275968084', 1, 1, '2021-04-07 09:03:58', 13, 1, 'LEA123', 34560, 34560, 6132.75, 6132.75, 14, 'MERCADORIA COM FIM ESPECIFICO DE EXPORTACAO CONF. ART. 373 DO RICMS/ES, DECRETO 1.090-R/2002. NAO INCIDENCIA DE ICMS CONF. ART. 4, INCISO II, PARAGRAFO 1, INCISO I DO RICMS/ES, DECRETO 1.090-R/2002. NAO INCIDENCIA DE PIS/COFINS CONF. ART. 3, INCISO II, DA INSTRUCAO NORMATIVA RFB N 1.152/2011. SUSPENSAO DE IPI CONF. ART. 43, INCISO V, DO DECRETO N 7.212/2010. - NR. DO BOOKING: 1COSVIX5076 - PORTO DE DESTINO: VITORIA DESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/A - RECINTO ALFANDEGADO NR. 7951304 ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES, CEP.: 29.115-910 - CNPJ: 31.807.464/0001-38 - BLOCO: LEA-123 - ORIGEM ES NF: 24 - MOTORISTA : FLAVIO BUZATO BENEDITO, CPF: 080.282.387-42 , PLACA DA CARRETA: MQW9826 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17266),
(148, '32210403799534000118550010000172761658712500', 1, 1, '2021-04-07 14:34:52', 13, 1, '11103', 14797, 14979, 2211.88, 2211.88, 14, 'NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11103 - ORIGEM ES NF: 23345 - F2C/451/20C.MOTORISTA: JOCIMAR DA SILVA, CPF: 082.459.847-44, PLACA DA CARRETA: MRU-6E34.--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17276),
(149, '32210403799534000118550010000172901350967960', 1, 1, '2021-04-08 12:14:25', 13, 1, 'LEG-120', 34560, 34560, 6040.45, 6040.45, 14, 'MERCADORIA COM FIM ESPECIFICO DE EXPORTACAO CONF. ART. 373 DO RICMS/ES, DECRETO 1.090-R/2002. NAO INCIDENCIA DE ICMS CONF. ART. 4, INCISO II, PARAGRAFO 1, INCISO I DO RICMS/ES, DECRETO 1.090-R/2002. NAO INCIDENCIA DE PIS/COFINS CONF. ART. 3, INCISO II, DA INSTRUCAO NORMATIVA RFB N 1.152/2011. SUSPENSAO DE IPI CONF. ART. 43, INCISO V, DO DECRETO N 7.212/2010. - NR. DO BOOKING: 1COSVIX5076 - PORTO DE DESTINO: VITORIA DESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/A - RECINTO ALFANDEGADO NR. 7951304 ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES, CEP.: 29.115-910 - CNPJ: 31.807.464/0001-38 - BLOCO: LEG-120 - ORIGEM ES NF: 22 - MOTORISTA : FLAVIO BUZATO BENEDITO, CPF: 080.282.387-42 , PLACA DA CARRETA: MQW9826 | ES NF 46 BL LEG-120 2,9499999999999997 x 1,7999999999999998 x 1,75', 17290),
(150, '32210403799534000118550010000172951249267505', 1, 1, '2021-04-09 11:30:47', 13, 1, 'LLW-118', 24192, 24192, 3501.55, 3501.55, 14, 'MERCADORIA COM FIM ESPECIFICO DE EXPORTACAO CONF. ART. 373 DO RICMS/ES, DECRETO 1.090-R/2002. NAO INCIDENCIA DE ICMS CONF. ART. 4, INCISO II, PARAGRAFO 1, INCISO I DO RICMS/ES, DECRETO 1.090-R/2002. NAO INCIDENCIA DE PIS/COFINS CONF. ART. 3, INCISO II, DA INSTRUCAO NORMATIVA RFB N 1.152/2011. SUSPENSAO DE IPI CONF. ART. 43, INCISO V, DO DECRETO N 7.212/2010. - NR. DO BOOKING: 1COSVIX5076 - PORTO DE DESTINO: VITORIA DESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/A - RECINTO ALFANDEGADO NR. 7951304 ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES, CEP.: 29.115-910 - CNPJ: 31.807.464/0001-38 - BLOCO: LLW-118 - ORIGEM ES NF:20 - MOTORISTA : FLAVIO BUZATO BENEDITO, CPF: 080.282.387-42 , PLACA DA CARRETA: MQW9826 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17295),
(151, '32210403799534000118550010000172971089874802', 1, 1, '2021-04-09 11:43:53', 13, 1, 'LLS-119', 34560, 34560, 5405.4, 5405.4, 14, 'MERCADORIA COM FIM ESPECIFICO DE EXPORTACAO CONF. ART. 373 DO RICMS/ES, DECRETO 1.090-R/2002. NAO INCIDENCIA DE ICMS CONF. ART. 4, INCISO II, PARAGRAFO 1, INCISO I DO RICMS/ES, DECRETO 1.090-R/2002. NAO INCIDENCIA DE PIS/COFINS CONF. ART. 3, INCISO II, DA INSTRUCAO NORMATIVA RFB N 1.152/2011. SUSPENSAO DE IPI CONF. ART. 43, INCISO V, DO DECRETO N 7.212/2010. - NR. DO BOOKING: 1COSVIX5076 - PORTO DE DESTINO: VITORIA DESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/A - RECINTO ALFANDEGADO NR. 7951304 ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES, CEP.: 29.115-910 - CNPJ: 31.807.464/0001-38 - BLOCO: LLS-119 - ORIGEM ES NF:21 - MOTORISTA : RUAN VICTOR VINGLER MENON, CPF:124.721.867-89, PLACA DA CARRETA: QRK 9I84 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17297),
(152, '32210403799534000118550010000172981013255734', 1, 1, '2021-04-09 11:51:00', 13, 1, 'LEL-121', 34560, 34560, 5937.75, 5937.75, 14, 'MERCADORIA COM FIM ESPECIFICO DE EXPORTACAO CONF. ART. 373 DO RICMS/ES, DECRETO 1.090-R/2002. NAO INCIDENCIA DE ICMS CONF. ART. 4, INCISO II, PARAGRAFO 1, INCISO I DO RICMS/ES, DECRETO 1.090-R/2002. NAO INCIDENCIA DE PIS/COFINS CONF. ART. 3, INCISO II, DA INSTRUCAO NORMATIVA RFB N 1.152/2011. SUSPENSAO DE IPI CONF. ART. 43, INCISO V, DO DECRETO N 7.212/2010. - NR. DO BOOKING: 1COSVIX5076 - PORTO DE DESTINO: VITORIA DESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/A - RECINTO ALFANDEGADO NR. 7951304 ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES, CEP.: 29.115-910 - CNPJ: 31.807.464/0001-38 - BLOCO: LEL-121 - ORIGEM ES NF:26 - MOTORISTA : LUIZ CARLOS TIMOTEO , CPF: 001.547.747-90 - PLACA DA CARRETA: GSW 8C59 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17298),
(153, '32210403799534000118550010000173171133250729', 1, 1, '2021-04-13 14:54:58', 13, 1, '11069', 32595, 32595, 5259.38, 5259.38, 14, 'NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11069 - ORIGEM ES NF: 23378 - F2C/450/20C.MOTORISTA: ANTONIO MARCOS DE MORAES, CPF: 088.216.227-62 , PLACA DA CARRETA:MTN-2J94--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17317),
(154, '32210403799534000118550010000173181467557609', 1, 1, '2021-04-13 15:02:51', 13, 1, '11070', 33390, 33390, 5328.75, 5328.75, 14, 'NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11070 - ORIGEM ES NF: 23379 - F2C/450/20C.MOTORISTA: ALAILTON MARINHO DE LIMA, CPF: 097.037.757-64, PLACA DA CARRETA: MQW7582.--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17318),
(155, '32210403799534000118550010000173191320878056', 1, 1, '2021-04-13 15:10:03', 13, 1, '11076', 31800, 31800, 5263.75, 5263.75, 14, 'NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11076 - ORIGEM ES NF: 23380 - F2C/450/20C.MOTORISTA: CASSIO RODRIGUES DE OLIVEIRA, CPF: 084.090.087-26, PLACA DA CARRETA:MQL-1938 .--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | ES NF 23510 BL 11076 2,75 x 1,75 x 1,75', 17319),
(156, '32210403799534000118550010000173201163453186', 1, 1, '2021-04-13 15:16:59', 13, 1, '11078', 30613, 30613, 5171.88, 5171.88, 14, 'NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11078 - ORIGEM ES NF: 23382 - F2C/450/20C.MOTORISTA: JOAO PAULO PEREIRA GASTALDI, CPF: 135.687.657-99 , PLACA DA CARRETA: ODL7F03--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17320),
(157, '32210403799534000118550010000173211450777193', 1, 1, '2021-04-13 15:21:37', 13, 1, '11106', 32526.1, 32526.1, 4488, 4488, 14, 'DESCONTO CONCEDIDO CONFORME PAUTA DE VALORESMINIMOS, ART. 4, II, DA ORDEM DE SERVICO N 148 DE 22/05/2012NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11106 - ORIGEM ES NF: 23398 - F2C/445/30C.MOTORISTA: EDIMAR DA SILVA ALVES, CPF: 057.192.377-12, PLACA DA CARRETA: OYG 0E55.--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17321),
(158, '32210403799534000118550010000173221037910365', 1, 1, '2021-04-13 15:40:36', 13, 1, '11107', 36146, 36146, 4641, 4641, 14, 'DESCONTO CONCEDIDO CONFORME PAUTA DE VALORESMINIMOS, ART. 4, II, DA ORDEM DE SERVICO N 148 DE 22/05/2012NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11107 - ORIGEM ES NF: 23399 - F2C/445/30C.MOTORISTA: LUIZ CARLOS TIMOTEO, CPF: 001.547.747-90, PLACA DA CARRETA: MTL8C42--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17322),
(159, '32210403799534000118550010000173291327898768', 1, 1, '2021-04-13 16:48:09', 13, 1, '11109', 36250, 36250, 4851, 4851, 14, 'DESCONTO CONCEDIDO CONFORME PAUTA DE VALORESMINIMOS, ART. 4, II, DA ORDEM DE SERVICO N 148 DE 22/05/2012NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11109 - ORIGEM ES NF: 23401 - F2C/445/30C.MOTORISTA: LUCIOMAR FORTUNA, CPF: 035.733.287-33, PLACA DA CARRETA: MTV4C29.--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17329),
(160, '32210403799534000118550010000173301143595828', 1, 1, '2021-04-13 17:03:13', 13, 1, '11108', 34261, 34261, 4340, 4340, 14, 'DESCONTO CONCEDIDO CONFORME PAUTA DE VALORESMINIMOS, ART. 4, II, DA ORDEM DE SERVICO N 148 DE 22/05/2012NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11108 - ORIGEM ES NF: 23400 - F2C/445/30C.MOTORISTA: JOCIMAR DA SILVA, CPF: 082.459.847-44, PLACA DA CARRETA: MRU-6E34.--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17330);
INSERT INTO `nf_ident` (`id`, `chave`, `serie`, `tpNF`, `dhEmi`, `emissor`, `qtdvol`, `Numeracao_item`, `Pbruto`, `Pliquido`, `vProd`, `vNF`, `transport`, `info_comp_nota`, `nNF`) VALUES
(161, '32210403799534000118550010000173381289657680', 1, 1, '2021-04-14 14:40:59', 13, 1, '11110', 38735.05, 38735.05, 5237, 5237, 14, 'DESCONTO CONCEDIDO CONFORME PAUTA DE VALORESMINIMOS, ART. 4, II, DA ORDEM DE SERVICO N 148 DE 22/05/2012NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11110 - ORIGEM ES NF: 23402 - F2C/445/30C.MOTORISTA: FLAVIO BUZATO BENEDITO, CPF:080.282.387-42 , PLACA DA CARRETA: MQW9826--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | ES NF 23517 BL 11110 2,8499999999999996 x 1,75 x 2,1000000000000000888178419700125232339', 17338),
(162, '32210403799534000118550010000173391913948072', 1, 1, '2021-04-14 14:44:19', 13, 1, '11111', 36729, 36729, 4785, 4785, 14, 'DESCONTO CONCEDIDO CONFORME PAUTA DE VALORESMINIMOS, ART. 4, II, DA ORDEM DE SERVICO N 148 DE 22/05/2012NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11111 - ORIGEM ES NF: 23403 - F2C/445/30C.MOTORISTA: RUAN VICTOR VINGLER MENON, CPF: 124.721.867-89 , PLACA DA CARRETA:QRK-9I84--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17339),
(163, '32210403799534000118550010000173401310237450', 1, 1, '2021-04-14 14:53:19', 13, 1, '11113', 29256, 29256, 3949, 3949, 14, 'DESCONTO CONCEDIDO CONFORME PAUTA DE VALORESMINIMOS, ART. 4, II, DA ORDEM DE SERVICO N 148 DE 22/05/2012NR. DO BOOKING 1COSVIX5076 - PORTO DE DESTINO: VITORIADESTINADO A HIPER EXPORT TERMINAIS RETROPORTUARIOS S/ARECINTO ALFANDEGADO NR. 7951304ENDERECO: AV. CAPUABA, 1500 - ILHA DAS FLORES, VILA VELHA - ES,CEP.: 29115-910 // CNPJ: 31.807.464/0001-38 -LOTE: 11113 - ORIGEM ES NF: 23405 - F2C/446/30C.MOTORISTA: PAULO CESAR FABRES ROSA, CPF: 887.565.057-87 , PLACA DA CARRETA:MQS 2F40.--BLPGAMSCLIG 1 BLOCO(S)--Mercadoria com fim especifico de exportacao conf. Art. 373 do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de ICMS conf. art. 4, inciso II, paragrafo 1, inciso I do RICMS/ES, Decreto 1.090-R/2002. Nao incidencia de PIS/COFINS conf. art. 3, inciso II, da Instrucao Normativa RFB n 1.152/2011. Suspensao de IPI conf. Art. 43, inciso V, do Decreto n 7.212/2010. | ES NF 23519 BL 11113 3,25 x 1,7999999999999998 x 1,3500000000000000888178419700125232339', 17340),
(164, '32210503799534000118550010000174441328846759', 1, 1, '2021-05-04 14:33:49', 13, 1, '11147', 38160, 38160, 4869.5, 4869.5, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17444),
(165, '32210503799534000118550010000174451514329308', 1, 1, '2021-05-04 14:36:21', 13, 1, '11112', 17782, 17782, 1904, 1904, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17445),
(166, '32210503799534000118550010000174461729793502', 1, 1, '2021-05-04 14:39:27', 13, 1, '11114', 34980, 34980, 4475.5, 4475.5, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17446),
(167, '32210503799534000118550010000174471233931858', 1, 1, '2021-05-04 14:40:52', 13, 1, '11115', 32065, 32065, 4226.5, 4226.5, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17447),
(168, '32210503799534000118550010000174481219404142', 1, 1, '2021-05-04 14:42:09', 13, 1, '11116', 33873, 33873, 4505, 4505, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17448),
(169, '32210503799534000118550010000174491626396359', 1, 1, '2021-05-04 14:43:29', 13, 1, '11117', 34893, 34893, 4440, 4440, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17449),
(170, '32210503799534000118550010000174501142312956', 1, 1, '2021-05-04 14:45:18', 13, 1, '11118', 35775, 35775, 5022.5, 5022.5, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17450),
(171, '32210503799534000118550010000174511203123675', 1, 1, '2021-05-04 14:46:46', 13, 1, '11119', 33899, 33899, 4646.5, 4646.5, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | ES NF 23580 BL 11119 2,9499999999999997 x 1,75 x 1,7999999999999998', 17451),
(172, '32210503799534000118550010000174521026797528', 1, 1, '2021-05-04 14:48:00', 13, 1, '11120', 32555, 32555, 4560, 4560, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17452),
(173, '32210503799534000118550010000174531495808074', 1, 1, '2021-05-04 14:49:15', 13, 1, '11121', 37484, 37484, 4889.5, 4889.5, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17453),
(174, '32210503799534000118550010000174541421896813', 1, 1, '2021-05-04 14:50:19', 13, 1, '11122', 33390, 33390, 4250, 4250, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | ES NF 23582 BL 11122 2,5 x 1,6999999999999999555910790149937383831 x 2', 17454),
(175, '32210503799534000118550010000174561094098752', 1, 1, '2021-05-04 14:53:19', 13, 1, '11124', 34185, 34185, 4360.5, 4360.5, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17456),
(176, '32210503799534000118550010000174571760237768', 1, 1, '2021-05-04 14:54:23', 13, 1, '11125', 21751, 21751, 2714, 2714, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17457),
(177, '32210503799534000118550010000174581623886478', 1, 1, '2021-05-04 14:55:31', 13, 1, '11126', 20034, 20034, 2323, 2323, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | ES NF 23593 BL 11126 2,9499999999999997 x 1,75 x ,9000000000000001', 17458),
(178, '32210503799534000118550010000174591653636779', 1, 1, '2021-05-04 14:56:53', 13, 1, '11127', 28408, 28408, 3614.5, 3614.5, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17459),
(179, '32210503799534000118550010000174601992887643', 1, 1, '2021-05-04 15:01:53', 13, 1, '11128', 34261, 34261, 4552, 4552, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17460),
(180, '32210503799534000118550010000174611154359085', 1, 1, '2021-05-04 15:03:08', 13, 1, '11129', 30422, 30422, 4095, 4095, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17461),
(181, '32210503799534000118550010000174621745951749', 1, 1, '2021-05-04 15:06:20', 13, 1, '11130', 34726, 34726, 4517, 4517, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | ES NF 23611 BL 11130 2,9499999999999997 x 1,75 x 1,75', 17462),
(182, '32210503799534000118550010000174631665439585', 1, 1, '2021-05-04 15:09:00', 13, 1, '11131', 35656, 35656, 4823.5, 4823.5, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | ES NF 23601 BL 11131 3,1499999999999999111821580299874767661 x 1,75 x 1,75', 17463),
(183, '32210503799534000118550010000174641110705664', 1, 1, '2021-05-04 15:10:00', 13, 1, '11132', 35656, 35656, 5002.8, 5002.8, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | ES NF 23612 BL 11132 3,1499999999999999111821580299874767661 x 1,75 x 1,6499999999999997', 17464),
(184, '32210503799534000118550010000174651813454131', 1, 1, '2021-05-04 15:11:06', 13, 1, '11133', 33382, 33382, 4488, 4488, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17465),
(185, '32210503799534000118550010000174661892281178', 1, 1, '2021-05-04 15:12:30', 13, 1, '11134', 36040, 36040, 4410, 4410, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17466),
(186, '32210503799534000118550010000174671756686185', 1, 1, '2021-05-04 15:14:05', 13, 1, '11135', 35139, 35139, 4479.5, 4479.5, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17467),
(187, '32210503799534000118550010000174681181922578', 1, 1, '2021-05-04 15:15:32', 13, 1, '11136', 34450, 34450, 4590, 4590, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17468),
(188, '32210503799534000118550010000174691371020726', 1, 1, '2021-05-04 15:16:47', 13, 1, '11137', 31670, 31670, 4158, 4158, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17469),
(189, '32210503799534000118550010000174701245358455', 1, 1, '2021-05-04 15:17:50', 13, 1, '11138', 29680, 29680, 3867.5, 3867.5, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17470),
(190, '32210503799534000118550010000174711163634618', 1, 1, '2021-05-04 16:01:42', 13, 1, '11139', 28847, 28847, 3960, 3960, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17471),
(191, '32210503799534000118550010000174721685282087', 1, 1, '2021-05-04 15:26:31', 13, 1, '11140', 21200, 21200, 2581.5, 2581.5, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | ES NF 23595 BL 11140 2,9499999999999997 x 1,75 x 1', 17472),
(192, '32210503799534000118550010000174731396800540', 1, 1, '2021-05-04 15:28:12', 13, 1, '11141', 35242, 35242, 4572, 4572, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | ES NF 23607 BL 11141 2,75 x 1,75 x 1,8999999999999999111821580299874767661', 17473),
(193, '32210503799534000118550010000174741375197930', 1, 1, '2021-05-04 15:29:21', 13, 1, '11142', 31270, 31270, 3662, 3662, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17474),
(194, '32210503799534000118550010000174751099218972', 1, 1, '2021-05-04 15:30:20', 13, 1, '11143', 33390, 33390, 4252.5, 4252.5, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17475),
(195, '32210503799534000118550010000174761797078502', 1, 1, '2021-05-04 15:31:27', 13, 1, '11144', 34755, 34755, 4049.5, 4049.5, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17476),
(196, '32210503799534000118550010000174551553909642', 1, 1, '2021-05-04 14:52:03', 13, 1, '11123', 29150, 29150, 4016.5, 4016.5, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | ES NF 23586 BL 11123 2,5499999999999994 x 1,75 x 1,7999999999999998', 17455),
(197, '32210503799534000118550010000174771391243838', 1, 1, '2021-05-04 15:32:34', 13, 1, '11145', 32039, 32039, 3927, 3927, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17477),
(198, '32210503799534000118550010000174781991064397', 1, 1, '2021-05-04 15:33:31', 13, 1, '11146', 31005, 31005, 3927, 3927, 14, 'NR. DO BOOKING 1COSVIX5076  COSCO - PORTO DE DESTINO: VITORIA DESTINADO A VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. RECINTO ALFANDEGADO NR. ENDERECO: RODVIA DARLY SANTOS, 1191, JARDIM ASTECA, VILA VELHA - ES, CEP.: 29.104-491 // CNPJ: 32.318.949/0001-20 - LATITUDE: -20.368027 /// LONGITUDE: -40.328825 | PDES( MG_GET_BLOCO(C.NUNOTA) , TGFCAB C , C.NUNOTA = +NUNOTA)', 17478),
(199, '32210620082261000105550000000094761100094765', 0, 1, '2021-06-02 16:28:18', 3, 1, '15924', 36000, 36000, 5060, 5060, 9, 'MOTORISTA: DEYVID ALISSON DOMINGOS CPF:05830063700;PLACA CAVALO: MTZ-1A78 PLACA REBOQUE :MPT0994;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15962 - Com. 2,750 - Lar. 2,000 - Alt. 1,600', 9476),
(200, '32210620082261000105550000000094771100094770', 0, 1, '2021-06-02 16:33:19', 3, 1, '15903', 35000, 35000, 4932.93, 4932.93, 8, 'Motorista: Pedro silva dos santos;Cpf:08768228716 Placa:OHP-9J37 /Placa:ODG:2J28;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15917 - Com. 2,700 - Lar. 2,050 - Alt. 1,550', 9477),
(201, '32210620082261000105550000000094781100094786', 0, 1, '2021-06-02 16:38:39', 3, 1, '15922', 35000, 35000, 5060, 5060, 3, 'MOTORISTA:ELIFAZ POSSEBON CAMPIN CPF:13631787766 -PLACA REBOQUE:OYH-4H89;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15958 - Com. 2,750 - Lar. 2,000 - Alt. 1,600', 9478),
(202, '32210620082261000105550000000094791100094791', 0, 1, '2021-06-02 16:41:59', 3, 1, '15920', 35000, 35000, 4902.45, 4902.45, 3, 'MOTORISTA:Felipe Silva Acerbi CPF:144.844.227-35. PLACA DO REBOQUE: MSD-1D71.;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15954 - Com. 2,650 - Lar. 1,950 - Alt. 1,650', 9479),
(203, '32210620082261000105550000000094801100094806', 0, 1, '2021-06-04 11:30:21', 3, 1, '15890', 35000, 35000, 5051.38, 5051.38, 3, 'MOTORISTA:RODRIGO MOYSES DE SOUZA - CPF: 041.905.116-33. PLACA DO CAVALO: QRI-3I31 PLACA DO REBOQUE: OVF-5403.;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15891 - Com. 2,650 - Lar. 1,950 - Alt. 1,700', 9480),
(204, '32210620082261000105550000000094811100094811', 0, 1, '2021-06-04 11:33:48', 3, 1, '15889', 35500, 35500, 4317.1, 4317.1, 3, 'MOTORISTA: RODRIGO OLIVEIRA CPF:09488209771;PLACA DO CAVALO:QRL-1D62 PLACA REBOQUE: OYD4J20;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16128 - Com. 2,750 - Lar. 1,950 - Alt. 1,400', 9481),
(205, '32210620082261000105550000000094821100094827', 0, 1, '2021-06-04 11:39:45', 3, 1, '15943', 35000, 35000, 4558.6, 4558.6, 3, 'MOTORISTA: JOAO PEDRO DA SILVA OLIOSI - CPF: 173.800.927-07. PLACA: OVK7A39 PLACA:OQW6E35;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15996 - Com. 3,300 - Lar. 1,550 - Alt. 1,550', 9482),
(206, '32210620082261000105550000000094831100094832', 0, 1, '2021-06-04 11:44:45', 3, 1, '15925', 35000, 35000, 5080.13, 5080.13, 3, 'MOTORISTA: GENESES ANDERSON DA SILVEIRA CPF:07247862793;PLACA DO CAVALO:OYJ-9A06 PLACA REBOQUE: MSP-1B25;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15964 - Com. 2,850 - Lar. 2,000 - Alt. 1,550', 9483),
(207, '32210620082261000105550000000094841100094848', 0, 1, '2021-06-04 11:49:17', 3, 1, '15896', 35000, 35000, 5087.6, 5087.6, 3, 'MOTORISTA:Felipe Silva Acerbi CPF:144.844.227-35. PLACA DO REBOQUE: MSD-1D71.;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15903 - Com. 3,250 - Lar. 1,650 - Alt. 1,650', 9484),
(208, '32210620082261000105550000000094851100094853', 0, 1, '2021-06-04 11:58:56', 3, 1, '15902', 36000, 36000, 4206.13, 4206.13, 3, 'MOTORISTA:ELIFAZ POSSEBON CAMPIN CPF:13631787766 -PLACA REBOQUE:OYH-4H89;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15915 - Com. 2,750 - Lar. 1,400 - Alt. 1,900', 9485),
(209, '32210620082261000105550000000094861100094869', 0, 1, '2021-06-04 12:07:03', 3, 1, '15930', 36000, 36000, 5028.38, 5028.38, 9, 'MOTORISTA: DEYVID ALISSON DOMINGOS CPF:05830063700;PLACA CAVALO: EZU-2H94 PLACA REBOQUE: MRY8993;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15974 - Com. 2,650 - Lar. 2,000 - Alt. 1,650', 9486),
(210, '32210620082261000105550000000094871100094874', 0, 1, '2021-06-04 13:09:11', 3, 1, '15653', 36000, 36000, 4985.25, 4985.25, 8, 'Motorista: Pedro silva dos santos;Cpf:08768228716 Placa:OHP-9J37 /Placa:ODG:2J28;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16130 - Com. 2,550 - Lar. 2,000 - Alt. 1,700', 9487),
(211, '32210620082261000105550000000094881100094880', 0, 1, '2021-06-04 13:12:58', 3, 1, '15899', 36000, 36000, 4347, 4347, 3, 'MOTORISTA:ELIFAZ POSSEBON CAMPIN CPF:13631787766 -PLACA REBOQUE:OYH-4H89;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15909 - Com. 2,800 - Lar. 1,500 - Alt. 1,800', 9488),
(212, '32210620082261000105550000000094891100094895', 0, 1, '2021-06-07 14:41:16', 3, 1, '15916', 36000, 36000, 5080.13, 5080.13, 9, 'MOTORISTA: DEYVID ALISSON DOMINGOS CPF:05830063700;PLACA CAVALO: EZU-2H94 PLACA REBOQUE: MRY8993;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15944 - Com. 2,850 - Lar. 2,000 - Alt. 1,550', 9489),
(213, '32210620082261000105550000000094901100094900', 0, 1, '2021-06-07 14:48:55', 3, 1, '15970', 35000, 35000, 5009.4, 5009.4, 3, 'MOTORISTA:Felipe Silva Acerbi CPF:144.844.227-35. PLACA DO REBOQUE: MSD-1D71.;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16052 - Com. 3,300 - Lar. 1,600 - Alt. 1,650', 9490),
(214, '32210620082261000105550000000094911100094915', 0, 1, '2021-06-07 14:55:47', 3, 1, '15954', 11000, 11000, 906.78, 906.78, 3, 'MOTORISTA: GENESES ANDERSON DA SILVEIRA CPF:07247862793;PLACA DO CAVALO:OYJ-9A06 PLACA REBOQUE: MSP-1B25;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16018 - Com. 2,650 - Lar. 0,350 - Alt. 1,700', 9491),
(215, '32210620082261000105550000000094921100094920', 0, 1, '2021-06-07 15:08:18', 3, 1, '15938', 29000, 29000, 4039.38, 4039.38, 3, 'MOTORISTA: GENESES ANDERSON DA SILVEIRA CPF:07247862793;PLACA DO CAVALO:OYJ-9A06 PLACA REBOQUE: MSP-1B25;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15986 - Com. 2,850 - Lar. 1,450 - Alt. 1,700', 9492),
(216, '32210620082261000105550000000094931100094936', 0, 1, '2021-06-07 15:13:46', 3, 1, '15958', 12000, 12000, 1397.83, 1397.83, 3, 'MOTORISTA: JOAO PEDRO DA SILVA OLIOSI - CPF: 173.800.927-07. PLACA: OVK7A39 PLACA:OQW6E35;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16026 - Com. 2,600 - Lar. 0,550 - Alt. 1,700', 9493),
(217, '32210620082261000105550000000094941100094941', 0, 1, '2021-06-07 15:20:52', 3, 1, '15936', 25000, 25000, 3387.33, 3387.33, 3, 'MOTORISTA: JOAO PEDRO DA SILVA OLIOSI - CPF: 173.800.927-07. PLACA: OVK7A39 PLACA:OQW6E35;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15982 - Com. 2,550 - Lar. 1,400 - Alt. 1,650', 9494),
(218, '32210620082261000105550000000094951100094957', 0, 1, '2021-06-07 15:25:40', 3, 1, '15907', 35000, 35000, 4364.25, 4364.25, 8, 'Motorista: Pedro silva dos santos;Cpf:08768228716 Placa:OHP-9J37 /Placa:ODG:2J28;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15926 - Com. 2,300 - Lar. 1,650 - Alt. 2,000', 9495),
(219, '32210620082261000105550000000094961100094962', 0, 1, '2021-06-08 14:20:14', 3, 1, '15927', 36000, 36000, 5180.18, 5180.18, 9, 'MOTORISTA: DEYVID ALISSON DOMINGOS CPF:05830063700;PLACA CAVALO: EZU-2H94 PLACA REBOQUE: MRY8993;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15968 - Com. 2,800 - Lar. 1,950 - Alt. 1,650', 9496),
(220, '32210620082261000105550000000094971100094978', 0, 1, '2021-06-11 13:30:31', 3, 1, '15917', 36000, 36000, 5137.63, 5137.63, 9, 'MOTORISTA: DEYVID ALISSON DOMINGOS CPF:05830063700;PLACA CAVALO: EZU-2H94 PLACA REBOQUE: MRY8993;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15946 - Com. 2,850 - Lar. 1,900 - Alt. 1,650', 9497),
(221, '32210620082261000105550000000094981100094983', 0, 1, '2021-06-11 15:02:04', 3, 1, '15909', 29000, 29000, 4098.6, 4098.6, 3, 'MOTORISTA: TIAGO GONCALVES DE MATOS CPF: 09138545730;PLACA DO CAVALO: RBA-8I59 PLACA DO REBOQUE: AKF-4483-ES PLACA DO REBOQUE: AKF-4482-ES;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138 ;UF: ES NF:15930 - Com. 2,700 - Lar. 1,650 - Alt. 1,600', 9498),
(222, '32210620082261000105550000000094991100094999', 0, 1, '2021-06-11 15:06:07', 3, 1, '15962', 20000, 20000, 2438, 2438, 3, 'MOTORISTA: TIAGO GONCALVES DE MATOS CPF: 09138545730;PLACA DO CAVALO: RBA-8I59 PLACA DO REBOQUE: AKF-4483-ES PLACA DO REBOQUE: AKF-4482-ES;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138 ;UF: ES NF:16036 - Com. 2,650 - Lar. 1,000 - Alt. 1,600', 9499),
(223, '32210620082261000105550000000095001100095009', 0, 1, '2021-06-11 15:10:58', 3, 1, '15960', 29000, 29000, 3453.45, 3453.45, 3, 'MOTORISTA: JOCEMAR DA SILVA CPF: 077.647.817-62 ;PLACA CAVALO: QRI-4B03 REBOQUE: MRX-8H74 REBOQUE: MRX-8H75;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138 ;UF: ES NF:16030 - Com. 2,600 - Lar. 1,400 - Alt. 1,650', 9500),
(224, '32210620082261000105550000000095011100095014', 0, 1, '2021-06-11 15:14:22', 3, 1, '15911', 20000, 20000, 2774.95, 2774.95, 3, 'MOTORISTA: JOCEMAR DA SILVA CPF: 077.647.817-62 ;PLACA CAVALO: QRI-4B03 REBOQUE: MRX-8H74 REBOQUE: MRX-8H75;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138 ;UF: ES NF:15934 - Com. 3,250 - Lar. 0,900 - Alt. 1,650', 9501),
(225, '32210620082261000105550000000095021100095020', 0, 1, '2021-06-11 15:17:11', 3, 1, '15964', 36000, 36000, 5165.8, 5165.8, 3, 'MOTORISTA: JOAO PEDRO DA SILVA OLIOSI - CPF: 173.800.927-07. PLACA: OVK7A39 PLACA:OQW6E35;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16040 - Com. 3,300 - Lar. 1,650 - Alt. 1,650', 9502),
(226, '32210620082261000105550000000095031100095035', 0, 1, '2021-06-14 15:04:12', 3, 1, '15955', 29000, 29000, 4098.6, 4098.6, 3, 'MOTORISTA: JOCEMAR DA SILVA CPF: 077.647.817-62 ;PLACA CAVALO: QRI-4B03 REBOQUE: MRX-8H74 REBOQUE: MRX-8H75;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138 ;UF: ES NF:16020 - Com. 2,700 - Lar. 1,600 - Alt. 1,650', 9503),
(227, '32210620082261000105550000000095051100095056', 0, 1, '2021-06-15 16:41:53', 3, 1, '15952', 24000, 24000, 2887.65, 2887.65, 9, 'MOTORISTA: DEYVID ALISSON DOMINGOS CPF:05830063700;PLACA CAVALO: EZU-2H94 PLACA REBOQUE: MRY8993;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16014 - Com. 2,700 - Lar. 1,200 - Alt. 1,550', 9505),
(228, '32210620082261000105550000000095061100095061', 0, 1, '2021-06-15 17:03:29', 3, 1, '15969', 24000, 24000, 3105, 3105, 3, 'MOTORISTA: GENESES ANDERSON DA SILVEIRA CPF:07247862793;PLACA DO CAVALO:OYJ-9A06 PLACA REBOQUE: MSP-1B25;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16050 - Com. 2,500 - Lar. 1,350 - Alt. 1,600', 9506),
(229, '32210620082261000105550000000095071100095077', 0, 1, '2021-06-15 17:09:28', 3, 1, '15939', 30000, 30000, 3645.5, 3645.5, 3, 'MOTORISTA: JOCEMAR DA SILVA CPF: 077.647.817-62 ;PLACA CAVALO: QRI-4B03 REBOQUE: MRX-8H74 REBOQUE: MRX-8H75;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138 ;UF: ES NF:15988 - Com. 2,650 - Lar. 1,450 - Alt. 1,650', 9507),
(230, '32210620082261000105550000000095251100095253', 0, 1, '2021-06-16 14:27:08', 3, 1, '15904', 29000, 29000, 3425.28, 3425.28, 3, 'MOTORISTA: TIAGO GONCALVES DE MATOS CPF: 09138545730;PLACA DO CAVALO: RBA-8I59 PLACA DO REBOQUE: AKF-4483-ES PLACA DO REBOQUE: AKF-4482-ES;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138 ;UF: ES NF:15919 - Com. 1,900 - Lar. 1,650 - Alt. 1,900', 9525),
(231, '32210620082261000105550000000095261100095269', 0, 1, '2021-06-16 14:30:43', 3, 1, '15898', 23000, 23000, 2884.2, 2884.2, 3, 'MOTORISTA: TIAGO GONCALVES DE MATOS CPF: 09138545730;PLACA DO CAVALO: RBA-8I59 PLACA DO REBOQUE: AKF-4483-ES PLACA DO REBOQUE: AKF-4482-ES;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138 ;UF: ES NF:15907 - Com. 3,300 - Lar. 0,950 - Alt. 1,600', 9526),
(232, '32210620082261000105550000000095271100095274', 0, 1, '2021-06-16 14:33:57', 3, 1, '15910', 12000, 12000, 1113.2, 1113.2, 3, 'MOTORISTA:RODRIGO MOYSES DE SOUZA - CPF: 041.905.116-33. PLACA DO CAVALO: QRI-3I31 PLACA DO REBOQUE: OVF-5403.;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15932 - Com. 2,200 - Lar. 0,550 - Alt. 1,600', 9527),
(233, '32210620082261000105550000000095281100095280', 0, 1, '2021-06-16 14:37:27', 3, 1, '15892', 16000, 16000, 1876.8, 1876.8, 9, 'MOTORISTA: DEYVID ALISSON DOMINGOS CPF:05830063700;PLACA CAVALO: EZU-2H94 PLACA REBOQUE: MRY8993;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15985 - Com. 2,550 - Lar. 0,800 - Alt. 1,600', 9528),
(234, '32210620082261000105550000000095291100095295', 0, 1, '2021-06-16 14:40:09', 3, 1, '15931', 20000, 20000, 2277, 2277, 9, 'MOTORISTA: DEYVID ALISSON DOMINGOS CPF:05830063700;PLACA CAVALO: EZU-2H94 PLACA REBOQUE: MRY8993;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15976 - Com. 2,750 - Lar. 0,900 - Alt. 1,600', 9529);
INSERT INTO `nf_ident` (`id`, `chave`, `serie`, `tpNF`, `dhEmi`, `emissor`, `qtdvol`, `Numeracao_item`, `Pbruto`, `Pliquido`, `vProd`, `vNF`, `transport`, `info_comp_nota`, `nNF`) VALUES
(235, '32210620082261000105550000000095301100095300', 0, 1, '2021-06-16 14:43:57', 3, 1, '15929', 36000, 36000, 5152, 5152, 3, 'MOTORISTA:Felipe Silva Acerbi CPF:144.844.227-35. PLACA DO REBOQUE: MSD-1D71.;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15972 - Com. 2,800 - Lar. 2,000 - Alt. 1,600', 9530),
(236, '32210620082261000105550000000095701100095704', 0, 1, '2021-06-17 13:13:56', 3, 1, '15928', 36000, 36000, 4779.4, 4779.4, 3, 'MOTORISTA:Felipe Silva Acerbi CPF:144.844.227-35. PLACA DO REBOQUE: MSD-1D71.;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15970 - Com. 2,750 - Lar. 1,950 - Alt. 1,550', 9570),
(237, '32210620082261000105550000000095711100095710', 0, 1, '2021-06-17 13:19:03', 3, 1, '15957', 14000, 14000, 1196, 1196, 3, 'MOTORISTA: JOAO PEDRO DA SILVA OLIOSI - CPF: 173.800.927-07. PLACA: OVK7A39 PLACA:OQW6E35;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16024 - Com. 2,600 - Lar. 0,500 - Alt. 1,600', 9571),
(238, '32210620082261000105550000000095721100095725', 0, 1, '2021-06-17 13:54:17', 3, 1, '15897', 26000, 26000, 2794.5, 2794.5, 3, 'MOTORISTA: JOAO PEDRO DA SILVA OLIOSI - CPF: 173.800.927-07. PLACA: OVK7A39 PLACA:OQW6E35;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15905 - Com. 2,400 - Lar. 1,350 - Alt. 1,500', 9572),
(239, '32210620082261000105550000000095731100095730', 0, 1, '2021-06-17 13:58:29', 3, 1, '15900', 16000, 16000, 1657.15, 1657.15, 3, 'MOTORISTA:ELIFAZ POSSEBON CAMPIN CPF:13631787766 -PLACA REBOQUE:OYH-4H89;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15911 - Com. 2,650 - Lar. 0,750 - Alt. 1,450', 9573),
(240, '32210620082261000105550000000095741100095746', 0, 1, '2021-06-17 14:01:25', 3, 1, '15894', 22000, 22000, 2665.13, 2665.13, 3, 'MOTORISTA:ELIFAZ POSSEBON CAMPIN CPF:13631787766 -PLACA REBOQUE:OYH-4H89;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15899 - Com. 2,600 - Lar. 1,150 - Alt. 1,550', 9574),
(241, '32210620082261000105550000000095751100095751', 0, 1, '2021-06-17 14:05:38', 3, 1, '15893', 17000, 17000, 1818.15, 1818.15, 9, 'MOTORISTA: DEYVID ALISSON DOMINGOS CPF:05830063700;PLACA CAVALO: EZU-2H94 PLACA REBOQUE: MRY8993;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15897 - Com. 2,550 - Lar. 0,800 - Alt. 1,550', 9575),
(242, '32210620082261000105550000000095761100095767', 0, 1, '2021-06-17 14:09:19', 3, 1, '15937', 21000, 21000, 2433.4, 2433.4, 9, 'MOTORISTA: DEYVID ALISSON DOMINGOS CPF:05830063700;PLACA CAVALO: EZU-2H94 PLACA REBOQUE: MRY8993;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15984 - Com. 2,850 - Lar. 0,900 - Alt. 1,650', 9576),
(243, '32210620082261000105550000000095771100095772', 0, 1, '2021-06-17 14:13:58', 3, 1, '15947', 19000, 19000, 2388.55, 2388.55, 3, 'MOTORISTA: RODRIGO OLIVEIRA CPF:09488209771;PLACA DO CAVALO:QRL-1D62 PLACA REBOQUE: OYD4J20;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:16004 - Com. 2,650 - Lar. 0,950 - Alt. 1,650', 9577),
(244, '32210620082261000105550000000095781100095788', 0, 1, '2021-06-17 14:16:40', 3, 1, '15941', 18000, 18000, 2199.38, 2199.38, 3, 'MOTORISTA: RODRIGO OLIVEIRA CPF:09488209771;PLACA DO CAVALO:QRL-1D62 PLACA REBOQUE: OYD4J20;Transporte rodoviario - transporte efetuado de Barra de Sao Francisco - ES, ate Vitoria - ES, onde os blocos serao destinados a formacao de lote para exportacao. O material sera enviado para VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA CNPJ. 32.318.949/ 0001-20 . DETALHE DO REDEX:LATITUDE: -20.368027 /// LONGITUDE: -40.328825 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES CEP: 29.104-491 Transporte de mercadoria destinada ao exterior. (ARMADOR COSCO-BOOKING 1COSVIX5138) ;UF: ES NF:15992 - Com. 2,500 - Lar. 0,900 - Alt. 1,700', 9578),
(245, '32210607479402000160550020000054021000221346', 2, 1, '2021-06-08 12:57:41', 15, 1, '3420-F4', 18648, 18648, 33207.84, 33207.84, 16, 'REMESSA PARA FORMACAO DE LOTE DE EXPORTACAO, ENVIADO PARA VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. DETALHES DO REDEX: LATITUDE: -20.368027 /// LONGITUDE: -40.328825, CNPJ. 32.318.949/ 0001-20, 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES, NR. 1COSVIX5176 DO BOOKING DA COSCO. PORT DE DESTINO: XIAMEN. CEP: 29.104-491, CONF. ART 534-X, DECRETO 1090 RICMS/ES.;BLOCO: NF - COMP.: 2,900 X ALT.: 1,750 X LARG.: 1,100 = 5,583 M3 - N: 3420;VALOR APROXIMADOS TRIBUTOS R$ 10.443,87(ALIQ. 31,4500130089762% - FONTE:IBTP)', 5402),
(246, '32210607479402000160550020000054031000221343', 2, 1, '2021-06-08 12:58:21', 15, 1, '3422-F4', 22477, 22477, 32779.3, 32779.3, 16, 'REMESSA PARA FORMACAO DE LOTE DE EXPORTACAO, ENVIADO PARA VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. DETALHES DO REDEX: LATITUDE: -20.368027 /// LONGITUDE: -40.328825, CNPJ. 32.318.949/ 0001-20, 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES, NR. 1COSVIX5176 DO BOOKING DA COSCO. PORT DE DESTINO: XIAMEN., CONF. ART 534-X, DECRETO 1090 RICMS/ES.;BLOCO: NF - COMP.: 3,100 X ALT.: 1,800 X LARG.: 1,200 = 6,696 M3 - N: 3422;VALOR APROXIMADOS TRIBUTOS R$ 10.309,09(ALIQ. 31,4500004576059% - FONTE:IBTP)', 5403),
(247, '32210607479402000160550020000054041000221340', 2, 1, '2021-06-08 12:59:08', 15, 1, '22', 16970.8, 16970.8, 35135.62, 35135.62, 16, 'REMESSA PARA FORMACAO DE LOTE DE EXPORTACAO, ENVIADO PARA VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. DETALHES DO REDEX: LATITUDE: -20.368027 /// LONGITUDE: -40.328825, CNPJ. 32.318.949/ 0001-20, 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES, NR. 1COSVIX5176 DO BOOKING DA COSCO. PORT DE DESTINO: XIAMEN., CONF. ART 534-X, DECRETO 1090 RICMS/ES.;BLOCO: NF - COMP.: 3,100 X ALT.: 1,150 X LARG.: 1,700 = 6,061 M3 - N: 22', 5404),
(248, '32210607479402000160550020000054051000221348', 2, 1, '2021-06-08 14:58:28', 15, 1, '26', 16405.2, 16405.2, 33964.62, 33964.62, 16, 'REMESSA PARA FORMACAO DE LOTE DE EXPORTACAO, ENVIADO PARA VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. DETALHES DO REDEX: LATITUDE: -20.368027 /// LONGITUDE: -40.328825, CNPJ. 32.318.949/ 0001-20, 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES, NR. 1COSVIX5176 DO BOOKING DA COSCO. PORT DE DESTINO: XIAMEN, CONF. ART 534-X, DECRETO 1090 RICMS/ES.;BLOCO: NF - COMP.: 3,100 X ALT.: 1,050 X LARG.: 1,800 = 5,859 M3 - N: 26', 5405),
(249, '32210607479402000160550020000054061000221345', 2, 1, '2021-06-08 17:17:23', 15, 1, '3428-F4', 34048, 34048, 118766.68, 118766.68, 16, 'REMESSA PARA FORMACAO DE LOTE DE EXPORTACAO, ENVIADO PARA VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. DETALHES DO REDEX: LATITUDE: -20.368027 /// LONGITUDE: -40.328825, CNPJ. 32.318.949/ 0001-20, 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES, NR. 1COSVIX5176 DO BOOKING DA COSCO. PORT DE DESTINO: XIAMEN, CONF. ART 534-X, DECRETO 1090 RICMS/ES.;BLOCO: NF - COMP.: 3,100 X ALT.: 1,800 X LARG.: 1,900 = 10,602 M3 - N: 3428;VALOR APROXIMADOS TRIBUTOS R$ 37.352,12(ALIQ. 31,4499992758912% - FONTE:IBTP)', 5406),
(250, '32210607479402000160550020000054071000221342', 2, 1, '2021-06-10 13:03:52', 15, 1, '3427-F4', 18018, 18018, 46754.34, 46754.34, 16, 'REMESSA PARA FORMACAO DE LOTE DE EXPORTACAO, ENVIADO PARA VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. DETALHES DO REDEX: LATITUDE: -20.368027 /// LONGITUDE: -40.328825, CNPJ. 32.318.949/ 0001-20, 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES, NR. 1COSVIX5176 DO BOOKING DA COSCO. PORT DE DESTINO: XIAMEN - CNPJ: 17.469.701/0169-28, CONF. ART 534-X, DECRETO 1090 RICMS/ES.;BLOCO: NF - COMP.: 1,900 X ALT.: 1,850 X LARG.: 1,550 = 5,448 M3 - N: 3427;VALOR APROXIMADOS TRIBUTOS R$ 14.704,24(ALIQ. 31,4500001497187% - FONTE:IBTP)', 5407),
(251, '32210607479402000160550020000054441000221346', 2, 1, '2021-06-16 16:10:59', 15, 1, '25', 27902.4, 27902.4, 55697.58, 55697.58, 16, 'REMESSA PARA FORMACAO DE LOTE DE EXPORTACAO, ENVIADO PARA VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. DETALHES DO REDEX: LATITUDE: -20.368027 /// LONGITUDE: -40.328825, CNPJ. 32.318.949/ 0001-20, 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES, NR. 1COSVIX5176 DO BOOKING DA COSCO. PORT DE DESTINO: XIAMEN, CONF. ART 534-X, DECRETO 1090 RICMS/ES.;BLOCO: NF - COMP.: 3,050 X ALT.: 1,800 X LARG.: 1,750 = 9,608 M3 - N: 25', 5444),
(252, '32210607479402000160550020000054481000221345', 2, 1, '2021-06-17 09:24:37', 15, 1, '3425-F4', 13514, 13514, 43351.09, 43351.09, 17, 'REMESSA PARA FORMACAO DE LOTE DE EXPORTACAO, ENVIADO PARA VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. DETALHES DO REDEX: LATITUDE: -20.368027 /// LONGITUDE: -40.328825, CNPJ. 32.318.949/ 0001-20, 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES, NR. 1COSVIX5176 DO BOOKING DA COSCO. PORT DE DESTINO: XIAMEN, CONF. ART 534-X, DECRETO 1090 RICMS/ES.;BLOCO: NF - COMP.: 3,200 X ALT.: 1,850 X LARG.: 0,650 = 3,848 M3 - N: 3425;VALOR APROXIMADOS TRIBUTOS R$ 13.633,92(ALIQ. 31,4500050633098% - FONTE:IBTP)', 5448),
(253, '32210607479402000160550020000054511000221340', 2, 1, '2021-06-18 19:30:20', 15, 1, '459', 15746, 15746, 5832, 5832, 18, 'REMESSA PARA FORMACAO DE LOTE DE EXPORTACAO, ENVIADO PARA VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. DETALHES DO REDEX: LATITUDE: -20.368027 /// LONGITUDE: -40.328825, CNPJ. 32.318.949/ 0001-20, 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES, NR. 1COSVIX5176 DO BOOKING DA COSCO. PORT DE DESTINO: XIAMEN, CONF. ART 534-X, DECRETO 1090 RICMS/ES.;BLOCO: NF - COMP.: 2,000 X ALT.: 1,800 X LARG.: 1,200 = 5,832 M3 - N: 459;VALOR APROXIMADOS TRIBUTOS R$ 1.834,16(ALIQ. 31,4499314128944% - FONTE:IBTP)', 5451),
(254, '32210607479402000160550020000054521000221348', 2, 1, '2021-06-18 19:31:30', 15, 1, '460', 9593, 9593, 3553, 3553, 18, 'REMESSA PARA FORMACAO DE LOTE DE EXPORTACAO, ENVIADO PARA VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. DETALHES DO REDEX: LATITUDE: -20.368027 /// LONGITUDE: -40.328825, CNPJ. 32.318.949/ 0001-20, 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES, NR. 1COSVIX5176 DO BOOKING DA COSCO. PORT DE DESTINO: XIAMEN, CONF. ART 534-X, DECRETO 1090 RICMS/ES.;BLOCO: NF - COMP.: 2,900 X ALT.: 1,750 X LARG.: 0,700 = 3,553 M3 - N: 460;VALOR APROXIMADOS TRIBUTOS R$ 1.117,42(ALIQ. 31,4500422178441% - FONTE:IBTP)', 5452),
(255, '32210607479402000160550020000054531000221345', 2, 1, '2021-06-18 19:32:40', 15, 1, '461', 12970, 12970, 4804, 4804, 18, 'REMESSA PARA FORMACAO DE LOTE DE EXPORTACAO, ENVIADO PARA VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. DETALHES DO REDEX: LATITUDE: -20.368027 /// LONGITUDE: -40.328825, CNPJ. 32.318.949/ 0001-20, 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES, NR. 1COSVIX5176 DO BOOKING DA COSCO. PORT DE DESTINO: XIAMEN, CONF. ART 534-X, DECRETO 1090 RICMS/ES.;BLOCO: NF - COMP.: 3,500 X ALT.: 1,750 X LARG.: 0,900 = 4,804 M3 - N: 461;VALOR APROXIMADOS TRIBUTOS R$ 1.510,86(ALIQ. 31,4500416319734% - FONTE:IBTP)', 5453),
(256, '32210607479402000160550020000054541000221342', 2, 1, '2021-06-18 19:33:54', 15, 1, '470', 27240, 27240, 10089, 10089, 18, 'REMESSA PARA FORMACAO DE LOTE DE EXPORTACAO, ENVIADO PARA VILA VELHA TERMINAIS DE CARGA E LOGISTICA LTDA. DETALHES DO REDEX: LATITUDE: -20.368027 /// LONGITUDE: -40.328825, CNPJ. 32.318.949/ 0001-20, 1467, RODOVIA DARLY SANTOS, 1191, VILA VELHA - ES, NR. 1COSVIX5176 DO BOOKING DA COSCO. PORT DE DESTINO: XIAMEN, CONF. ART 534-X, DECRETO 1090 RICMS/ES.;BLOCO: NF - COMP.: 2,950 X ALT.: 1,900 X LARG.: 1,800 = 10,089 M3 - N: 470;VALOR APROXIMADOS TRIBUTOS R$ 3.172,99(ALIQ. 31,4499950441074% - FONTE:IBTP)', 5454);

-- --------------------------------------------------------

--
-- Estrutura da tabela `nf_itens`
--

CREATE TABLE `nf_itens` (
  `id` int(11) NOT NULL,
  `cProd` varchar(20) NOT NULL,
  `nf_id` int(11) NOT NULL,
  `xProd` text NOT NULL,
  `infAdProd` text DEFAULT NULL,
  `NCM` int(11) NOT NULL,
  `CFOP` int(11) NOT NULL,
  `uCom` varchar(5) NOT NULL,
  `qCom` double NOT NULL,
  `vUnCom` double NOT NULL,
  `vProd` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `nf_itens`
--

INSERT INTO `nf_itens` (`id`, `cProd`, `nf_id`, `xProd`, `infAdProd`, `NCM`, `CFOP`, `uCom`, `qCom`, `vUnCom`, `vProd`) VALUES
(1, '25409', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25409 - COMP 2.300 - ALT 1.800 - LARG 2.000 - TOTAL 8.280', '', 25161200, 7127, 'M3', 8.28, 2416.94, 20012.26),
(2, '25410', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25410 - COMP 2.350 - ALT 1.750 - LARG 2.050 - TOTAL 8.431', '', 25161200, 7127, 'M3', 8.431, 2416.94, 20377.22),
(3, '25411', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25411 - COMP 2.350 - ALT 1.800 - LARG 2.000 - TOTAL 8.460', '', 25161200, 7127, 'M3', 8.46, 2416.94, 20447.31),
(4, '25412', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25412 - COMP 2.400 - ALT 1.800 - LARG 2.050 - TOTAL 8.856', '', 25161200, 7127, 'M3', 8.856, 2416.94, 21404.42),
(5, '25413', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25413 - COMP 2.450 - ALT 1.750 - LARG 1.750 - TOTAL 7.503', '', 25161200, 7127, 'M3', 7.503, 2416.94, 18134.3),
(6, '25414', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25414 - COMP 2.450 - ALT 1.800 - LARG 1.900 - TOTAL 8.379', '', 25161200, 7127, 'M3', 8.379, 2416.94, 20251.54),
(7, '25415', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25415 - COMP 2.400 - ALT 1.750 - LARG 2.100 - TOTAL 8.820', '', 25161200, 7127, 'M3', 8.82, 2416.94, 21317.42),
(8, '25416', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25416 - COMP 2.450 - ALT 1.800 - LARG 1.600 - TOTAL 7.056', '', 25161200, 7127, 'M3', 7.056, 2416.94, 17053.93),
(9, '25417', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25417 - COMP 2.300 - ALT 1.750 - LARG 2.100 - TOTAL 8.453', '', 25161200, 7127, 'M3', 8.453, 2416.94, 20430.39),
(10, '25418', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25418 - COMP 2.250 - ALT 1.800 - LARG 2.000 - TOTAL 8.100', '', 25161200, 7127, 'M3', 8.1, 2416.94, 19577.21),
(11, '25419', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25419 - COMP 2.300 - ALT 1.800 - LARG 1.750 - TOTAL 7.245', '', 25161200, 7127, 'M3', 7.245, 2416.94, 17510.73),
(12, '25420', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25420 - COMP 2.250 - ALT 1.850 - LARG 1.650 - TOTAL 6.868', '', 25161200, 7127, 'M3', 6.868, 2416.94, 16599.54),
(13, '25421', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25421 - COMP 2.300 - ALT 1.800 - LARG 2.050 - TOTAL 8.487', '', 25161200, 7127, 'M3', 8.487, 2416.94, 20512.57),
(14, '25422', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25422 - COMP 2.300 - ALT 1.750 - LARG 2.000 - TOTAL 8.050', '', 25161200, 7127, 'M3', 8.05, 2416.94, 19456.37),
(15, '25423', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25423 - COMP 2.300 - ALT 1.750 - LARG 2.050 - TOTAL 8.251', '', 25161200, 7127, 'M3', 8.251, 2416.94, 19942.17),
(16, '25424', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25424 - COMP 2.250 - ALT 1.800 - LARG 2.050 - TOTAL 8.303', '', 25161200, 7127, 'M3', 8.303, 2416.94, 20067.86),
(17, '25425', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25425 - COMP 2.300 - ALT 1.700 - LARG 2.100 - TOTAL 8.211', '', 25161200, 7127, 'M3', 8.211, 2416.94, 19845.5),
(18, '25426', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25426 - COMP 2.250 - ALT 1.800 - LARG 1.500 - TOTAL 6.075', '', 25161200, 7127, 'M3', 6.075, 2416.94, 14682.91),
(19, '25427', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25427 - COMP 2.300 - ALT 1.750 - LARG 1.650 - TOTAL 6.641', '', 25161200, 7127, 'M3', 6.641, 2416.94, 16050.9),
(20, '25428', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25428 - COMP 2.300 - ALT 1.800 - LARG 1.750 - TOTAL 7.245', '', 25161200, 7127, 'M3', 7.245, 2416.94, 17510.73),
(21, '25429', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25429 - COMP 2.250 - ALT 1.700 - LARG 2.000 - TOTAL 7.650', '', 25161200, 7127, 'M3', 7.65, 2416.94, 18489.59),
(22, '25430', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25430 - COMP 2.250 - ALT 1.800 - LARG 2.000 - TOTAL 8.100', '', 25161200, 7127, 'M3', 8.1, 2416.94, 19577.21),
(23, '25431', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25431 - COMP 2.250 - ALT 1.800 - LARG 1.900 - TOTAL 7.695', '', 25161200, 7127, 'M3', 7.695, 2416.94, 18598.35),
(24, '25432', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25432 - COMP 2.350 - ALT 1.800 - LARG 2.100 - TOTAL 8.883', '', 25161200, 7127, 'M3', 8.883, 2416.94, 21469.68),
(25, '25433', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25433 - COMP 2.250 - ALT 1.800 - LARG 1.900 - TOTAL 7.695', '', 25161200, 7127, 'M3', 7.695, 2416.94, 18598.36),
(26, '25434', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25434 - COMP 3.100 - ALT 1.700 - LARG 1.250 - TOTAL 6.588', '', 25161200, 7127, 'M3', 6.588, 2416.94, 15922.8),
(27, '25435', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25435 - COMP 3.100 - ALT 1.800 - LARG 1.750 - TOTAL 9.765', '', 25161200, 7127, 'M3', 9.765, 2416.94, 23601.42),
(28, '25436', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25436 - COMP 3.100 - ALT 1.750 - LARG 1.700 - TOTAL 9.223', '', 25161200, 7127, 'M3', 9.223, 2416.94, 22291.44),
(29, '25437', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25437 - COMP 3.050 - ALT 1.800 - LARG 1.500 - TOTAL 8.235', '', 25161200, 7127, 'M3', 8.235, 2416.94, 19903.5),
(30, '25438', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25438 - COMP 3.000 - ALT 1.800 - LARG 1.650 - TOTAL 8.910', '', 25161200, 7127, 'M3', 8.91, 2416.94, 21534.94),
(31, '25439', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25439 - COMP 3.150 - ALT 1.750 - LARG 1.700 - TOTAL 9.371', '', 25161200, 7127, 'M3', 9.371, 2416.94, 22649.14),
(32, '25440', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25440 - COMP 2.950 - ALT 1.700 - LARG 1.800 - TOTAL 9.027', '', 25161200, 7127, 'M3', 9.027, 2416.94, 21817.71),
(33, '25441', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25441 - COMP 2.850 - ALT 1.750 - LARG 1.800 - TOTAL 8.978', '', 25161200, 7127, 'M3', 8.978, 2416.94, 21699.29),
(34, '25442', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25442 - COMP 3.000 - ALT 1.750 - LARG 1.700 - TOTAL 8.925', '', 25161200, 7127, 'M3', 8.925, 2416.94, 21571.19),
(35, '25443', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25443 - COMP 3.050 - ALT 1.700 - LARG 1.650 - TOTAL 8.555', '', 25161200, 7127, 'M3', 8.555, 2416.94, 20676.92),
(36, '25444', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25444 - COMP 3.100 - ALT 1.700 - LARG 1.650 - TOTAL 8.696', '', 25161200, 7127, 'M3', 8.696, 2416.94, 21017.71),
(37, '25445', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25445 - COMP 3.100 - ALT 1.750 - LARG 1.300 - TOTAL 7.053', '', 25161200, 7127, 'M3', 7.053, 2416.94, 17046.68),
(38, '25446', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25446 - COMP 3.000 - ALT 1.800 - LARG 1.850 - TOTAL 9.990', '', 25161200, 7127, 'M3', 9.99, 2416.94, 24145.23),
(39, '25447', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25447 - COMP 3.050 - ALT 1.750 - LARG 1.800 - TOTAL 9.608', '', 25161200, 7127, 'M3', 9.608, 2416.94, 23221.96),
(40, '25448', 1, 'BL GR GIALLO FIORITO - - NUM. BLOCO 25448 - COMP 2.850 - ALT 1.800 - LARG 1.400 - TOTAL 7.182', '', 25161200, 7127, 'M3', 7.182, 2416.94, 17358.46),
(41, '1000005877', 2, 'YARAMILA 19 04 19 1MG', 'YARAMILA', 31052000, 5901, 'TO', 30.42, 1937.14, 58927.8),
(42, '25444', 3, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25444', '', 25161200, 6504, 'M3', 8.696, 2506.61, 21797.48),
(43, '25415', 4, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25415', '', 25161200, 6504, 'M3', 8.82, 2506.61, 22108.3),
(44, '000002', 5, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBEH 2454) ** UF:ES - NF Origem:057262 - Comp:2,700 - Alt:1,600 - Larg:2,000;* uTrib: M3, qTri: 8,640, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572621100572621', 25161200, 5505, 'M3', 8.64, 1316.46, 11374.21),
(45, '16019', 6, 'Bloco GRANITO - AMARELO - ICARAI. ID: 16019', '', 25161200, 5505, 'M3', 8.394, 575, 4826.55),
(46, '15906', 7, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15906', '', 25161200, 5505, 'M3', 5.569, 575, 3202.18),
(47, '15888', 8, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15888', '', 25161200, 5505, 'M3', 8.687, 575, 4995.03),
(48, '15921', 9, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15921', '', 25161200, 5505, 'M3', 7.182, 575, 4129.65),
(49, '15915', 10, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15915', '', 25161200, 5505, 'M3', 6.656, 575, 3827.2),
(50, '15908', 11, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15908', '', 25161200, 5505, 'M3', 7.226, 575, 4154.95),
(51, '15940', 12, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15940', '', 25161200, 5505, 'M3', 8.151, 575, 4686.83),
(52, '16017', 13, 'Bloco GRANITO - AMARELO - ICARAI. ID: 16017', '', 25161200, 5505, 'M3', 3.061, 575, 1760.08),
(53, '15951', 14, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15951', '', 25161200, 5505, 'M3', 5.363, 575, 3083.73),
(54, '15918', 15, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15918', '', 25161200, 5505, 'M3', 1.577, 575, 906.78),
(55, '15895', 16, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15895', '', 25161200, 5505, 'M3', 5.156, 575, 2964.7),
(56, '15953', 17, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15953', '', 25161200, 5505, 'M3', 2.586, 575, 1486.95),
(57, '15932', 18, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15932', '', 25161200, 5505, 'M3', 5.181, 575, 2979.08),
(58, '15956', 19, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15956', '', 25161200, 5505, 'M3', 5.517, 575, 3172.28),
(59, '15950', 20, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15950', '', 25161200, 5505, 'M3', 4.678, 575, 2689.85),
(60, '15914', 21, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15914', '', 25161200, 5505, 'M3', 7.659, 575, 4403.93),
(61, '16016', 22, 'Bloco GRANITO - AMARELO - ICARAI. ID: 16016', '', 25161200, 5505, 'M3', 3.276, 575, 1883.7),
(62, '15905', 23, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15905', '', 25161200, 5505, 'M3', 6.4, 575, 3680),
(63, '15942', 24, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15942', '', 25161200, 5505, 'M3', 4.505, 575, 2590.38),
(64, '15934', 25, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15934', '', 25161200, 5505, 'M3', 8.25, 575, 4743.75),
(65, '16015', 26, 'Bloco GRANITO - AMARELO - ICARAI. ID: 16015', '', 25161200, 5505, 'M3', 8.745, 575, 5028.38),
(66, '15944', 27, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15944', '', 25161200, 5505, 'M3', 2.36, 575, 1357),
(67, '15926', 28, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15926', '', 25161200, 5505, 'M3', 5.7, 575, 3277.5),
(68, '15965', 29, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15965', '', 25161200, 5505, 'M3', 2.45, 575, 1408.75),
(69, '15967', 30, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15967', '', 25161200, 5505, 'M3', 5.5, 575, 3162.5),
(70, '15949', 31, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15949', '', 25161200, 5505, 'M3', 1.819, 575, 1045.93),
(71, '15961', 32, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15961', '', 25161200, 5505, 'M3', 5.684, 575, 3268.3),
(72, '15946', 33, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15946', '', 25161200, 5505, 'M3', 2.681, 575, 1541.58),
(73, '15966', 34, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15966', '', 25161200, 5505, 'M3', 3.975, 575, 2285.63),
(74, '16014', 35, 'Bloco GRANITO - AMARELO - ICARAI. ID: 16014', '', 25161200, 5505, 'M3', 8.795, 575, 5057.13),
(75, '15891', 36, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15891', '', 25161200, 5505, 'M3', 7.2, 575, 4140),
(76, '15901', 37, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15901', '', 25161200, 5505, 'M3', 8.184, 575, 4705.8),
(77, '15945', 38, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15945', '', 25161200, 5505, 'M3', 8.16, 575, 4692),
(78, '14648/', 39, 'Bloco GRANITO - AMARELO - ICARAI. ID: 14648/', '', 25161200, 5505, 'M3', 8.25, 575, 4743.75),
(79, '15963', 40, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15963', '', 25161200, 5505, 'M3', 6.266, 575, 3602.95),
(80, '15912', 41, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15912', '', 25161200, 5505, 'M3', 4.851, 575, 2789.33),
(81, '15919', 42, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15919', '', 25161200, 5505, 'M3', 3.332, 575, 1915.9),
(82, '15923', 43, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15923', '', 25161200, 5505, 'M3', 5.083, 575, 2922.73),
(83, '16018', 44, 'Bloco GRANITO - AMARELO - ICARAI. ID: 16018', '', 25161200, 5505, 'M3', 3.468, 575, 1994.1),
(84, '15968', 45, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15968', '', 25161200, 5505, 'M3', 4.505, 575, 2590.38),
(85, '15959', 46, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15959', '', 25161200, 5505, 'M3', 3.099, 575, 1781.93),
(86, '15913', 47, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15913', '', 25161200, 5505, 'M3', 4.641, 575, 2668.58),
(87, '16020', 48, 'Bloco GRANITO - AMARELO - ICARAI. ID: 16020', '', 25161200, 5505, 'M3', 2.639, 575, 1517.43),
(88, '15948', 49, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15948', '', 25161200, 5505, 'M3', 5.27, 575, 3030.25),
(89, '25440', 50, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25440', '', 25161200, 6504, 'M3', 9.027, 2506.61, 22627.17),
(90, '25446', 51, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25446', '', 25161200, 6504, 'M3', 9.99, 2506.61, 25041.03),
(91, '25441', 52, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25441', '', 25161200, 6504, 'M3', 8.978, 2506.61, 22504.34),
(92, '25436', 53, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25436', '', 25161200, 6504, 'M3', 9.223, 2506.61, 23118.46),
(93, '25410', 54, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25410', '', 25161200, 6504, 'M3', 8.431, 2506.61, 21133.23),
(94, '25411', 55, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25411', '', 25161200, 6504, 'M3', 8.46, 2506.61, 21205.92),
(95, '25412', 56, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25412', '', 25161200, 6504, 'M3', 8.856, 2506.61, 22198.54),
(96, '25413', 57, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25413', '', 25161200, 6504, 'M3', 7.503, 2506.61, 18807.09),
(97, '25434', 58, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25434', '', 25161200, 6504, 'M3', 6.588, 2506.61, 16513.55),
(98, '25442', 59, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25442', '', 25161200, 6504, 'M3', 8.925, 2506.61, 22371.49),
(99, '25448', 60, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25448', '', 25161200, 6504, 'M3', 7.182, 2506.61, 18002.47),
(100, '25432', 61, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25432', '', 25161200, 6504, 'M3', 8.883, 2506.61, 22266.22),
(101, '25424', 62, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25424', '', 25161200, 6504, 'M3', 8.303, 2506.61, 20812.38),
(102, '25447', 63, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25447', '', 25161200, 6504, 'M3', 9.608, 2506.61, 24083.51),
(103, '25438', 64, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25438', '', 25161200, 6504, 'M3', 8.91, 2506.61, 22333.9),
(104, '25435', 65, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25435', '', 25161200, 6504, 'M3', 9.765, 2506.61, 24477.05),
(105, '25439', 66, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25439', '', 25161200, 6504, 'M3', 9.371, 2506.61, 23489.44),
(106, '25443', 67, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25443', '', 25161200, 6504, 'M3', 8.555, 2506.61, 21444.05),
(107, '25418', 68, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25418', '', 25161200, 6504, 'M3', 8.1, 2506.61, 20303.54),
(108, '25426', 69, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25426', '', 25161200, 6504, 'M3', 6.075, 2506.61, 15227.66),
(109, '25417', 70, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25417', '', 25161200, 6504, 'M3', 8.453, 2506.61, 21188.37),
(110, '25414', 71, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25414', '', 25161200, 6504, 'M3', 8.379, 2506.61, 21002.89),
(111, '25422', 72, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25422', '', 25161200, 6504, 'M3', 8.05, 2506.61, 20178.21),
(112, '25425', 73, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25425', '', 25161200, 6504, 'M3', 8.211, 2506.61, 20581.77),
(113, '25421', 74, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25421', '', 25161200, 6504, 'M3', 8.487, 2506.61, 21273.6),
(114, '25427', 75, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25427', '', 25161200, 6504, 'M3', 6.641, 2506.61, 16646.4),
(115, '25423', 76, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25423', '', 25161200, 6504, 'M3', 8.251, 2506.61, 20682.04),
(116, '25437', 77, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25437', '', 25161200, 6504, 'M3', 8.235, 2506.61, 20641.93),
(117, '25433', 78, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25433', '', 25161200, 6504, 'M3', 7.695, 2506.61, 19288.36),
(118, '25429', 79, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25429', '', 25161200, 6504, 'M3', 7.65, 2506.61, 19175.57),
(119, '25430', 80, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25430', '', 25161200, 6504, 'M3', 8.1, 2506.61, 20303.54),
(120, '25431', 81, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25431', '', 25161200, 6504, 'M3', 7.695, 2506.61, 19288.36),
(121, '25420', 82, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25420', '', 25161200, 6504, 'M3', 6.868, 2506.61, 17215.4),
(122, '25409', 83, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25409', '', 25161200, 6504, 'M3', 8.28, 2506.61, 20754.73),
(123, '25445', 84, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25445', '', 25161200, 6504, 'M3', 7.053, 2506.61, 17679.12),
(124, '25419', 85, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25419', '', 25161200, 6504, 'M3', 7.245, 2506.61, 18160.39),
(125, '25416', 86, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25416', '', 25161200, 6504, 'M3', 7.056, 2506.61, 17686.64),
(126, '25428', 87, 'Bloco GRANITO - AMARELA - GIALLO FIORITO. ID: 25428', '', 25161200, 6504, 'M3', 7.245, 2506.61, 18160.39),
(127, '000002', 88, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBES 2455) ** UF:ES - NF Origem:057260 - Comp:2,950 - Alt:1,650 - Larg:1,650;* uTrib: M3, qTri: 8,031, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572601100572600', 25161200, 5505, 'M3', 8.031, 1316.46, 10572.49),
(128, '000002', 89, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBEB 2458) ** UF:ES - NF Origem:057261 - Comp:2,700 - Alt:1,550 - Larg:1,500;* uTrib: M3, qTri: 6,278, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572611100572616', 25161200, 5505, 'M3', 6.278, 1316.46, 8264.74),
(129, '000002', 90, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBBI 2501) ** UF:ES - NF Origem:057265 - Comp:3,900 - Alt:1,550 - Larg:0,950;* uTrib: M3, qTri: 5,743, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572651100572658', 25161200, 5505, 'M3', 5.743, 1316.46, 7560.43),
(130, '000002', 91, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBBC 2500) ** UF:ES - NF Origem:057264 - Comp:2,750 - Alt:1,650 - Larg:0,950;* uTrib: M3, qTri: 4,311, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572641100572642', 25161200, 5505, 'M3', 4.311, 1316.46, 5675.26),
(131, '000002', 92, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBBZ 2502) ** UF:ES - NF Origem:057263 - Comp:2,650 - Alt:1,900 - Larg:0,800;* uTrib: M3, qTri: 4,028, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572631100572637', 25161200, 5505, 'M3', 4.028, 1316.46, 5302.7),
(132, '000002', 93, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBEA 2459) ** UF:ES - NF Origem:057266 - Comp:2,950 - Alt:1,300 - Larg:0,950;* uTrib: M3, qTri: 3,643, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572661100572663', 25161200, 5505, 'M3', 3.643, 1316.46, 4795.86),
(133, '000002', 94, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBHI 2461) ** UF:ES - NF Origem:057267 - Comp:2,750 - Alt:1,550 - Larg:1,000;* uTrib: M3, qTri: 4,263, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572671100572679', 25161200, 5505, 'M3', 4.263, 1316.46, 5612.07),
(134, '000002', 95, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBHG 2466) ** UF:ES - NF Origem:057268 - Comp:2,750 - Alt:1,600 - Larg:1,150;* uTrib: M3, qTri: 5,060, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572681100572684', 25161200, 5505, 'M3', 5.06, 1316.46, 6661.29),
(135, '000002', 96, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBLB 2498) ** UF:ES - NF Origem:057269 - Comp:2,700 - Alt:1,600 - Larg:1,900;* uTrib: M3, qTri: 8,208, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572691100572690', 25161200, 5505, 'M3', 8.208, 1316.46, 10805.5),
(136, '000002', 97, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBSE 2473) ** UF:ES - NF Origem:057270 - Comp:2,300 - Alt:1,650 - Larg:0,900;* uTrib: M3, qTri: 3,416, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572701100572704', 25161200, 5505, 'M3', 3.416, 1316.46, 4497.03),
(137, '000002', 98, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBSA 2479) ** UF:ES - NF Origem:057271 - Comp:2,750 - Alt:1,600 - Larg:0,850;* uTrib: M3, qTri: 3,740, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572711100572710', 25161200, 5505, 'M3', 3.74, 1316.46, 4923.56),
(138, '000002', 99, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBHS 2465) ** UF:ES - NF Origem:057272 - Comp:2,650 - Alt:1,650 - Larg:1,300;* uTrib: M3, qTri: 5,684, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572721100572725', 25161200, 5505, 'M3', 5.684, 1316.46, 7482.76),
(139, '000002', 100, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBGC 2480) ** UF:ES - NF Origem:057273 - Comp:2,700 - Alt:1,700 - Larg:0,650;* uTrib: M3, qTri: 2,984, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572731100572730', 25161200, 5505, 'M3', 2.984, 1316.46, 3928.32),
(140, '000002', 101, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBSB 2478) ** UF:ES - NF Origem:057274 - Comp:2,900 - Alt:1,550 - Larg:1,200;* uTrib: M3, qTri: 5,394, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572741100572746', 25161200, 5505, 'M3', 5.394, 1316.46, 7100.99),
(141, '000002', 102, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBGI 2481) ** UF:ES - NF Origem:057275 - Comp:2,900 - Alt:1,750 - Larg:1,250;* uTrib: M3, qTri: 6,344, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572751100572751', 25161200, 5505, 'M3', 6.344, 1316.46, 8351.62),
(142, '000002', 103, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBGA 2489) ** UF:ES - NF Origem:057276 - Comp:2,750 - Alt:1,550 - Larg:1,100;* uTrib: M3, qTri: 4,689, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572761100572767', 25161200, 5505, 'M3', 4.689, 1316.46, 6172.88),
(143, '000002', 104, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBLI 2491) ** UF:ES - NF Origem:057277 - Comp:2,700 - Alt:1,650 - Larg:1,100;* uTrib: M3, qTri: 4,901, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572771100572772', 25161200, 5505, 'M3', 4.901, 1316.46, 6451.97),
(144, '000002', 105, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBLC 2490) ** UF:ES - NF Origem:057278 - Comp:2,800 - Alt:1,450 - Larg:1,150;* uTrib: M3, qTri: 4,669, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572781100572788', 25161200, 5505, 'M3', 4.669, 1316.46, 6146.55),
(145, '000002', 106, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBHC 2460) ** UF:ES - NF Origem:057279 - Comp:2,900 - Alt:1,600 - Larg:1,700;* uTrib: M3, qTri: 7,888, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572791100572793', 25161200, 5505, 'M3', 7.888, 1316.46, 10384.24),
(146, '000002', 107, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBHZ 2462) ** UF:ES - NF Origem:057280 - Comp:2,950 - Alt:1,600 - Larg:1,650;* uTrib: M3, qTri: 7,788, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572801100572808', 25161200, 5505, 'M3', 7.788, 1316.46, 10252.59),
(147, '000002', 108, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBGS 2485) ** UF:ES - NF Origem:057281 - Comp:2,650 - Alt:1,600 - Larg:0,600;* uTrib: M3, qTri: 2,544, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572811100572813', 25161200, 5505, 'M3', 2.544, 1316.46, 3349.07),
(148, '000002', 109, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBLZ 2492) ** UF:ES - NF Origem:057282 - Comp:2,650 - Alt:1,600 - Larg:1,050;* uTrib: M3, qTri: 4,452, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572821100572829', 25161200, 5505, 'M3', 4.452, 1316.46, 5860.88),
(149, '000002', 110, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBGH 2484) ** UF:ES - NF Origem:057283 - Comp:2,800 - Alt:1,550 - Larg:1,450;* uTrib: M3, qTri: 6,293, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572831100572834', 25161200, 5505, 'M3', 6.293, 1316.46, 8284.48),
(150, '000002', 111, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBHB 2468) ** UF:ES - NF Origem:057284 - Comp:2,700 - Alt:1,550 - Larg:0,700;* uTrib: M3, qTri: 2,930, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572841100572840', 25161200, 5505, 'M3', 2.93, 1316.46, 3857.23),
(151, '000002', 112, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBLE 2493) ** UF:ES - NF Origem:057285 - Comp:2,700 - Alt:1,650 - Larg:0,950;* uTrib: M3, qTri: 4,232, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572851100572855', 25161200, 5505, 'M3', 4.232, 1316.46, 5571.26),
(152, '000002', 113, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBGL 2487) ** UF:ES - NF Origem:057286 - Comp:2,950 - Alt:1,650 - Larg:1,700;* uTrib: M3, qTri: 8,275, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572861100572860', 25161200, 5505, 'M3', 8.275, 1316.46, 10893.71),
(153, '000002', 114, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBEL 2457) ** UF:ES - NF Origem:057287 - Comp:2,700 - Alt:1,500 - Larg:2,000;* uTrib: M3, qTri: 8,100, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572871100572876', 25161200, 5505, 'M3', 8.1, 1316.46, 10663.33),
(154, '000002', 115, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBEE 2453) ** UF:ES - NF Origem:057288 - Comp:2,700 - Alt:1,600 - Larg:2,000;* uTrib: M3, qTri: 8,640, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572881100572881', 25161200, 5505, 'M3', 8.64, 1316.46, 11374.21),
(155, '000002', 116, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBHL 2467) ** UF:ES - NF Origem:057291 - Comp:2,600 - Alt:1,650 - Larg:0,650;* uTrib: M3, qTri: 2,789, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572911100572917', 25161200, 5505, 'M3', 2.789, 1316.46, 3671.61),
(156, '000002', 117, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBLA 2499) ** UF:ES - NF Origem:057292 - Comp:2,500 - Alt:1,700 - Larg:1,000;* uTrib: M3, qTri: 4,250, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572921100572922', 25161200, 5505, 'M3', 4.25, 1316.46, 5594.96),
(157, '000002', 118, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBLH 2494) ** UF:ES - NF Origem:057293 - Comp:2,400 - Alt:1,500 - Larg:1,450;* uTrib: M3, qTri: 5,220, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572931100572938', 25161200, 5505, 'M3', 5.22, 1316.46, 6871.92),
(158, '000002', 119, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBEZ 2452) ** UF:ES - NF Origem:057296 - Comp:2,950 - Alt:1,650 - Larg:1,900;* uTrib: M3, qTri: 9,248, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572961100572964', 25161200, 5505, 'M3', 9.248, 1316.46, 12174.62),
(159, '000002', 120, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBGE 2483) ** UF:ES - NF Origem:057297 - Comp:2,300 - Alt:1,550 - Larg:0,550;* uTrib: M3, qTri: 1,961, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572971100572970', 25161200, 5505, 'M3', 1.961, 1316.46, 2581.58),
(160, '000002', 121, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBBE 2503) ** UF:ES - NF Origem:057298 - Comp:2,650 - Alt:1,600 - Larg:1,100;* uTrib: M3, qTri: 4,664, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572981100572985', 25161200, 5505, 'M3', 4.664, 1316.46, 6139.97),
(161, '000002', 122, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBGG 2486) ** UF:ES - NF Origem:057299 - Comp:3,000 - Alt:1,550 - Larg:1,100;* uTrib: M3, qTri: 5,115, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000572991100572990', 25161200, 5505, 'M3', 5.115, 1316.46, 6733.69),
(162, '000002', 123, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBEG 2456) ** UF:ES - NF Origem:057300 - Comp:2,900 - Alt:1,600 - Larg:1,700;* uTrib: M3, qTri: 7,888, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000573001100573000', 25161200, 5505, 'M3', 7.888, 1316.46, 10384.24),
(163, '000002', 124, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBGB 2488) ** UF:ES - NF Origem:057301 - Comp:2,950 - Alt:1,700 - Larg:1,650;* uTrib: M3, qTri: 8,275, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000573011100573016', 25161200, 5505, 'M3', 8.275, 1316.46, 10893.71),
(164, '000002', 125, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBHE 2463) ** UF:ES - NF Origem:057302 - Comp:2,700 - Alt:1,600 - Larg:2,000;* uTrib: M3, qTri: 8,640, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000573021100573021', 25161200, 5505, 'M3', 8.64, 1316.46, 11374.21),
(165, '000002', 126, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBHH 2464) ** UF:ES - NF Origem:057303 - Comp:2,950 - Alt:1,600 - Larg:1,750;* uTrib: M3, qTri: 8,260, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000573031100573037', 25161200, 5505, 'M3', 8.26, 1316.46, 10873.96),
(166, '000002', 127, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBHA 2469) ** UF:ES - NF Origem:057304 - Comp:2,900 - Alt:1,650 - Larg:1,750;* uTrib: M3, qTri: 8,374, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000573041100573042', 25161200, 5505, 'M3', 8.374, 1316.46, 11024.04),
(167, '000002', 128, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBSC 2470) ** UF:ES - NF Origem:057305 - Comp:2,950 - Alt:1,650 - Larg:1,800;* uTrib: M3, qTri: 8,762, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000573051100573058', 25161200, 5505, 'M3', 8.762, 1316.46, 11534.82),
(168, '000002', 129, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBSG 2476) ** UF:ES - NF Origem:057306 - Comp:2,650 - Alt:1,600 - Larg:2,000;* uTrib: M3, qTri: 8,480, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000573061100573063', 25161200, 5505, 'M3', 8.48, 1316.46, 11163.58),
(169, '000002', 130, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBSI 2471) ** UF:ES - NF Origem:057308 - Comp:2,700 - Alt:1,650 - Larg:1,900;* uTrib: M3, qTri: 8,465, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000573081100573084', 25161200, 5505, 'M3', 8.465, 1316.46, 11143.83),
(170, '000002', 131, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBSS 2475) ** UF:ES - NF Origem:057309 - Comp:2,750 - Alt:1,650 - Larg:1,800;* uTrib: M3, qTri: 8,168, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000573091100573090', 25161200, 5505, 'M3', 8.168, 1316.46, 10752.85),
(171, '000002', 132, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBEI 2451) ** UF:ES - NF Origem:057310 - Comp:2,800 - Alt:1,650 - Larg:1,900;* uTrib: M3, qTri: 8,778, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000573101100573104', 25161200, 5505, 'M3', 8.778, 1316.46, 11555.89),
(172, '000002', 133, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBLS 2495) ** UF:ES - NF Origem:057311 - Comp:2,750 - Alt:1,550 - Larg:1,900;* uTrib: M3, qTri: 8,099, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000573111100573110', 25161200, 5505, 'M3', 8.099, 1316.46, 10662.01),
(173, '000002', 134, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBLG 2496) ** UF:ES - NF Origem:057312 - Comp:2,600 - Alt:1,650 - Larg:1,900;* uTrib: M3, qTri: 8,151, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000573121100573125', 25161200, 5505, 'M3', 8.151, 1316.46, 10730.47),
(174, '000002', 135, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBLL 2497) ** UF:ES - NF Origem:057313 - Comp:2,700 - Alt:1,650 - Larg:1,950;* uTrib: M3, qTri: 8,687, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000573131100573130', 25161200, 5505, 'M3', 8.687, 1316.46, 11436.09),
(175, '000002', 136, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBSH 2474) ** UF:ES - NF Origem:057314 - Comp:2,650 - Alt:1,700 - Larg:1,900;* uTrib: M3, qTri: 8,560, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000573141100573146', 25161200, 5505, 'M3', 8.56, 1316.46, 11268.9),
(176, '000002', 137, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBGZ 2482) ** UF:ES - NF Origem:057315 - Comp:2,900 - Alt:1,600 - Larg:0,550;* uTrib: M3, qTri: 2,552, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000573151100573151', 25161200, 5505, 'M3', 2.552, 1316.46, 3359.61),
(177, '000002', 138, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBSL 2477) ** UF:ES - NF Origem:057316 - Comp:2,950 - Alt:1,600 - Larg:1,100;* uTrib: M3, qTri: 5,192, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000573161100573167', 25161200, 5505, 'M3', 5.192, 1316.46, 6835.06),
(178, '000002', 139, 'BLOCO DE GRANITO AMARELADO ORO VENEZIANO', '(IZBSZ 2472) ** UF:ES - NF Origem:057354 - Comp:2,700 - Alt:1,650 - Larg:1,950;* uTrib: M3, qTri: 8,687, vUnTrib: R$ 1.316,46 *;;NF-e Ref.: 32210504291481000192550010000573541100573540', 25161200, 5505, 'M3', 8.687, 1316.46, 11436.09),
(179, '2723', 140, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11098 | 2.80 x 1.70 x 1.95', 25161200, 5505, 'M3', 9.282, 625, 5801.25),
(180, '2723', 141, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11099 | 2.95 x 1.75 x 1.75', 25161200, 5505, 'M3', 9.034, 625, 5646.25),
(181, '2723', 142, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11100 | 3.05 x 1.75 x 1.35', 25161200, 5505, 'M3', 7.206, 625, 4503.75),
(182, '2723', 143, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11101 | 3.20 x 1.70 x 1.25', 25161200, 5505, 'M3', 6.8, 625, 4250),
(183, '2723', 144, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11102 | 3.20 x 1.70 x 1.65', 25161200, 5505, 'M3', 8.976, 625, 5610),
(184, '2723', 145, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11104 | 2.55 x 1.70 x 2.15', 25161200, 5505, 'M3', 9.32, 625, 5825),
(185, '2723', 146, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11105 | 3.20 x 1.65 x 1.80', 25161200, 5505, 'M3', 9.504, 625, 5940),
(186, '2723', 147, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', 'LEA-123 | 3.00 x 1.70 x 1.85', 25161200, 5505, 'M3', 9.435, 650, 6132.75),
(187, '2723', 148, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11103 | 3.30 x 1.65 x .65', 25161200, 5505, 'M3', 3.539, 625, 2211.88),
(188, '2723', 149, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', 'LEG-120 | 2.95 x 1.80 x 1.75', 25161200, 5505, 'M3', 9.293, 650, 6040.45),
(189, '2723', 150, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', 'LLW-118 | 2.85 x 1.05 x 1.80', 25161200, 5505, 'M3', 5.387, 650, 3501.55),
(190, '2723', 151, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', 'LLS-119 | 2.80 x 1.80 x 1.65', 25161200, 5505, 'M3', 8.316, 650, 5405.4),
(191, '2723', 152, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', 'LEL-121 | 2.90 x 1.75 x 1.80', 25161200, 5505, 'M3', 9.135, 650, 5937.75),
(192, '2723', 153, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11069 | 2.75 x 1.80 x 1.70', 25161200, 5505, 'M3', 8.415, 625.0006, 5259.38),
(193, '2723', 154, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11070 | 2.95 x 1.70 x 1.70', 25161200, 5505, 'M3', 8.526, 625, 5328.75),
(194, '2723', 155, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11076 | 2.75 x 1.75 x 1.75', 25161200, 5505, 'M3', 8.422, 625, 5263.75),
(195, '2723', 156, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11078 | 2.95 x 1.70 x 1.65', 25161200, 5505, 'M3', 8.275, 625, 5171.88),
(196, '2723', 157, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11106 | 3.20 x 1.70 x 1.65', 25161200, 5505, 'M3', 8.976, 500, 4488),
(197, '2723', 158, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11107 | 2.80 x 1.70 x 1.95', 25161200, 5505, 'M3', 9.282, 500, 4641),
(198, '2723', 159, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11109 | 2.80 x 1.65 x 2.10', 25161200, 5505, 'M3', 9.702, 500, 4851),
(199, '2723', 160, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11108 | 3.20 x 1.75 x 1.55', 25161200, 5505, 'M3', 8.68, 500, 4340),
(200, '2723', 161, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11110 | 2.85 x 1.75 x 2.10', 25161200, 5505, 'M3', 10.474, 500, 5237),
(201, '2723', 162, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11111 | 2.90 x 1.65 x 2.00', 25161200, 5505, 'M3', 9.57, 500, 4785),
(202, '2723', 163, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11113 | 3.25 x 1.80 x 1.35', 25161200, 5505, 'M3', 7.898, 500, 3949),
(203, '2723', 164, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11147 | 2.65 x 1.75 x 2.10', 25161200, 5505, 'M3', 9.739, 500, 4869.5),
(204, '2723', 165, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11112 | 2.80 x 1.70 x .80', 25161200, 5505, 'M3', 3.808, 500, 1904),
(205, '2723', 166, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11114 | 2.70 x 1.70 x 1.95', 25161200, 5505, 'M3', 8.951, 500, 4475.5),
(206, '2723', 167, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11115 | 2.55 x 1.70 x 1.95', 25161200, 5505, 'M3', 8.453, 500, 4226.5),
(207, '2723', 168, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11116 | 2.65 x 1.70 x 2.00', 25161200, 5505, 'M3', 9.01, 500, 4505),
(208, '2723', 169, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11117 | 3.00 x 1.85 x 1.60', 25161200, 5505, 'M3', 8.88, 500, 4440),
(209, '2723', 170, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11118 | 2.80 x 1.75 x 2.05', 25161200, 5505, 'M3', 10.045, 500, 5022.5),
(210, '2723', 171, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11119 | 2.95 x 1.75 x 1.80', 25161200, 5505, 'M3', 9.293, 500, 4646.5),
(211, '2723', 172, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11120 | 3.00 x 1.90 x 1.60', 25161200, 5505, 'M3', 9.12, 500, 4560),
(212, '2723', 173, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11121 | 2.65 x 1.80 x 2.05', 25161200, 5505, 'M3', 9.779, 500, 4889.5),
(213, '2723', 174, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11122 | 2.50 x 1.70 x 2.00', 25161200, 5505, 'M3', 8.5, 500, 4250),
(214, '2723', 175, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11124 | 2.70 x 1.70 x 1.90', 25161200, 5505, 'M3', 8.721, 500, 4360.5),
(215, '2723', 176, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11125 | 2.95 x 1.60 x 1.15', 25161200, 5505, 'M3', 5.428, 500, 2714),
(216, '2723', 177, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11126 | 2.95 x 1.75 x .90', 25161200, 5505, 'M3', 4.646, 500, 2323),
(217, '2723', 178, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11127 | 3.15 x 1.70 x 1.35', 25161200, 5505, 'M3', 7.229, 500, 3614.5),
(218, '2723', 179, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11128 | 3.15 x 1.70 x 1.70', 25161200, 5505, 'M3', 9.104, 500, 4552),
(219, '2723', 180, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11129 | 2.60 x 1.80 x 1.75', 25161200, 5505, 'M3', 8.19, 500, 4095),
(220, '2723', 181, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11130 | 2.95 x 1.75 x 1.75', 25161200, 5505, 'M3', 9.034, 500, 4517),
(221, '2723', 182, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11131 | 3.15 x 1.75 x 1.75', 25161200, 5505, 'M3', 9.647, 500, 4823.5),
(222, '2723', 183, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11132 | 3.15 x 1.75 x 1.65', 25161200, 5505, 'M3', 9.096, 550, 5002.8),
(223, '2723', 184, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11133 | 3.20 x 1.70 x 1.65', 25161200, 5505, 'M3', 8.976, 500, 4488),
(224, '2723', 185, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11134 | 3.15 x 1.75 x 1.60', 25161200, 5505, 'M3', 8.82, 500, 4410),
(225, '2723', 186, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11135 | 3.10 x 1.70 x 1.70', 25161200, 5505, 'M3', 8.959, 500, 4479.5),
(226, '2723', 187, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11136 | 3.00 x 1.80 x 1.70', 25161200, 5505, 'M3', 9.18, 500, 4590),
(227, '2723', 188, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11137 | 3.15 x 1.65 x 1.60', 25161200, 5505, 'M3', 8.316, 500, 4158),
(228, '2723', 189, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11138 | 2.60 x 1.75 x 1.70', 25161200, 5505, 'M3', 7.735, 500, 3867.5),
(229, '2723', 190, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11139 | 2.75 x 1.80 x 1.60', 25161200, 5505, 'M3', 7.92, 500, 3960),
(230, '2723', 191, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11140 | 2.95 x 1.75 x 1.00', 25161200, 5505, 'M3', 5.163, 500, 2581.5),
(231, '2723', 192, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11141 | 2.75 x 1.75 x 1.90', 25161200, 5505, 'M3', 9.144, 500, 4572),
(232, '2723', 193, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11142 | 2.70 x 1.75 x 1.55', 25161200, 5505, 'M3', 7.324, 500, 3662),
(233, '2723', 194, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11143 | 2.70 x 1.75 x 1.80', 25161200, 5505, 'M3', 8.505, 500, 4252.5),
(234, '2723', 195, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11144 | 2.75 x 1.55 x 1.90', 25161200, 5505, 'M3', 8.099, 500, 4049.5),
(235, '2723', 196, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11123 | 2.55 x 1.75 x 1.80', 25161200, 5505, 'M3', 8.033, 500, 4016.5),
(236, '2723', 197, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11145 | 2.80 x 1.70 x 1.65', 25161200, 5505, 'M3', 7.854, 500, 3927),
(237, '2723', 198, 'BLOCO GRANITO AMARELO SANTA CECILIA LIGHT', '11146 | 2.80 x 1.70 x 1.65', 25161200, 5505, 'M3', 7.854, 500, 3927),
(238, '15924', 199, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15924', '', 25161200, 5505, 'M3', 8.8, 575, 5060),
(239, '15903', 200, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15903', '', 25161200, 5505, 'M3', 8.579, 575, 4932.93),
(240, '15922', 201, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15922', '', 25161200, 5505, 'M3', 8.8, 575, 5060),
(241, '15920', 202, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15920', '', 25161200, 5505, 'M3', 8.526, 575, 4902.45),
(242, '15890', 203, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15890', '', 25161200, 5505, 'M3', 8.785, 575, 5051.38),
(243, '15889', 204, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15889', '', 25161200, 5505, 'M3', 7.508, 575, 4317.1),
(244, '15943', 205, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15943', '', 25161200, 5505, 'M3', 7.928, 575, 4558.6),
(245, '15925', 206, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15925', '', 25161200, 5505, 'M3', 8.835, 575, 5080.13),
(246, '15896', 207, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15896', '', 25161200, 5505, 'M3', 8.848, 575, 5087.6),
(247, '15902', 208, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15902', '', 25161200, 5505, 'M3', 7.315, 575, 4206.13),
(248, '15930', 209, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15930', '', 25161200, 5505, 'M3', 8.745, 575, 5028.38),
(249, '15653', 210, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15653', '', 25161200, 5505, 'M3', 8.67, 575, 4985.25),
(250, '15899', 211, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15899', '', 25161200, 5505, 'M3', 7.56, 575, 4347),
(251, '15916', 212, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15916', '', 25161200, 5505, 'M3', 8.835, 575, 5080.13),
(252, '15970', 213, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15970', '', 25161200, 5505, 'M3', 8.712, 575, 5009.4),
(253, '15954', 214, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15954', '', 25161200, 5505, 'M3', 1.577, 575, 906.78),
(254, '15938', 215, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15938', '', 25161200, 5505, 'M3', 7.025, 575, 4039.38),
(255, '15958', 216, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15958', '', 25161200, 5505, 'M3', 2.431, 575, 1397.83),
(256, '15936', 217, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15936', '', 25161200, 5505, 'M3', 5.891, 575, 3387.33),
(257, '15907', 218, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15907', '', 25161200, 5505, 'M3', 7.59, 575, 4364.25),
(258, '15927', 219, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15927', '', 25161200, 5505, 'M3', 9.009, 575, 5180.18),
(259, '15917', 220, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15917', '', 25161200, 5505, 'M3', 8.935, 575, 5137.63),
(260, '15909', 221, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15909', '', 25161200, 5505, 'M3', 7.128, 575, 4098.6),
(261, '15962', 222, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15962', '', 25161200, 5505, 'M3', 4.24, 575, 2438),
(262, '15960', 223, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15960', '', 25161200, 5505, 'M3', 6.006, 575, 3453.45),
(263, '15911', 224, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15911', '', 25161200, 5505, 'M3', 4.826, 575, 2774.95),
(264, '15964', 225, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15964', '', 25161200, 5505, 'M3', 8.984, 575, 5165.8),
(265, '15955', 226, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15955', '', 25161200, 5505, 'M3', 7.128, 575, 4098.6),
(266, '15952', 227, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15952', '', 25161200, 5505, 'M3', 5.022, 575, 2887.65),
(267, '15969', 228, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15969', '', 25161200, 5505, 'M3', 5.4, 575, 3105),
(268, '15939', 229, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15939', '', 25161200, 5505, 'M3', 6.34, 575, 3645.5),
(269, '15904', 230, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15904', '', 25161200, 5505, 'M3', 5.957, 575, 3425.28),
(270, '15898', 231, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15898', '', 25161200, 5505, 'M3', 5.016, 575, 2884.2),
(271, '15910', 232, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15910', '', 25161200, 5505, 'M3', 1.936, 575, 1113.2),
(272, '15892', 233, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15892', '', 25161200, 5505, 'M3', 3.264, 575, 1876.8),
(273, '15931', 234, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15931', '', 25161200, 5505, 'M3', 3.96, 575, 2277),
(274, '15929', 235, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15929', '', 25161200, 5505, 'M3', 8.96, 575, 5152),
(275, '15928', 236, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15928', '', 25161200, 5505, 'M3', 8.312, 575, 4779.4),
(276, '15957', 237, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15957', '', 25161200, 5505, 'M3', 2.08, 575, 1196),
(277, '15897', 238, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15897', '', 25161200, 5505, 'M3', 4.86, 575, 2794.5),
(278, '15900', 239, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15900', '', 25161200, 5505, 'M3', 2.882, 575, 1657.15),
(279, '15894', 240, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15894', '', 25161200, 5505, 'M3', 4.635, 575, 2665.13),
(280, '15893', 241, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15893', '', 25161200, 5505, 'M3', 3.162, 575, 1818.15),
(281, '15937', 242, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15937', '', 25161200, 5505, 'M3', 4.232, 575, 2433.4),
(282, '15947', 243, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15947', '', 25161200, 5505, 'M3', 4.154, 575, 2388.55),
(283, '15941', 244, 'Bloco GRANITO - AMARELO - ICARAI. ID: 15941', '', 25161200, 5505, 'M3', 3.825, 575, 2199.38),
(284, '1520', 245, 'BLOCO DE GRANITO BRANCO EVEREST', 'COMM - N.: 3420 (3420-F4)', 25161200, 5505, 'M3', 5.583, 5948.028, 33207.84),
(285, '1520', 246, 'BLOCO DE GRANITO BRANCO EVEREST', 'COMM - N.: 3422 (3422-F4)', 25161200, 5505, 'M3', 6.696, 4895.355, 32779.3),
(286, '2334', 247, 'BLOCO DE QUARTZITO CINZA OCEAN BLUE', 'COMM - N.: 22', 25062000, 5505, 'M3', 6.061, 5797, 35135.62),
(287, '2334', 248, 'BLOCO DE QUARTZITO CINZA OCEAN BLUE', 'COMM - N.: 26', 25062000, 5505, 'M3', 5.859, 5797, 33964.62),
(288, '2298', 249, 'BLOCO DE GRANITO BRANCO TOURMALINE QUARTZO', 'COMM - N.: 3428 (2428-F4)', 25161200, 5505, 'M3', 10.602, 11202.29, 118766.68),
(289, '2298', 250, 'BLOCO DE GRANITO BRANCO TOURMALINE QUARTZO', 'COMM - N.: 3427 (3427-F4)', 25161200, 5505, 'M3', 5.4483, 8581.4547657067, 46754.34),
(290, '2334', 251, 'BLOCO DE QUARTZITO CINZA OCEAN BLUE', 'COMM - N.: 25', 25062000, 5505, 'M3', 9.608, 5797, 55697.58),
(291, '2298', 252, 'BLOCO DE GRANITO BRANCO TOURMALINE QUARTZO', 'COMM - N.: 3425 (3425-F4)', 25161200, 5505, 'M3', 3.848, 11265.877, 43351.09),
(292, '1499', 253, 'BLOCO DE GRANITO FELDSPATO BRANCO PATAGONIA', 'COMM - N.: 459', 25161200, 5505, 'M3', 5.832, 1000, 5832),
(293, '1499', 254, 'BLOCO DE GRANITO FELDSPATO BRANCO PATAGONIA', 'COMM - N.: 460', 25161200, 5505, 'M3', 3.553, 1000, 3553),
(294, '1499', 255, 'BLOCO DE GRANITO FELDSPATO BRANCO PATAGONIA', 'COMM - N.: 461', 25161200, 5505, 'M3', 4.804, 1000, 4804),
(295, '1499', 256, 'BLOCO DE GRANITO FELDSPATO BRANCO PATAGONIA', 'COMM - N.: 470', 25161200, 5505, 'M3', 10.089, 1000, 10089);

-- --------------------------------------------------------

--
-- Estrutura da tabela `operacao`
--

CREATE TABLE `operacao` (
  `id` int(11) NOT NULL,
  `operacao` int(11) NOT NULL COMMENT 'Tipo de operação',
  `periodo` int(11) NOT NULL,
  `armazem` int(11) NOT NULL,
  `faina` varchar(5) NOT NULL,
  `terno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `operacao`
--

INSERT INTO `operacao` (`id`, `operacao`, `periodo`, `armazem`, `faina`, `terno`) VALUES
(5, 3, 1, 1, '4.3', 1),
(6, 3, 2, 2, '4.3', 1),
(7, 3, 3, 4, '4.3', 1),
(8, 3, 4, 1, '4.3', 1),
(9, 3, 10, 5, '4.3', 1),
(10, 3, 11, 2, '4.3', 1),
(11, 3, 12, 2, '4.3', 1),
(12, 3, 13, 5, '4.3', 1),
(13, 3, 14, 5, '4.3', 1),
(14, 3, 1, 2, '4.3', 2),
(15, 3, 3, 5, '4.3', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `paralizacao_ope`
--

CREATE TABLE `paralizacao_ope` (
  `id` int(11) NOT NULL,
  `atracacao` int(11) NOT NULL,
  `periodo` int(11) NOT NULL,
  `terno` int(11) NOT NULL,
  `paralizacao` int(11) NOT NULL,
  `par_inicio` datetime NOT NULL,
  `par_termino` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `paralizacao_ope`
--

INSERT INTO `paralizacao_ope` (`id`, `atracacao`, `periodo`, `terno`, `paralizacao`, `par_inicio`, `par_termino`) VALUES
(3, 1, 1, 5, 1, '2021-07-24 17:25:25', '2021-07-24 17:35:25'),
(6, 1, 2, 5, 1, '2021-07-24 17:35:25', '2021-07-24 17:50:25'),
(7, 1, 3, 11, 1, '2021-07-24 17:25:25', '2021-07-24 17:35:25'),
(9, 1, 4, 13, 1, '2021-07-24 01:25:25', '2021-07-24 03:35:25'),
(10, 1, 10, 14, 1, '2021-07-24 01:25:25', '2021-07-24 03:35:25'),
(11, 1, 11, 15, 1, '2021-07-24 01:25:25', '2021-07-24 03:35:25'),
(12, 1, 12, 13, 1, '2021-07-24 01:25:25', '2021-07-24 03:35:25'),
(13, 1, 13, 14, 1, '2021-07-24 01:25:25', '2021-07-24 03:35:25'),
(14, 1, 14, 15, 1, '2021-07-24 01:25:25', '2021-07-24 03:35:25');

-- --------------------------------------------------------

--
-- Estrutura da tabela `periodos_operacao`
--

CREATE TABLE `periodos_operacao` (
  `id` int(11) NOT NULL,
  `data_ref` date NOT NULL,
  `responsavel` int(11) NOT NULL,
  `periodo` int(11) NOT NULL,
  `atracacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `periodos_operacao`
--

INSERT INTO `periodos_operacao` (`id`, `data_ref`, `responsavel`, `periodo`, `atracacao`) VALUES
(1, '2021-07-20', 1, 1, 1),
(2, '2021-07-20', 1, 2, 1),
(3, '2021-07-20', 1, 3, 1),
(4, '2021-07-20', 1, 4, 1),
(10, '2021-07-21', 1, 3, 1),
(11, '2021-07-22', 1, 3, 1),
(12, '2021-07-22', 1, 4, 1),
(13, '2021-07-23', 1, 2, 1),
(14, '2021-07-23', 1, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  `cpf` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`id`, `nome`, `sobrenome`, `cpf`) VALUES
(1, 'Ícaro', 'Felipe de Lanes', 15766723792),
(2, 'Renan', 'felipe de lanes', 17378383708);

-- --------------------------------------------------------

--
-- Estrutura da tabela `placas`
--

CREATE TABLE `placas` (
  `id` int(11) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `placas`
--

INSERT INTO `placas` (`id`, `placa`, `tipo`) VALUES
(1, 'cavalo', 1),
(2, 'carreta', 2),
(11, 'OYJ6123', 1),
(12, '2222222', 1),
(13, 'CUD6I94', 1),
(14, 'MQL2253', 2),
(15, '9999999', 2),
(42, '3333333', 2),
(44, 'kpe0020', 1),
(54, 'kub7770', 1),
(66, 'abv1234', 2),
(67, '1234567', 2),
(68, 'plnova1', 1),
(69, 'plnova2', 2),
(70, 'plnova3', 2),
(71, '5555555', 2),
(72, '6666666', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano_ope_porao`
--

CREATE TABLE `plano_ope_porao` (
  `id` int(11) NOT NULL,
  `atracacao` int(11) NOT NULL,
  `porao` int(11) NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `plano_ope_porao`
--

INSERT INTO `plano_ope_porao` (`id`, `atracacao`, `porao`, `total`) VALUES
(1, 1, 1, 1000000),
(2, 1, 2, 2000000),
(3, 1, 4, 1250000),
(4, 1, 5, 750000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_doc`
--

CREATE TABLE `tipo_doc` (
  `id` int(11) NOT NULL,
  `identificacao` varchar(11) NOT NULL COMMENT 'Abreviatura de documento',
  `descr` varchar(30) NOT NULL COMMENT 'descrição de documento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_doc`
--

INSERT INTO `tipo_doc` (`id`, `identificacao`, `descr`) VALUES
(2, 'DI', 'Documento de importação'),
(3, 'DU-e', 'Documento de exportação');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_lancamento`
--

CREATE TABLE `tipo_lancamento` (
  `id` int(11) NOT NULL,
  `nTipo` varchar(20) NOT NULL,
  `descrição` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_lancamento`
--

INSERT INTO `tipo_lancamento` (`id`, `nTipo`, `descrição`) VALUES
(1, 'recepção', ''),
(2, 'embarque', ''),
(3, 'desembarque', ''),
(4, 'transferencia', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_placa`
--

CREATE TABLE `tipo_placa` (
  `id` int(11) NOT NULL,
  `tipo` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_placa`
--

INSERT INTO `tipo_placa` (`id`, `tipo`) VALUES
(1, 'cavalo'),
(2, 'carreta');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `descr` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `tipo`, `descr`) VALUES
(1, 'admin', 'Administrador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` int(11) NOT NULL COMMENT 'id_pessoa',
  `usuario` varchar(20) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `tipo` int(11) NOT NULL COMMENT 'user_tp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `usuario`, `senha`, `tipo`) VALUES
(1, 1, 'icaro.lanes', 'aWNhcm8ubGFuZXM=', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `armazem`
--
ALTER TABLE `armazem`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `atracacao`
--
ALTER TABLE `atracacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `berco`
--
ALTER TABLE `berco`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `lancamentos`
--
ALTER TABLE `lancamentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `lista_grupos`
--
ALTER TABLE `lista_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `lista_paralizacoes`
--
ALTER TABLE `lista_paralizacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `lista_periodos`
--
ALTER TABLE `lista_periodos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `navios`
--
ALTER TABLE `navios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `nf_ident`
--
ALTER TABLE `nf_ident`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `nf_itens`
--
ALTER TABLE `nf_itens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nota_id` (`nf_id`);

--
-- Índices para tabela `operacao`
--
ALTER TABLE `operacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `paralizacao_ope`
--
ALTER TABLE `paralizacao_ope`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `periodos_operacao`
--
ALTER TABLE `periodos_operacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `placas`
--
ALTER TABLE `placas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `plano_ope_porao`
--
ALTER TABLE `plano_ope_porao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tipo_doc`
--
ALTER TABLE `tipo_doc`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tipo_lancamento`
--
ALTER TABLE `tipo_lancamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tipo_placa`
--
ALTER TABLE `tipo_placa`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `armazem`
--
ALTER TABLE `armazem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `atracacao`
--
ALTER TABLE `atracacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `berco`
--
ALTER TABLE `berco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `lancamentos`
--
ALTER TABLE `lancamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `lista_grupos`
--
ALTER TABLE `lista_grupos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `lista_paralizacoes`
--
ALTER TABLE `lista_paralizacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `lista_periodos`
--
ALTER TABLE `lista_periodos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `navios`
--
ALTER TABLE `navios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `nf_ident`
--
ALTER TABLE `nf_ident`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;

--
-- AUTO_INCREMENT de tabela `nf_itens`
--
ALTER TABLE `nf_itens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

--
-- AUTO_INCREMENT de tabela `operacao`
--
ALTER TABLE `operacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `paralizacao_ope`
--
ALTER TABLE `paralizacao_ope`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `periodos_operacao`
--
ALTER TABLE `periodos_operacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `placas`
--
ALTER TABLE `placas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de tabela `plano_ope_porao`
--
ALTER TABLE `plano_ope_porao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tipo_doc`
--
ALTER TABLE `tipo_doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tipo_lancamento`
--
ALTER TABLE `tipo_lancamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tipo_placa`
--
ALTER TABLE `tipo_placa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `nf_itens`
--
ALTER TABLE `nf_itens`
  ADD CONSTRAINT `nf_itens_ibfk_1` FOREIGN KEY (`nf_id`) REFERENCES `nf_ident` (`id`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
