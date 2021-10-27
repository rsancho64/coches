-- -------------------------------------------------------
-- coches.sql
-- by RSA. sept. 2021
-- -------------------------------------------------------
DROP database IF EXISTS coches;
CREATE database coches;
USE coches; 
show tables;

-- -------------------------------------------------------
DROP TABLE IF EXISTS cliente;
CREATE TABLE cliente (
    DNI      MEDIUMINT   not null AUTO_INCREMENT primary key,
    nombre   varchar(25) not null,
    apellido varchar(25) not null
);

-- -------------------------------------------------------
DROP TABLE IF EXISTS vehiculo;
CREATE TABLE vehiculo (
    bastidor MEDIUMINT   not null AUTO_INCREMENT primary key,    
    modelo   varchar(25) not null,
    anio     varchar(25) not null,
    color    varchar(25) not null
);

-- -------------------------------------------------------
DROP TABLE IF EXISTS venta;
CREATE TABLE venta (
    DNI      MEDIUMINT not null,
    bastidor MEDIUMINT not null,
    fecha    date      not null,
    PRIMARY KEY (DNI, bastidor, fecha),
    FOREIGN KEY (DNI)
        REFERENCES cliente(DNI)  -- una referencia F K tiene direccion: del hijo -> al padre
        -- ON DELETE CASCADE     -- vs SET NULL
        ,
    FOREIGN KEY (bastidor) 
        REFERENCES vehiculo(bastidor)
        -- ON DELETE SET NULL       -- vs CASCADE
);

-- ----------------------------------------------------------------
insert into cliente( nombre, apellido ) values
("marta", "sanchez"),
("maria", "de la O"),
("laura", "martinez"),
("andrea","jimenez");

insert into cliente( dni, nombre, apellido ) values
(100, "laura", "martinez"),
(666, "luz", "y fer");

-- ----------------------------------------------------------------
insert into vehiculo( modelo, anio, color ) values
("chevrolet camaro", 1999, "rojo"),
("ford torino",      1982, "rojo coral"),
("ford mustang",     2009, "rojo"),
("ford fiesta",      2005, "gris marengo"),
("ford fiesta",      2006, "blanco nacar"),
("audi a7",          2005, "verde pistacho"),
("audi a7",          2015, "blanco");

insert into vehiculo( bastidor, modelo, anio, color ) values
(666,  "lamborghini diablo", 2005, "rojo rubi"),
(2357, "ford focus",         2005, "azul le mans");

-- -----------------------------------------------------------------------------
insert into venta( bastidor, DNI, fecha ) values
(1, 1, "2005-9-15"),
(2, 1, "2004-5-12"),
(3, 2, "2000-2-1"),
(1, 1, "2009-4-12");

-- FK demo ---------------------------------------------------------------------
insert into venta( bastidor, DNI, fecha ) values
-- (444, 666, "2004-5-12"); -- error: Cannot add/update a child row (parent bastidor 444 not exists)
(1, 666, "2004-5-12");       -- ok: bastidor 1 exists (FK constraint not fails)

delete from venta where DNI = 666;    -- no problem
-- delete from cliente where DNI = 1; -- error: Cannot delete/update a parent row: a FK constraint fails

select * from cliente;
select * from vehiculo;
select * from venta;



