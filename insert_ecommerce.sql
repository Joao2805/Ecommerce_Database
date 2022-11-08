-- inserção de dados e queries

use ecommerce;

-- idClient, Fname, Minit, Lname, CPF, Adress
insert into client (Fname, Minit, Lname, CPF, Adress)
			values ('Maria', 'M', 'Silva', '123456789', 'Rua Silva de Prata 29, Carangola - Cidade das Flores'),
				   ('Matheus', 'O', 'Pimentel', '987654321', 'Rua Alemeda 289, Centro - Cidade das Flores'),
                   ('Ricardo', 'F', 'Silva', '45678913', 'Avenida Alemeda Vinha 1009, Centro - Cidade das Flores'),
                   ('Julia', 'S', 'França', '789123456', 'Rua Lareijras 861, Centro - Cidade das Flores'),
                   ('Roberta', 'G', 'Assis', '987456321', 'Avenida Koller 19, Centro - Cidade das Flores'),
                   ('Isabel', 'M', 'Cruz', '6547899123', 'Rua Alemeda das Flores 28, Centro - Cidade das Flores');
                   

                   
insert into product (Pname, classification_kids, category, avaliacao, size)
			values ('Fone de Ouvido', false, 'Eletrônico', '4', null),
				   ('Barbie Elsa', true, 'Brinquedos', '3', null),
                   ('Body Carters', true, 'Vestimenta', '5', null),
                   ('Microfone Vedo - Youtuber', false, 'Eletrônico', '4', null),
                   ('Sofa Retratil', false, 'Moveis', '3', '3x57x80'),
                   ('Farinha de Arroz', false, 'Alimentos', '2', null),
                   ('Fire Stick Amazon', false, 'Eletrônico', '3', null);
                   
                   
insert into orders (IdOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
			values (1, default, 'Compra via Aplicativo', null, 1),
				   (2, default, 'Compra via Aplicativo', 50, 0),
                   (3, 'Confirmado', null, null, 1),
                   (4, default, 'Compra via WebSite', 150, 0);

select * from orders;
                   
insert into ProductOrder (idPOproduct, idPOorder, poQuantity, poStatus)
			values (1, 1, 2, null),
				   (2, 2, 1, null),
                   (3, 3, 1, null);
                   
insert into productStorage (StorageLocation, quantity)
			values ('Rio de Janeiro', 1000),
				   ('Rio de Janeiro', 500),
                   ('São Paulo', 10),
                   ('São Paulo', 100),
                   ('São Paulo', 10),
                   ('Brasilia', 60);
                   
insert into storageLocation (idLproduct, idLstorage, Location)
			values (1, 2, 'RJ'),
				   (2,6, 'GO');
                   
insert into supplier (SocialName, CNPJ, contact)
			values ('Almeida e Filhos', 123456789123456, '21985474'),
				   ('Eletrônicos Silva', 85419649143457, '21985484'),
                   ('Eletrônicos Valma', 934567893934695, '21975474');
                   

insert into productSupplier (idPsSupplier, idPsProduct, quantity)
			values (1, 1, 500),
				   (1, 2, 400),
                   (2, 4, 633),
                   (3, 3, 5),
				   (2, 5, 10);
                   
                   
insert into seller (SocialName, AbsName, CNPJ, CPF, location, contact)
			values ('Tech Eletronics', null, 123456789123456, null, 'Rio de Janeiro', 219946287),
				   ('Botique Durgas', null, null, 123456783,  'Rio de Janeiro', 219567895),
                   ('Kids World', null, 456789123654485, null, 'São Paulo', 1198657484);                   
                   
                   
insert into productSeller (idPseller, idPProduct, prodQuantity)
			values (1, 6, 80),
				   (2, 7, 10);

                   
