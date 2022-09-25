use oficina;

insert into adress(road, number, complement, district, cep)
	values ('Rua Fernando Abott', '604', 'casa A', 'Centro', '96810072'),
		   ('Travessa Padre Cícero', '494', null, 'São Bernardo', '65056140'),
           ('Largo do Triângulo', '886',null,'Triângulo','62056141'),
            ('Travessa Aquidabã','649','altos','Suíssa','49050820'),
            ('Alameda João Dias da Mota','563',null,'Jardim Inconfidência','38411244'),
            ('Rua 6-A','205',null,'Nova Fronteira','77420400'),
            ('Rua Chico Lira','748',null,'São Francisco','69305093'),
            ('Rua Abre Campo','269',null,'Anápolis','35300227'),
            ('Rua Benjamim Torres','197',null,'Dionisio Torres','60135230'),
            ('Quadra QR 108','183','Conjunto 3','Samambaia Sul','72302203');
           

insert into client(Fname, Minit, Lname, CPF, contato,adress_idAdress)
	values ('Rosa', 'B', 'Cunha', '24953522192', '51993321574',1),
		   ('Lúcia', 'A', 'Nogueira', '73518337106', '98987683636',2),
           ('Otávio', 'M', 'Peixoto', '94148692633', '71981170975',3),
           ('Regina', 'L', 'Moraes', '96413145480', '79988022642',4),
           ('Caio', 'D', 'Alves', '98836028551', '34983673132',5);
 
insert into mechanical(codMechanical,Fname,Minit,Lname,specialty,adress_idAdress)
	values ('AyB8p','Bryan','M','Lima','pintura',6),
		   ('hiSy','Lorena','J','Porto','cambagem',7),
           ('t0eLX','Calebe','L','Dias','Motor',8),
           ('AyB8p','Sophia','G','Santos','funilaria',9),
           ('anOkm','Pietro','R','Figueiredo','elétrica',10);
          
insert into request(service, description, requestDate, released, request_idRiquest)
	values ('pintura', 'serviço de pintura na lataria pra cobrir arranhão','2022-09-24','sim',1),
		   ('cambagem', 'serviço de cambagem para alinhamento do veículo','2022-05-10','sim',2),
           ('motor', 'manutenção no sistema de arrefecimento ','2022-02-14','não',3),
           ('funilaria', 'serviço de substituição da calota','2022-03-02','sim',4),
           ('elétrica', 'serviço de manutenção da parte elétrica','2022-04-06','não',5);
        
insert into order_of_service(issueDate, value, statusService, dateConclusion, request_idRiquest)
	values ('2022-09-02', '256.00','Em conclusão',null,2),
		   ('2022-05-01', '400.00','Iniciado',null,4),
           ('2022-02-03', '1240.00','Em conclusão',null,3),
           ('2022-02-10', '600.50','concluído','2022-03-01',5),
           ('2022-03-10', '300.00','Iniciado',null,1);
 

insert into ask(name, value)
	values('Tinta brilho Branca', '50.00'),
		  ('Junta Homocinética', '60.00'),
          ('Sensor Lambda', '100.00'),
          ('Kit Tasso', '150.00'),
          ('Chave Magnética', '300.00');
          
insert into labor(name, value)
	values('pintura', '300.00'),
		  ('troca de peças','30.00'),
          ('Troca de óleo', '30.00'),
          ('desamassamento', '120.00');

insert into ask_has_order_Of_Service (ask_idAsk, orderService_idOrderService)
	values(1,5),
		  (2,3),
          (3,4),
          (4,2),
          (5,4);
 
 /*
 select * from labor_has_order_of_service;
insert into labor_has_order_of_service (labor_idLabor, orderService_idOrderService)
	values(1,2);
		  -- (2,2),
          -- (3,3),
          -- (null,4),
          -- (1,5);
*/


insert into responsible_team(code)
	values('g3ANE'),
		  ('hfxiw'),
          ('JUMh7'),
          ('JUMh7'),
          ('RXB3u');
          
insert into mechanical_has_responsibleTeam(mechanical_idMechanical, respTeam_idTeam)
	values(1,1),
		  (2,2),
          (3,3),
          (4,4),
          (5,5);
          
insert into responsible_team_request (request_idRequest, respTeam_idTeam)
	values(1,1),
		  (2,2),
          (3,3),
          (4,4),
          (5,5);
 
select * from client;
select * from mechanical;
select * from request;
select * from ask;
select * from  order_of_service; 
select * from labor;
select * from responsible_team;
 
select count(*) from client;

select * from client c, request q where c.idClient = idRequest;

select concat(Fname,' ',Lname) as client, idRequest as request, service,  released as liberado
	from client c, request r
    where c.idClient = r.client_idClient;
    
select c.idclient, Fname, count(*) as Number_of_orders
	from client c
	inner join request r ON c.idClient = r.client_idClient
    group by idClient;