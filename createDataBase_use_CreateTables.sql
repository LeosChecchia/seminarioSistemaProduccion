-- crear nuestra base de datos
create database bd_sistema_produccion;
-- usamos la base de datos
use bd_sistema_produccion;

-- Crear la tabla Cliente
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    telefono VARCHAR(15),
    PRIMARY KEY (id_cliente)
);

-- Crear la tabla Material
CREATE TABLE Material (
    id_material INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    cantidad INT,
    descripcion VARCHAR(255),
    PRIMARY KEY (id_material)
);

-- Crear la tabla Ubicacion_Almacen
CREATE TABLE Ubicacion_Almacen (
    id_ubicacion INT AUTO_INCREMENT,
    pasillo VARCHAR(50),
    estanteria VARCHAR(50),
    nivel VARCHAR(50),
    PRIMARY KEY (id_ubicacion)
);

-- Crear la tabla Estado_Pedido
CREATE TABLE Estado_Pedido (
    id_estado INT AUTO_INCREMENT,
    estadoActual VARCHAR(100),
    PRIMARY KEY (id_estado)
);

-- Crear la tabla Zona_Produccion
CREATE TABLE Zona_Produccion (
    id_zona_produccion INT AUTO_INCREMENT,
    nombreZona VARCHAR(100),
    capacidadProduccion INT,
    PRIMARY KEY (id_zona_produccion)
);

-- Crear la tabla Zona_Expedicion
CREATE TABLE Zona_Expedicion (
    id_zona_expedicion INT AUTO_INCREMENT,
    nombreZona VARCHAR(100),
    capacidadExpedicion INT,
    PRIMARY KEY (id_zona_expedicion)
);

-- Crear la tabla Pedido
CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT,
    id_cliente INT,
    id_estado INT,
    id_ubicacion INT,
    id_zona_produccion INT,
    id_zona_expedicion INT,
    fecha_pedido DATE,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_estado) REFERENCES Estado_Pedido(id_estado),
    FOREIGN KEY (id_ubicacion) REFERENCES Ubicacion_Almacen(id_ubicacion),
    FOREIGN KEY (id_zona_produccion) REFERENCES Zona_Produccion(id_zona_produccion),
    FOREIGN KEY (id_zona_expedicion) REFERENCES Zona_Expedicion(id_zona_expedicion)
);

-- Crear la tabla que relaciona Pedido con Material (relación muchos a muchos)
CREATE TABLE Pedido_Material (
    id_pedido INT,
    id_material INT,
    cantidad INT,
    PRIMARY KEY (id_pedido, id_material),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_material) REFERENCES Material(id_material)
);
