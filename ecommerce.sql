-- criação do banco de dados para o cenário de E-comerce

create database ecommerce;

use ecommerce;

-- alter table client modify column Adress varchar(255);

-- desc client;
-- criar tabela cliente
CREATE TABLE client(
	idCliente int auto_increment primary key,
    Fname varchar(10),
	Minit char(3),
    Lname varchar(10),
    CPF char(11) not null,
    Adress varchar(30),
    constraint unique_cpf_client unique (CPF)
);

alter table client auto_increment=1;

-- desc client;



-- alter table product change avalicao avaliacao float default 0;
-- alter table product modify column Pname varchar(30);

-- criar tabela produto
CREATE TABLE Product(
	idProduct int auto_increment primary key,
    Pname varchar(10) not null,
	classification_kids bool default false,
    category enum('Eletronico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Moveis') not null,
    avalicao float default 0,
    Size varchar(10)
);


-- desc product;

-- criar tabela pagamento
CREATE TABLE payment (
    idPayment INT,
    idClient INT,
    TypePayment ENUM('Boleto', 'Cartao', 'Dois cartões') NOT NULL,
    limitAvailale FLOAT,
    PRIMARY KEY (idPayment , idClient)
);



-- criar tabela pedidos
CREATE TABLE Orders(
	idOrders int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') not null,
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash boolean default false,
	constraint fk_orders_client foreign key (idOrderClient) references client(idCliente) 
			on update cascade
);

-- criar tabela estoque
CREATE TABLE ProductStorage(
	idProductStorage int auto_increment primary key,
    StorageLocation varchar(255),
    quantity int default 0
);

-- criar tabela fornecedor
CREATE TABLE supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

-- desc supplier;

-- criar tabela vendedor
CREATE TABLE seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbsName varchar(255),
    CNPJ char(15),
    CPF char(9),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

-- criar tabela vendedor
CREATE TABLE productSeller(
	idPseller int,
	idPproduct int,
    prodQuantity int default 1,
    primary key(idPseller, idPproduct),
    constraint fk_product_seller foreign key(idPseller) references seller(idSeller),
    constraint fk_product_product foreign key(idPproduct) references product(idProduct)  
);


CREATE TABLE productOrder(
	idPOproduct int,
	idPOorder int auto_increment,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key(idPOproduct, idPOorder),
    constraint fk_productorder_seller foreign key(idPOproduct) references product(idProduct),
    constraint fk_productorder_product foreign key(idPOorder) references Orders(idOrders)  
);

CREATE TABLE StorageLocation(
	idLproduct int,
	idLstorage int,
    location varchar(255),
    primary key(idLproduct, idLstorage),
    constraint fk_storageLocation_product foreign key(idLproduct) references product(idProduct),
    constraint fk_storageLocation_storage foreign key(idLstorage) references productStorage(idProductStorage)  
);

CREATE TABLE productSupplier(
	idPsSupplier int,
	idPsProduct int,
    quantity int not null,
    primary key(idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key(idPsSupplier) references Supplier(idSupplier),
    constraint fk_product_supplier_product foreign key(idPsProduct) references product(idProduct)  
);

show tables

