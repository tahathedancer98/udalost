use udalost;

insert into utilisateur (id,nom,prenom,email,motpasse,username) values ('3fe96bf8-8bb3-11eb-8dcd-0242ac130003','Ramirez Bello','Ricardo Ivan','ricardo@gmail.com','1234','');
insert into utilisateur (id,nom,prenom,email,motpasse,username) values ('3fe96e1e-8bb3-11eb-8dcd-0242ac130003','Pinon Serratos','Julieta Guadalupe','julie@gmail.com','2468','');
insert into utilisateur (id,nom,prenom,email,motpasse,username) values ('3fe970e4-8bb3-11eb-8dcd-0242ac130003','Winterstein','Antonin','antonin@gmail.com','3692','');
insert into utilisateur (id,nom,prenom,email,motpasse,username) values ('3fe971b6-8bb3-11eb-8dcd-0242ac130003','Toufik','Taha','taha@gmail.com','4812','');
insert into utilisateur (id,nom,prenom,email,motpasse,username) values ('3fe97274-8bb3-11eb-8dcd-0242ac130003','Soua','Yassine','yassine@gmail.com','5105','');
select * from utilisateur;

insert into evenement (id,titre,description,date,heure,latitude,longitude,adresse,codePostal,ville,pays,id_utilisateur) values ('fcd71a2e-8bb5-11eb-8dcd-0242ac130003','Party at a rich dude\'s house','Lorem ipsum dolor sit amet, consectetur adipiscing elit. ','2022-05-13','09:04:00',43.4764823,-1.5511295,'69 Avenue Voltaire',64200,'Biarritz','France','3fe96bf8-8bb3-11eb-8dcd-0242ac130003');
insert into evenement (id,titre,description,date,heure,latitude,longitude,adresse,codePostal,ville,pays,id_utilisateur) values ('fcd71c5e-8bb5-11eb-8dcd-0242ac130003','Fiesta de fin de cuarentena','Donec id dapibus risus.','2029-08-12','09:06:00',43.6265251,1.4436594,'82 Rue Marie-Claire de Catellan',31200,'Toulouse','France','3fe96e1e-8bb3-11eb-8dcd-0242ac130003');
insert into evenement (id,titre,description,date,heure,latitude,longitude,adresse,codePostal,ville,pays,id_utilisateur) values ('fcd71f4c-8bb5-11eb-8dcd-0242ac130003','Fiesta del fin del COVID','Aenean rutrum dui augue, non consequat massa dictum vel.','2029-09-14','20:48:00',50.6909398,3.175663,'91 Rue Pierre Motte',59100,'Roubaix','France','3fe970e4-8bb3-11eb-8dcd-0242ac130003');
insert into evenement (id,titre,description,date,heure,latitude,longitude,adresse,codePostal,ville,pays,id_utilisateur) values ('fcd7201e-8bb5-11eb-8dcd-0242ac130003','Soirée d\'anniversaire','Vestibulum tincidunt, arcu id consequat blandit, ante lacus congue massa, sit amet efficitur sapien augue nec arcu.','2025-10-11','19:34:00',45.9199284,6.7088776,'75 Avenue de Marlioz',74190,'Passy','France','3fe971b6-8bb3-11eb-8dcd-0242ac130003');
-- insert into evenement (id,titre,description,date,heure,latitude,longitude,adresse,codePostal,ville,pays,id_utilisateur) values ('fcd720e6-8bb5-11eb-8dcd-0242ac130003','For real','Phasellus interdum dolor nec ultrices finibus.','2022-02-06','21:22:00',48.8685118,2.322557,'5 Rue du Faubourg Saint-Honoré','75008','Paris','France','3fe97274-8bb3-11eb-8dcd-0242ac130003');
select * from evenement;


insert into participant (id_evenement,id_utilisateur,nom,message) values ('fcd71a2e-8bb5-11eb-8dcd-0242ac130003','3fe96e1e-8bb3-11eb-8dcd-0242ac130003',null,'Hola');
insert into participant (id_evenement,id_utilisateur,nom,message) values ('fcd71a2e-8bb5-11eb-8dcd-0242ac130003','3fe971b6-8bb3-11eb-8dcd-0242ac130003',null,'Hey, ça va ?');
insert into participant (id_evenement,id_utilisateur,nom,message) values ('fcd71a2e-8bb5-11eb-8dcd-0242ac130003',null,'Camille','J\'y vais !');
insert into participant (id_evenement,id_utilisateur,nom,message) values ('fcd71f4c-8bb5-11eb-8dcd-0242ac130003','3fe96bf8-8bb3-11eb-8dcd-0242ac130003',null,'Salut, ça va ?');
insert into participant (id_evenement,id_utilisateur,nom,message) values ('fcd71f4c-8bb5-11eb-8dcd-0242ac130003',null,'Evan','Slt');
insert into participant (id_evenement,id_utilisateur,nom,message) values ('fcd71f4c-8bb5-11eb-8dcd-0242ac130003','3fe96e1e-8bb3-11eb-8dcd-0242ac130003',null,'Ça va ?');
insert into participant (id_evenement,id_utilisateur,nom,message) values ('fcd71f4c-8bb5-11eb-8dcd-0242ac130003','3fe97274-8bb3-11eb-8dcd-0242ac130003',null,'Wesh !') ;
select * from participant;


