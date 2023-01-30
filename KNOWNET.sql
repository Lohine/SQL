-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3312
-- Tempo de geração: 23-Nov-2022 às 22:46
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

CREATE DATABASE kn_db;
USE kn_db;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `kn_db`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `conteudos`
--

CREATE TABLE `conteudos` (
  `id` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `materia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `conteudos`
--

INSERT INTO `conteudos` (`id`, `nome`, `materia`) VALUES
(21, 'Segunda Guerra Mundial', 23);

-- --------------------------------------------------------

--
-- Estrutura da tabela `materias`
--

CREATE TABLE `materias` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `materias`
--

INSERT INTO `materias` (`id`, `nome`) VALUES
(23, 'História ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `publicacoes`
--

CREATE TABLE `publicacoes` (
  `id` int(11) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `resumo` longtext NOT NULL,
  `artigo` longtext NOT NULL,
  `conteudo` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `datahora_publicacao` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `publicacoes`
--

INSERT INTO `publicacoes` (`id`, `titulo`, `descricao`, `resumo`, `artigo`, `conteudo`, `usuario`, `datahora_publicacao`) VALUES
(39, 'Segunda Guerra Mundial PT.1', 'Artigo feito baseado no livro Segunda Guerra Mundial e Seus Impactos.\r\nAntonio Suares 11-04-1987. ', 'A Segunda Guerra Mundial foi um conflito militar global que durou de 1939 a 1945, envolvendo a maioria das nações do mundo — incluindo todas as grandes potências — organizadas em duas alianças militares opostas: os Aliados e o Eixo. Foi a guerra mais abrangente da história, com mais de 100 milhões de militares mobilizados. Em estado de \"guerra total\", os principais envolvidos dedicaram toda sua capacidade econômica, industrial e científica a serviço dos esforços de guerra, deixando de lado a distinção entre recursos civis e militares. Marcado por um número significante de ataques contra civis, incluindo o Holocausto e a única vez em que armas nucleares foram utilizadas em combate, foi o conflito mais letal da história da humanidade, resultando entre 50 a mais de 70 milhões de mortes.', 'A guerra terminou com a vitória dos Aliados em 1945, alterando significativamente o alinhamento político e a estrutura social mundial. Enquanto a Organização das Nações Unidas (ONU) era estabelecida para estimular a cooperação global e evitar futuros conflitos, a União Soviética e os Estados Unidos emergiam como superpotências rivais, preparando o terreno para uma Guerra Fria que se estenderia pelos próximos quarenta e seis anos (1945-1991). Nesse ínterim, a aceitação do princípio de autodeterminação acelerou movimentos de descolonização na Ásia e na África, enquanto a Europa ocidental dava início a um movimento de recuperação econômica e integração política.', 21, 4, '2022-11-23 18:23:55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `data_nascimento` date NOT NULL,
  `tipo_user` int(1) NOT NULL,
  `biografia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `nome`, `email`, `senha`, `data_nascimento`, `tipo_user`, `biografia`) VALUES
(1, 'admin@knownet.com', 'Administrador', 'senha123', '2004-04-10', 1, NULL),
(2, 'Admin', 'admin', '1', '2004-04-10', 1, NULL),
(4, 'Sidnei Henrique Reis dos Santos', 'sidnei@gmail.com', 'sidnei123', '2004-04-02', 4, 'Aluno de engenharia de software na pucpr'),
(5, 'Thales Yahya', 'thales@gmail.com', '1', '2003-05-13', 4, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `conteudos`
--
ALTER TABLE `conteudos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materia` (`materia`);

--
-- Índices para tabela `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `publicacoes`
--
ALTER TABLE `publicacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conteudo` (`conteudo`),
  ADD KEY `usuario` (`usuario`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `conteudos`
--
ALTER TABLE `conteudos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `materias`
--
ALTER TABLE `materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `publicacoes`
--
ALTER TABLE `publicacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `conteudos`
--
ALTER TABLE `conteudos`
  ADD CONSTRAINT `conteudos_ibfk_1` FOREIGN KEY (`materia`) REFERENCES `materias` (`id`);

--
-- Limitadores para a tabela `publicacoes`
--
ALTER TABLE `publicacoes`
  ADD CONSTRAINT `publicacoes_ibfk_1` FOREIGN KEY (`conteudo`) REFERENCES `conteudos` (`id`),
  ADD CONSTRAINT `publicacoes_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
