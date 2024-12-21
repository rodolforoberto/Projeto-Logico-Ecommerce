-- criação de banco de dados par o cenário de E-commerce Refinado
create database ecommerce_refinado;

use ecommerce_refinado;

-- criar as tabela cliente
create table cliente(
	idCliente int auto_increment primary key,
	pnome varchar(15),
    nomedomeio varchar(10),
    sobrenome varchar(20),
    cpf varchar(14) not null, 
    constraint unique_cpf_client unique (cpf),
    endereco varchar(255),
    datanascimento date
	);
    
    alter table cliente auto_increment=1;
    
    
    -- Cria tabelas Cliente PJ
    create table clientePj(
	idClientPj int auto_increment primary key,
    cliente_idCliente int,
	cnpj varchar(18),
    nomeFantasia varchar(100),
	constraint unique_cnpj_client unique (cnpj),
    constraint fk_clientepj_cliente foreign key (cliente_idCliente) references cliente(idCliente)
    );
    
    alter table clientePj auto_increment=1;
    
     -- Cria tabelas Cliente PF
    create table clientePf(
	idClientPf int auto_increment primary key,
	cliente_idCliente int,
	cpf varchar(18),
    dataNascimento date,
	constraint unique_cpf_client unique (cpf),
	constraint fk_clientepf_cliente foreign key (cliente_idCliente) references cliente(idCliente)
    );
    alter table clientePf auto_increment=1;
    
    -- criar as tabela produto
create table produto(
	idProduto int auto_increment primary key,
    pname varchar(20) not null,
    categoria varchar(45) not null,
	descricao varchar(45),
	valor decimal(10,2)
	);
    alter table produto auto_increment=1;
    
     -- criar as tabela pedido
create table pedido(
	idPedido int auto_increment primary key,
    cliente_idCliente int,
	statuspedido enum("Em Andamento", "Processando", "Enviado", "Entregue") default "Processando",
    descricao varchar(45),
    frete float,
    constraint fk_pedido_cliente foreign key (cliente_idCliente) references cliente(idCliente)
	);
    alter table pedido auto_increment=1;
    
    -- criando tabela pagamento
    create table pagamento(
	idPagamento int auto_increment primary key,
    pedido_idPedido int,
    pedido_cliente_idCliente int,
    valor decimal(10,2),
    nomecartao varchar(100),
    statuspagamento varchar(45),
    datapagamento date,
    datavalidade date,
	constraint fk_pagamento_pedido foreign key (pedido_idPedido) references pedido(idPedido),
    constraint fk_pagamento_cliente foreign key (pedido_cliente_idCliente) references cliente(idCliente)
    );
    alter table pagamento auto_increment=1;
    
    -- criando tabela metodo de pagamento
    create table metodopagamento(
	idMetodoPagamento int auto_increment primary key,
    pagamento_idPagamento int,
    pagamento_Pedido_idPedido int,
    pagamento_Pedido_Cliente_idCliente int,
    pix varchar(45),
    cartaocredito varchar(45),
    boleto varchar (55), 
	constraint fk_metodopagamento_pagamento foreign key (pagamento_idPagamento) references pagamento(idPagamento),
    constraint fk_metodopagamento_pedido foreign key (pagamento_Pedido_idPedido) references pedido(idPedido),
    constraint fk_metodopagamento_cliente foreign key (pagamento_Pedido_cliente_idCliente) references cliente(idCliente)
	);
    alter table metodopagamento auto_increment=1;
    
   
    
     -- criar as tabela entrega
create table entrega(
	idEntrega int auto_increment primary key,
    pedido_idPedido int,
    pedido_Cliente_idCliente int,
	statuss varchar(45),
	codrastreio varchar(20),
    constraint unique_codrastreio_entrega unique (codrastreio),
    enderecoentrega varchar(255),
    dataprevista date,
    dataentrega date,
    constraint fk_entrega_pedido foreign key (pedido_idPedido) references pedido(idPedido),
    constraint fk_entrega_cliente foreign key (pedido_cliente_idCliente) references cliente(idCLiente)
	);
    alter table entrega auto_increment=1;
    
    -- criar tabelas estoque
    create table estoque(
    idestoque int auto_increment primary key,
    locals varchar(100) not null
    );
    alter table estoque auto_increment=1;
    
    -- criar tabela fornecedor
     create table fornecedor(
    idFornecedor int auto_increment primary key,
    razaoSocial varchar(100) not null,
    cnpj varchar(18) not null,
    constraint unique_estoque unique (cnpj)
    );
    
    alter table fornecedor auto_increment=1;
    
    -- criar tabela vendedor
	create table terceirovendedor(
    idTerceirovendedor int auto_increment primary key,
    razaoSocial varchar(100) not null,
    locals varchar(100),
    nomeFantasia varchar(100),
    cnpj varchar(20),
    cpf varchar(15),
    constraint unique_cnpj_terceiro_vendedor unique (cnpj),
    constraint unique_cpf_terceiro_vendedor unique (cpf)
    );
    
    alter table terceirovendedor auto_increment=1;
    
    -- criar tabela  produtos por vendedor
    create table produtosporvendedor(
    terceiroVendedor_idTerceiro int, 
    produto_idProduto int, 
    quantidade int default 1,
    primary key(terceiroVendedor_idTerceiro, produto_idProduto),
    constraint fk_produtosporvendedor_terceirovendedor foreign key (terceiroVendedor_idTerceiro) references terceirovendedor(idTerceirovendedor),
	constraint fk_produtosporvendedor_produto foreign key (produto_idProduto) references produto(idProduto)
    );
    
       
   
-- criar tabela relação produto/pedido
CREATE TABLE produtoPedido (
    produto_idProduto INT,
    pedido_idPedido INT,
    quantidade INT DEFAULT 1,
    statuss ENUM('Disponível', 'Fora de estoque') DEFAULT 'Disponível',
    PRIMARY KEY (produto_idProduto, pedido_idPedido),
    CONSTRAINT fk_produto_idproduto_pedido FOREIGN KEY (produto_idProduto) REFERENCES produto(idProduto),
    CONSTRAINT fk_produto_idpedido_pedido FOREIGN KEY (pedido_idPedido) REFERENCES pedido(idPedido)
);



-- criar tabela produto em estoque
CREATE TABLE produtoEstoque (
    produto_idProduto INT,
    estoque_idestoque INT,
    quantidade int NOT NULL,
    PRIMARY KEY (produto_idProduto, estoque_idestoque),
    CONSTRAINT fk_produto_idproduto_estoque FOREIGN KEY (produto_idProduto) REFERENCES produto(idProduto),
    CONSTRAINT fk_produto_idestoque_estoque FOREIGN KEY (estoque_idestoque) REFERENCES estoque(idestoque)
);

-- criar tabela disponibilizando produto
CREATE TABLE disponibilizandoProduto (
    fornecedor_idFornecedor INT,
    produto_idProduto INT,
    PRIMARY KEY (fornecedor_idFornecedor, produto_idProduto),
    CONSTRAINT fk_produto_idFornecedor_fornecedor FOREIGN KEY (fornecedor_idFornecedor) REFERENCES fornecedor(idFornecedor),
    CONSTRAINT fk_produto_idProduto_fornecedor FOREIGN KEY (produto_idProduto) REFERENCES produto(idProduto)
);


