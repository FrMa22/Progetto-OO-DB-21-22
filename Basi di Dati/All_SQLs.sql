create table Rubrica(
Utente_ID varchar(30) NOT NULL,
PRIMARY KEY(Utente_ID) );

create table Gruppo(
Gruppo_ID serial ,
Nome varchar(20) NOT NULL,
Rubrica_FK varchar(30) NOT NULL,
PRIMARY KEY(Gruppo_ID),
FOREIGN KEY(Rubrica_FK) references Rubrica(Utente_ID)
 );

create table Contatto(
Contatto_ID serial NOT NULL,
Nome varchar(20) NOT NULL,
SecondoNome varchar(20),
Cognome varchar(20) NOT NULL,
Foto varchar(20),
Rubrica_FK varchar(20) NOT NULL,
PRIMARY KEY(Contatto_ID),
FOREIGN KEY(Rubrica_FK) references Rubrica(Utente_ID)
);

create table Account(
Account_ID serial NOT NULL,
Fornitore varchar(20) NOT NULL,
IndirizzoEmail varchar(256) NOT NULL UNIQUE CHECK ( IndirizzoEmail LIKE '_%@_%.__%'),
FraseStato varchar(256),
Nickname varchar(30),
PRIMARY KEY(Account_ID)
); 

create table Email(
Email_ID serial NOT NULL,
IndirizzoEmail varchar(256) NOT NULL UNIQUE CHECK (IndirizzoEmail LIKE '_%@_%.__%'),
Descrizione varchar(30),
Contatto_ID serial NOT NULL,
PRIMARY KEY(Email_ID),
FOREIGN KEY(Contatto_ID) references Contatto(Contatto_ID)
);

create table Indirizzo(
Indirizzo_ID serial NOT NULL,
Via varchar(20) NOT NULL,
Città varchar(30),
Nazione varchar(30) NOT NULL,
CAP integer NOT NULL,
Descrizione varchar(20) NOT NULL,
Contatto_ID serial NOT NULL,
PRIMARY KEY(Indirizzo_ID),
FOREIGN KEY(Contatto_ID) references Contatto(Contatto_ID)
);

create table Telefono (
Telefono_ID serial NOT NULL,
Numero integer NOT NULL,
Descrizione varchar(20),
Contatto_ID serial NOT NULL,
PRIMARY KEY(Telefono_ID),
FOREIGN KEY(Contatto_ID) references Contatto(Contatto_ID) );

create table Associa (
Contatto_ID serial NOT NULL,
Account_ID serial NOT NULL,
FOREIGN KEY(Contatto_ID) references Contatto(Contatto_ID),
FOREIGN KEY(Account_ID) references Account(Account_ID) );

create table RecapitoEmail(
Contatto_ID serial NOT NULL,
Email_ID serial NOT NULL,
FOREIGN KEY(Contatto_ID) references Contatto(Contatto_ID),
FOREIGN KEY(Email_ID) references Email(Email_ID) );

create table RecapitoIndirizzo(
Contatto_ID serial NOT NULL,
Indirizzo_ID serial NOT NULL,
FOREIGN KEY(Contatto_ID) references Contatto(Contatto_ID),
FOREIGN KEY(Indirizzo_ID) references Indirizzo(Indirizzo_ID) );

create table RecapitoTelefono(
Contatto_ID serial NOT NULL,
Telefono_ID serial NOT NULL,
FOREIGN KEY(Contatto_ID) references Contatto(Contatto_ID),
FOREIGN KEY(Telefono_ID) references Telefono(Telefono_ID) );

create table Composizione(
Contatto_ID serial NOT NULL,
Gruppo_ID serial  NOT NULL,
FOREIGN KEY(Contatto_ID) references Contatto(Contatto_ID),
FOREIGN KEY(Gruppo_ID) references Gruppo(Gruppo_ID) );