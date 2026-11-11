CREATE DATABASE farmacia_seg;
USE farmacia_seg;
-- Produtos: todos os funcionários podem ver
CREATE TABLE produto (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
preco DECIMAL(7,2) NOT NULL,
estoque INT NOT NULL
);
-- Funcionários: tem salário, é dado sensível
CREATE TABLE funcionario (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
cargo VARCHAR(30) NOT NULL,
salario DECIMAL(8,2) NOT NULL
);
INSERT INTO produto (nome, preco, estoque) VALUES
  ('Dipirona 500mg', 12.90, 40),
  ('Protetor solar FPS 50', 59.90, 15),
  ('Vitamina C', 24.50, 30),
  ('Álcool em gel', 9.90, 60),
  ('Termômetro digital', 34.00, 8);
 
INSERT INTO funcionario (nome, cargo, salario) VALUES
  ('Renata Lopes', 'Gerente', 6200.00),
  ('Caio Mendes', 'Atendente', 2300.00),
  ('Paula Reis', 'Farmacêutica', 5100.00);
  
  -- Verificação de quem está conectado neste servidor
  SELECT user, host FROM mysql.user;
  
  -- Quem sou eu ?
  SELECT current_user();
  
  -- Vamos criar o acesso do atendente Luiz
  CREATE USER 'atendente'@'localhost'
  IDENTIFIED BY 'Atend@2026';
  
  -- O que o Luiz consegue fazer?
  SHOW GRANTS FOR 'atendente'@'localhost';
  
  -- Vamos adicionar algumas permissões para o Luiz?
 GRANT SELECT ON farmacia_seg.produto
 TO 'atendente'@'localhost';
 
 -- Criar o acesso do Gerente Davi Cerimonial
 CREATE USER 'gerente'@'localhost'
 IDENTIFIED BY 'Geren@2026';
 
 -- O que o Davi tem de permissão
 GRANT SELECT, INSERT, UPDATE ON farmacia_seg.*
 TO 'gerente'@'localhost';
 
 -- Verificar as permissões
 SHOW GRANTS FOR 'gerente'@'localhost';
 
 -- Tirar uma permissão
 REVOKE UPDATE ON farmacia_seg.*
 FROM 'gerente'@'localhost';
 
 -- Trocvar a senha
 ALTER USER 'gerente'@'localhost'
 identified BY 'Nova@Senha26';
 
 -- Bloquear sem apagar
 ALTER USER  'atendente'@'localhost' ACCOUNT LOCK;
 
 -- Voltou
 ALTER USER 'atendente'@'localhost' ACCOUNT UNLOCK;
 
 -- Apagar USUARIO DAVI
 DROP USER 'gerente'@'localhost';
 
 
 
  
  
  
