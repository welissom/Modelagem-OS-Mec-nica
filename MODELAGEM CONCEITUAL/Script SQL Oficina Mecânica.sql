-- drop database oficina;

create database oficina;
use oficina;

-- criar tabela endereço
create table adress(
	idAdress int auto_increment primary key,
    road varchar(45),
    number varchar(4),
    complement varchar(20),
    district varchar(20),
    cep char(8)
);

-- criar table cliente
create table client(
	idClient int auto_increment primary key,    
    Fname varchar(10),
    Minit char(3),
    Lname varchar(30),
    CPF varchar(13),
    contato varchar(11),
    adress_idAdress int,
    
    constraint unique_cpf_client unique(CPF),
    constraint fk_client_adress foreign key(adress_idAdress) references adress(idAdress)
);

-- criar tabela mecânico
create table mechanical(
	idMechanical int auto_increment primary key,
    codMechanical char(5),
    Fname varchar(10),
    Minit char(3),
    Lname varchar(30),
    specialty varchar(45),
    adress_idAdress int,
    
    constraint fk_mechanical_adress foreign key(adress_idAdress) references adress(idAdress)
);

create table request(
	idRequest int auto_increment primary key,
    service varchar(80),
    description varchar(200),
    requestDate date,
    released enum('sim','não') default 'sim',
    client_idClient int,
    
    constraint	fk_request_client foreign key (client_idClient) references client(idClient)
);

create table order_of_service(
	idOrderService int auto_increment primary key,
    issueDate date,
    value float(10,2),
    statusService enum('Iniciado','Em conclusão','Concluído'),
    dateConclusion date,
    request_idRiquest int,
    
    constraint fk_orderOfService_request foreign key(request_idRiquest) references request(idrequest)
);

create table ask(
	idAsk int auto_increment primary key,
    name varchar(30),
    value float(10,2)
);

create table labor(
	idLabor int auto_increment primary key,
    name varchar(50),
    value float(10,2)
);

create table ask_has_order_Of_Service(
	ask_idAsk int,
    orderService_idOrderService int,
    
    primary key(ask_idAsk, orderService_idOrderService),
    constraint fk_ask_ask foreign key (ask_idAsk) references ask(idAsk),
    constraint fk_OrderOfService_OrderOfService foreign key(orderService_idOrderService) references order_of_service(idOrderService)
);

create table labor_has_order_of_service(
	labor_idLabor int,
    orderService_idOrderService int,
    
    primary key(labor_idLabor,orderService_idOrderService),
    constraint fk_labor_labor foreign key (labor_idLabor) references labor(idLabor),
    constraint fk_labor_OrderOfService foreign key(orderService_idOrderService) references order_of_service(idOrderService)
);

create table responsible_team(
	idRespTeam int auto_increment primary key,
    code char(5)
);

create table mechanical_has_responsibleTeam(
	mechanical_idMechanical int,
    respTeam_idTeam int,    
    
    primary key(respTeam_idTeam,mechanical_idMechanical),
    constraint fk_mechanical_mechanical foreign key(mechanical_idMechanical) references mechanical(idMechanical),    
    constraint fk_respTeam_responsibleTam foreign key(respTeam_idTeam) references responsible_team(idRespTeam)
);

create table responsible_team_request(
	request_idRequest int,
    respTeam_idTeam int,
    
    primary key(request_idRequest,respTeam_idTeam),
    constraint fk_respTeam_request foreign key (request_idRequest) references request(idRequest),
    constraint fk_request_responsibleTam foreign key(respTeam_idTeam) references responsible_team(idRespTeam)
);