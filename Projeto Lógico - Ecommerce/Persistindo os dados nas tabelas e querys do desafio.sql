-- inserção dos dados nas tabelas - Projeto Ecommerce

use ecommerce_refinado;

-- show tables;
-- select * from cliente;
-- persistindo os dados na tabela cliente
INSERT INTO cliente (pnome, nomedomeio, sobrenome, cpf, endereco, datanascimento)
VALUES
    ('Maria', 'M', 'Silva', '12346789', 'rua silva de prata 29, Carangola - Cidade das Flores','1978-10-10'),
    ('Matheus', 'O', 'Pimentel', '987654321', 'rua alameda 289, Centro - Cidade das Flores','1960-05-5'),
    ('Ricardo', 'F', 'Silva', '45678913', 'avenida alameda vinha 1099, Centro - Cidade das Flores','1988-02-25'),
    ('Julia', 'S', 'Franca', '789123456', 'rua laranjeiras 861, Centro - Cidade das Flores','1965-03-14'),
    ('Roberta', 'G', 'Assis', '96745631', 'avenida koller 19, Centro - Cidade das Flores','2000-07-25'),
    ('Isabela', 'M', 'Cruz', '654783123', 'rua alameda das flores 28, Centro - Cidade das Flores','2010-01-01');
    
      -- select * from produto;
    -- persinstindo os dados na tablea produto
    INSERT INTO produto (pname, categoria, descricao, valor)
VALUES
    ('Fone de ouvido','Eletrônico','Par de fone',10.00),
    ('Barbie Elsa','Brinquedos','Boneca',35.50),
    ('Body Carters', 'Vestimenta', 'Roupa', 55.00),
    ('Microfone Vlog' , 'Youtuber', 'Microfone', 15.00),
    ('Sofá retrátil',  'Móveis', 'Sofá com 2 lugares', 200.00);
   
    
    -- select * from pedido;
   -- persistindo os dados na tabela pedido
       INSERT INTO pedido (cliente_idCliente, statuspedido, descricao, frete)
VALUES
    (1, 'Processando', 'compra via aplicativo', 30),
    (2, 'Enviado', 'compra via aplicativo', 50),
    (3, 'Enviado', 'compra via web site', 60),
    (4, 'Enviado', 'compra via web site', 150),
     (5, 'Enviado', 'compra via web site', 300),
    (6, 'Enviado', 'compra via web site', 400);

-- select * from produtoPedido;
-- persistindos os dados na tabela produtopedido
INSERT INTO produtoPedido (produto_idProduto, pedido_idPedido, quantidade, statuss)
VALUES
    (1, 1, 2, 'Disponível'),
    (2, 1, 1, 'Disponível'),
    (3, 2, 1, 'Disponível');
   
  --  select * from produtoEstoque;
    -- persistindo os dados na tabela Produto em Estoque
    INSERT INTO produtoEstoque (produto_idProduto,estoque_idestoque,quantidade) VALUES
(1,2,1000),
(3,1,50),
(2,2,200),
(1,3,1500),
(4,1,30);

-- select * from produto;
-- select * from estoque;
-- select * from Estoque;
-- persistindo os dados na tabela Estoque
    INSERT INTO Estoque ( idestoque,locals) VALUES
		(1,'Rio de Janeiro'),
        (2,'São Paulo'),
        (3,'Minas Gerais'),
        (4,'Alagoas'),
        (5,'Tocantins');
 
-- select * from fornecedor;
 -- Persistindo os dados na tabela Fornecedor
INSERT INTO fornecedor (idFornecedor, razaoSocial, cnpj) VALUES
(1,'Silva & Silva LTDA', '12345678/0001-00'),
(2,'Construtora Arga', '12345679/0001-00'),
(3,'Agil Tecnologia', '1234566/0001-00');

-- select * from terceirovendedor;
 -- Persistindo os dados na tabela terceirovendedor
INSERT INTO terceirovendedor (idTerceirovendedor, razaoSocial, locals, nomeFantasia, cnpj, cpf) VALUES
(1,'Silva & Silva LTDA','São Bernardo do Campo-SP', 'Silva', '12345678/0001-00', '00010010010'),
(2,'Construtora Arga','Resende-RJ', 'Arga', '12345679/0001-00', '000100101-10'),
(3,'Agil Tecnologia','Maringá-PR', 'Agil', '1234566/0001-00', '000100102-10');

