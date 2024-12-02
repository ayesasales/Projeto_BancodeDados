
create table cliente (
   id_cliente integer not null,
   nome_cliente VARCHAR(100),
   email_cliente VARCHAR(100 ),
   endereco_cliente VARCHAR(100),
   telefone_cliente VARCHAR(20), 
   cpf_cliente CHAR (14),
   primary key (id_cliente)
);


create table produto (
    id_produto integer not null,
    nome_produto VARCHAR (100),
    marca_produto VARCHAR (100),
    tamanho_produto VARCHAR ,
    cor_produto VARCHAR (50),
    preco_produto VARCHAR (20),
    estoque_produto int,
    primary key(id_produto) 

);


create table fornecedor ( 
     id_fornecedor integer not null,
     nome_fornecedor VARCHAR(100),
     endereco_fornecedor VARCHAR(100),
     telefone_fornecedor VARCHAR(20),
     empresa_fornecedor VARCHAR(100),
    primary key(id_fornecedor)
    
);

create table venda (
   id_venda integer not null,
   data_venda date,
   cliente_id integer not null,
   total_venda varchar,
   primary key(id_venda),
   foreign key (cliente_id) references cliente (id_cliente)
   
 );


create table pagamento (
    id_pagamento integer not null,
    venda_id integer not null, 
    forma_pagamento varchar (100),
    valor_pago decimal(10,2),
    data_pagamento date,
    primary key(id_pagamento),
    foreign key (venda_id) references venda (id_venda)
    
);



create table item_venda (
    id_item integer not null,
    venda_id integer not null,
    produto_id integer not null,
    quantidade_item int,
    preco_item varchar (20),
    foreign key (venda_id) references venda (id_venda),
    foreign key (produto_id) references produto (id_produto)
   
);




insert into cliente (id_cliente ,nome_cliente,endereco_cliente,telefone_cliente,email_cliente,cpf_cliente) 
values
(34,'Ayesa Sales', 'Avenida 2  de julho,74', '(81)99333-5444', 'ayesasales@gmail.com','999.999.999-00');
insert into cliente (id_cliente ,nome_cliente,endereco_cliente,telefone_cliente,email_cliente,cpf_cliente)
values
(35, 'Patricia Dias', 'Rua primeiro de maio,25', '(81)99555-6565','patriciadias@gmail.com', '888.888.888-00');


insert into fornecedor (id_fornecedor,nome_fornecedor,endereco_fornecedor,empresa_fornecedor,telefone_fornecedor)
values
(333, 'Marcos Pereira','rua primeiro de janeiro, 22', 'Nike', '(83)99555-8165');
insert into fornecedor (id_fornecedor,nome_fornecedor,endereco_fornecedor,empresa_fornecedor,telefone_fornecedor)
values
(555,'Jose Marcio','rua das 3 marias', 'Adidas', '(22)99786-7777');


insert into produto (id_produto, nome_produto, tamanho_produto,cor_produto,preco_produto,estoque_produto,marca_produto)
values
(44, 'Nike Air', 35, 'branco', 'R$:300,00',5,'Nike');
insert into produto (id_produto, nome_produto, tamanho_produto,cor_produto,preco_produto,estoque_produto,marca_produto)
values
(55, 'Adidas Samba', 37, 'branco com marrom', 'R$:400,00',3,'Adidas');
 
insert into venda (id_venda,data_venda,id_cliente ,total_venda)
values
(455,'23/11/2024',34,'300,00')

insert into venda (id_venda,data_venda,id_cliente ,total_venda)
values
(456,'25/11/2024',35,'400,00')

insert into item_venda (id_item, venda_id, produto_id, quantidade_item, preco_item)
values
(4446,456,44,1,'300,00');
insert into item_venda (id_item, venda_id, produto_id, quantidade_item, preco_item)
values
(4445,456,55,1,'400,00');

insert into pagamento (id_pagamento,venda_id,forma_pagamento,valor_pago,data_pagamento)
values
(3535,456,'cartão de crédito', '400,00','25/11/2023');
insert into pagamento (id_pagamento,venda_id,forma_pagamento,valor_pago,data_pagamento)
values
(3536,455,'pix', '300,00','23/11/2024');


select 
  cliente.id_cliente,
  cliente.nome_cliente,
  cliente.endereco_cliente,
  cliente.email_cliente,
  cliente.telefone_cliente,
  cliente.cpf_cliente ,
  venda.id_venda,
  venda.data_venda,
  venda.total_venda
from 
  cliente 
join venda on cliente.id_cliente = venda.id_cliente; 


select 
    iv.id_item,
    iv.quantidade_item,
    p.nome_produto,
    iv.preco_item
from
    item_venda iv
join
    produto p on iv.produto_id = p.id_produto;
   
   
select 
    pagamento.id_pagamento,
    pagamento.valor_pago,
    pagamento.data_pagamento,
    venda.id_venda,
    venda.total_venda
from
    pagamento 
join
    venda on pagamento.venda_id = venda.id_venda;
   
   
SELECT 
    v.id_venda,
    c.nome_cliente,
    iv.quantidade_item,
    p.nome_produto,
    iv.preco_item,
    v.total_venda
FROM 
    venda v
JOIN 
    cliente c ON v.id_venda = c.id_cliente
JOIN 
    item_venda iv ON v.id_venda = iv.venda_id
JOIN 
    produto p ON iv.produto_id = p.id_produto;  
  

SELECT 
    fornecedor.id_fornecedor ,
    fornecedor.nome_fornecedor,
    fornecedor.empresa_fornecedor
FROM 
    fornecedor ;

  










