	CREATE TABLE Rol(
	idRol int IDENTITY(1,1) PRIMARY KEY,
	nombre varchar (50) not null,
	descripcion varchar (150) not null
	)

	CREATE TABLE Usuario(
	idUsuario int IDENTITY(1,1) PRIMARY KEY,
	nombre varchar (100) not null,
	email varchar (100) UNIQUE  not null,
	passwordHash varchar (255) not null,
	idRol int not null,
	activo BIT NOT NULL DEFAULT 1,
	CONSTRAINT FK_usuario_idRol 
	FOREIGN KEY (idRol) REFERENCES Rol (idRol)
	)

	CREATE TABLE Categoria(
	idCategoria int IDENTITY(1,1) PRIMARY KEY,
	nombre varchar (100) not null,
	descripcion varchar (200) not null
	)

	CREATE TABLE Producto(
	idProducto int IDENTITY(1,1) PRIMARY KEY,
	nombre varchar (150) not null,
	descripcion varchar (255) not null,
	precioCompra decimal (10,2) not null,
	precioVenta decimal (10,2) not null,
	stock int not null  CHECK (stock >= 0),
	idCategoria int not null,
	activo BIT NOT NULL DEFAULT 1,
	CONSTRAINT FK_producto_idCategoria
	FOREIGN KEY  (idCategoria) REFERENCES Categoria (idCategoria)
	)

	CREATE TABLE Proveedor(
	idProveedor int IDENTITY(1,1) PRIMARY KEY,
	nombre varchar (150) not null,
	telefono varchar (20) not null,
	email varchar (100) UNIQUE not null,
	direccion varchar (200) not null,
	activo BIT NOT NULL DEFAULT 1
	)

	CREATE TABLE  Cliente(
	idCliente int IDENTITY(1,1) PRIMARY KEY,
	nombre varchar (150) not null,
	apellido VARCHAR(100) not null,
	telefono varchar (20) not null,
	email varchar (100) UNIQUE not null,
	direccion varchar (200) null,
	activo bit not null DEFAULT 1
	)

	CREATE TABLE Compra(
	idCompra int IDENTITY(1,1) PRIMARY KEY,
	fecha datetime not null DEFAULT GETDATE(),
	idProveedor int not null,
	idUsuario int not null,
	total decimal(12,2) not null,
	CONSTRAINT FK_Compra_idProveedor
	FOREIGN KEY (idProveedor) REFERENCES Proveedor (idProveedor),
	CONSTRAINT FK_Compra_idUsuario
	FOREIGN KEY (idUsuario) REFERENCES Usuario (idUsuario)
	)

	CREATE TABLE DetalleCompra(
	idDetalleCompra int IDENTITY(1,1) PRIMARY KEY,
	idCompra int not null,
	idProducto int not null,
	cantidad int not null,
	precioUnitario decimal(10,2) not null,
	subtotal decimal(12,2) not null,
	CONSTRAINT FK_detalleCompra_IdCompra
	FOREIGN KEY (idCompra) REFERENCES Compra (idCompra),
	CONSTRAINT FK_detalleCompra_idProducto
	FOREIGN KEY (idProducto) REFERENCES Producto (idProducto)
	)

	CREATE TABLE Venta(
	idVenta int IDENTITY (1,1) PRIMARY KEY,
	fecha datetime not null DEFAULT GETDATE(),
	idCliente int not null,
	idUsuario int not null,
	total decimal(12,2) not null,
	CONSTRAINT FK_Venta_idUsuario
	FOREIGN KEY (idUsuario) REFERENCES Usuario (idUsuario),
	CONSTRAINT FK_venta_idCliente
	FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente)
	)

	
	CREATE TABLE DetalleVenta(
	idDetalleVenta int IDENTITY(1,1) PRIMARY KEY,
	idVenta int not null,
	idProducto int not null,
	cantidad int not null,
	precioUnitario decimal(10,2) not null,
	subtotal decimal(12,2) not null,
	CONSTRAINT FK_detalleVenta_Idventa
	FOREIGN KEY (idVenta) REFERENCES Venta (idVenta),
	CONSTRAINT FK_detalleVenta_idProducto
	FOREIGN KEY (idProducto) REFERENCES Producto (idProducto)
	)