-- select * from produtosporvendedor;
 -- Persistindo os dados na tabela produtosporvendedor
INSERT INTO produtosporvendedor (terceiroVendedor_idTerceiro, produto_idProduto, quantidade) VALUES
(1,1,1),
(2,1,1),
(3,1,1);

-- select * from pagamento;
 -- Persistindo os dados na tabela pagamento
INSERT INTO pagamento (idPagamento, pedido_idPedido, pedido_cliente_idCliente, valor, nomecartao, statuspagamento, datapagamento, datavalidade) VALUES
(1,1,1,1000.00, 'Ronaldo Silva', 'Pago', '2024-10-11','2024-10-15'),
(2,2,2,250.00, 'Sabrina Correia da Silva', 'Pago', '2024-09-19','2024-10-01'),
(3,3,3,5000.00, 'João Silva', 'Pago', '2024-05-05','2024-05-10');

-- select * from metodopagamento;
 -- Persistindo os dados na tabela metodopagamento
INSERT INTO metodopagamento (idMetodoPagamento, pagamento_idPagamento, pagamento_Pedido_idPedido, pagamento_Pedido_Cliente_idCliente, pix, cartaocredito, boleto) VALUES
(1,1,1,1,'Pix','Não','Não'),
(2,2,2,2,'Pix','Não','Não'),
(3,3,3,3,'Pix','Não','Não');

-- select * from entrega;
 -- Persistindo os dados na tabela entrega
INSERT INTO entrega (idEntrega, pedido_idPedido, pedido_Cliente_idCliente, statuss, codrastreio, enderecoentrega, dataprevista, dataentrega) VALUES
(1,1,1,'Entregue', 'BR123456789', 'Rua Comarca de guimarães,100, São Paulo-SP','2024-10-10','2024-10-09'),
(2,2,2,'Entregue', 'BR123456790', 'Rua Guimarães Costa,50, São Paulo-SP','2024-11-01','2024-10-28'),
(3,3,3,'Entregue', 'BR123456791', 'Rua Dos Vianas,25, São Paulo-SP','2024-11-15','2024-11-10');


-- select * from disponibilizandoProduto;
 -- Persistindo os dados na tabela disponibilizandoProduto
INSERT INTO disponibilizandoProduto (fornecedor_idFornecedor, produto_idProduto) VALUES
(1,1),
(2,2),
(3,3);

-- select * from clientePj;
 -- Persistindo os dados na tabela clientePj
INSERT INTO clientePj (idClientPj, cliente_idCliente, cnpj, nomeFantasia) VALUES
(1,1,'12345678/0001-00','Silva'),
(2,2,'12345679/0001-00','Arga'),
(3,3,'12345680/0001-00','Agil');

-- select * from clientePf;
 -- Persistindo os dados na tabela clientePf
INSERT INTO clientePf (idClientPf, cliente_idCliente, cpf, dataNascimento) VALUES
(1,1,'123456789','1977-10-05'),
(2,2,'123456788','1980-05-01'),
(3,3,'123456777','1988-01-01');



-- Recupera o número de clientes
select count(*) from cliente;

-- Recupera os dados dos clientes e os pedidos com todas as colunas das tabelas.
select * from cliente c, pedido p where c.idCliente = p.cliente_idCliente;

-- Recupera os dados dos clientes fazendo uma junção do nome e sobrenome e mostra o status dos pedidos.
select concat(pnome,' ',sobrenome) as Nome_Completo, idPedido as Pedido, statuspedido as Status  from cliente c, pedido p where c.idCliente = p.cliente_idCliente;
                           
-- Recuperar quantos pedidos foram realizados por cada cliente?
select c.idCliente, pnome,sobrenome, count(*) as Numero_de_pedido from cliente c 
						inner join pedido p  on c.idCliente = p.idPedido
							group by c.idCliente;
                            
-- Recupera quantos pedidos foram realizados por cada cliente, mas que tenham frete com valor acima de 50.                            
select c.idCliente, concat(pnome, ' ', sobrenome) as Nome_Completo, frete, count(*) as Numero_de_pedido  from cliente c
								inner join pedido p on c.idCliente = p.idPedido
                                group by c.idCliente
                                having frete > 50;
                                
                                
                            
				






  