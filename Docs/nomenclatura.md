# 📘 Mini ERP

## Convenciones Oficiales de Nomenclatura

> Documento oficial que define exclusivamente las reglas de nomenclatura del proyecto.
>
> Estas reglas son obligatorias para todo el equipo de desarrollo.

---

# 🎯 1. Objetivo

Establecer un estándar uniforme de nombres para:

* Base de Datos
* Backend (Java)
* API / JSON
* Frontend (JavaScript y HTML)

El objetivo es evitar errores de integración, mejorar la legibilidad del código y mantener coherencia en todo el sistema.

---

# 🗄 2. Convenciones para Base de Datos (SQL Server)

## 2.1 Tablas

* Formato obligatorio: `PascalCase`
* Usar nombres en singular
* No usar prefijos como `tbl`
* No usar guiones ni espacios

✅ Correcto:

```sql
Cliente
Producto
DetalleVenta
Usuario
```

❌ Incorrecto:

```sql
cliente
detalle_venta
tblClientes
CLIENTE
```

---

## 2.2 Columnas

* Formato obligatorio: `camelCase`
* Sin espacios
* Nombres descriptivos

Ejemplo:

```sql
id
nombreCliente
correo	elefono
fechaCreacion
precioUnitario
cantidadStock
```

---

## 2.3 Claves Primarias

Nombre estándar obligatorio:

```sql
id
```

---

## 2.4 Claves Foráneas

Formato obligatorio:

```sql
clienteId
productoId
usuarioId
```

Regla:

```
nombreTabla + Id
```

---

# ☕ 3. Convenciones para Backend (Java)

## 3.1 Clases

* Formato obligatorio: `PascalCase`
* Usar nombres en singular

```java
Cliente
Producto
DetalleVenta
UsuarioService
ProductoRepository
```

---

## 3.2 Atributos

* Formato obligatorio: `camelCase`
* Deben corresponder semánticamente con las columnas de la base de datos

Ejemplo:

```java
private Long id;
private String nombreCliente;
private String correo;
private LocalDate fechaCreacion;
private Double precioUnitario;
```

---

## 3.3 Métodos

* Formato obligatorio: `camelCase`
* Usar verbos en infinitivo

```java
obtenerProductos();
guardarCliente();
eliminarProducto();
actualizarStock();
```

---

## 3.4 Relación Base de Datos ↔ Java

Cuando exista una tabla y columna en base de datos:

```sql
Cliente
nombreCliente
```

Debe existir la clase y atributo correspondiente en Java:

```java
public class Cliente {
    private String nombreCliente;
}
```

Si se utiliza JPA:

```java
@Column(name = "nombreCliente")
private String nombreCliente;
```

Regla obligatoria:

* `PascalCase` para tablas
* `camelCase` para columnas
* `PascalCase` para clases
* `camelCase` para atributos

La base de datos y el backend deben mantener coherencia directa en los nombres.

---

# 🌐 4. Convenciones para API / JSON

* Formato obligatorio: `camelCase`
* Debe coincidir exactamente con los atributos de las clases Java

Ejemplo:

```json
{
  "id": 1,
  "nombreCliente": "Carlos Pérez",
  "fechaCreacion": "2026-02-16"
}
```

---

# 🎨 5. Convenciones para Frontend

## 5.1 Variables en JavaScript

* Formato obligatorio: `camelCase`

```javascript
let nombreCliente = "";
let precioUnitario = 0;
```

---

## 5.2 IDs en HTML

* Deben escribirse en `camelCase`
* Deben coincidir con las variables utilizadas en JavaScript cuando aplique

```html
<input id="nombreCliente" />
```

---

# 🔗 6. Convenciones para Endpoints REST

* Usar nombres en plural
* Usar minúsculas
* No usar verbos en la URL

Ejemplo:

```
GET    /clientes
POST   /productos
PUT    /productos/{id}
DELETE /usuarios/{id}
```

---

# 📌 7. Reglas Generales Obligatorias

* No mezclar estilos (`camelCase`, `PascalCase`) fuera de su contexto.
* No usar espacios en nombres de base de datos.
* No alternar entre singular y plural sin criterio.
* Mantener coherencia semántica entre Base de Datos, Backend y Frontend.
* Toda nueva entidad debe respetar estas reglas.

---

# 🏆 Resumen Oficial

| Capa           | Convención            |
| -------------- | --------------------- |
| Tablas         | PascalCase (singular) |
| Columnas       | camelCase             |
| Clases Java    | PascalCase            |
| Atributos Java | camelCase             |
| Métodos        | camelCase             |
| JSON           | camelCase             |
| JavaScript     | camelCase             |
| Endpoints      | plural en minúsculas  |

---

**Documento oficial de convenciones de nomenclatura – Mini ERP**

