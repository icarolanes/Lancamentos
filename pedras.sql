-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Jul-2021 às 16:06
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
(1, 20, 'Armazém Peiu'),
(2, 1, 'porão 1'),
(3, 2, 'Porão 2'),
(4, 3, 'Porão 3'),
(5, 4, 'Porão 4'),
(6, 5, 'Porão 5');

-- --------------------------------------------------------

--
-- Estrutura da tabela `documentos`
--

CREATE TABLE `documentos` (
  `id` int(11) NOT NULL,
  `tipo` int(11) NOT NULL COMMENT 'tipo de documento im/exp (tipo_doc)',
  `identificacao` varchar(30) NOT NULL COMMENT 'numero/codigo',
  `empresa` int(11) NOT NULL COMMENT 'id da Empresa responsavel (empresas)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresas`
--

CREATE TABLE `empresas` (
  `id` int(11) NOT NULL,
  `xCNPJ` text NOT NULL,
  `xNome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `empresas`
--

INSERT INTO `empresas` (`id`, `xCNPJ`, `xNome`) VALUES
(1, '24042913000139', 'GRANSENA EXPORTACAO E COMERCIO LTDA'),
(2, '999999999999', 'não informado'),
(3, '20082261000105', 'RME COMERCIO DE MARMORES E GRANITOS LTDA'),
(4, '92660604011974', 'YARA BRASIL FERTILIZANTES SA'),
(5, '15038402000152', 'SPORTOS TRANSPORTE RODOVIARIO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lançamentos`
--

CREATE TABLE `lançamentos` (
  `id` int(11) NOT NULL,
  `tipo` int(11) NOT NULL COMMENT 'recepção / embarque / desembarque / transferencia',
  `documento` int(11) NOT NULL COMMENT 'id do documento de im/exp',
  `responsavel` int(11) NOT NULL COMMENT 'id da empresa responsável (empresas)',
  `nf` int(11) DEFAULT NULL COMMENT 'id da nota fiscal (se tiver)',
  `transp` int(11) DEFAULT NULL COMMENT 'id da transportadora (empresas)',
  `motorista` int(11) DEFAULT NULL COMMENT 'motorista (usar consulta de ultimo lançamento)',
  `placa` int(11) NOT NULL COMMENT 'placa do veiculo de transporta',
  `data` datetime NOT NULL COMMENT 'data da movimentação',
  `periodo` int(11) NOT NULL COMMENT 'período realizado',
  `tara` float DEFAULT NULL COMMENT 'peso de entrada',
  `bruto` float DEFAULT NULL COMMENT 'peso de saída',
  `liquido` float DEFAULT NULL COMMENT 'diferença',
  `porao` int(11) DEFAULT NULL COMMENT 'local de arm ou porão'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(2, '31210792660604011974550570000020101323482447', 57, 1, '2021-07-12 08:23:18', 4, 30, '0', 30420, 30420, 58927.8, 58927.8, 5, 'BRUTO 46.230 TARA 15.810 LIQUIDO 30.420  CV MPP 7166MERCADORIA SEGUIU DIRETAMENTE DO PORTO DE VITORIA-ES NOS TERMOS DO ANEXO V, ARTIGO 13 DO RICMSMGICMS SUSPENSO, NOS TERMOS DO ARTIGO 19, COMBINADO COM ANEXO III, ITEM 1 DO RICMSMGSUSPENSAO DO IPI CONF. ARTIGO 43, INCISO VI DO RIPI10RMA RS5207 105911PRODUTO IMPORTADO, ARMAZENAR EM LUGAR SECO, COBERTO E AREJADOMERCADORIA SADA DO PORTO DE VILA VELHA-ESPEDIDO 92521DATA DE FABRICACAO 12072021 DATA DE VALIDADE 12072023DI 211167114-1, DATA DA DI 18062021, NAVIO BERGE BEN NEVIS, NR. IMP 0000925I21NR NF MAE 1995, DATA NF MAE 30062021, PEDIDO 92521, TIQUETE 21006261', 2010);

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
(41, '1000005877', 2, 'YARAMILA 19 04 19 1MG', 'YARAMILA', 31052000, 5901, 'TO', 30.42, 1937.14, 58927.8);

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
(1, 'ícaro', 'Felipe de Lanes', 15766723792);

-- --------------------------------------------------------

--
-- Estrutura da tabela `placas`
--

CREATE TABLE `placas` (
  `id` int(11) NOT NULL,
  `placa` varchar(15) NOT NULL,
  `tipo` int(11) NOT NULL COMMENT 'tipo_placa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Índices para tabela `lançamentos`
--
ALTER TABLE `lançamentos`
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
-- Índices para tabela `tipo_doc`
--
ALTER TABLE `tipo_doc`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `lançamentos`
--
ALTER TABLE `lançamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `nf_ident`
--
ALTER TABLE `nf_ident`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `nf_itens`
--
ALTER TABLE `nf_itens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `placas`
--
ALTER TABLE `placas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_doc`
--
ALTER TABLE `tipo_doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
