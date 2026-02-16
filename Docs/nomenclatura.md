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

* Formato obligatorio: `snake_case`
* Usar nombres en singular
* No usar prefijos como `tbl`
* No usar mayúsculas completas

✅ Correcto:

```sql
cliente
producto
detalle_venta
usuario
```

❌ Incorrecto:

```sql
Clientes
tblClientes
CLIENTE
```

---

## 2.2 Columnas

* Formato obligatorio: `snake_case`
* Sin espacios
* Nombres descriptivos

Ejemplo:

```sql
id
nombre_cliente
correo
telefono
fecha_creacion
precio_unitario
cantidad_stock
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
cliente_id
producto_id
usuario_id
```

Regla:

```
nombre_tabla + _id
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

Cuando exista una columna en base de datos:

```sql
nombre_cliente
```

Debe existir el atributo correspondiente en Java:

```java
private String nombreCliente;
```

Si se utiliza JPA:

```java
@Column(name = "nombre_cliente")
private String nombreCliente;
```

Regla obligatoria:

* `snake_case` en base de datos
* `camelCase` en atributos Java

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

* No mezclar estilos (`snake_case`, `camelCase`, `PascalCase`) fuera de su contexto.
* No usar espacios en nombres de base de datos.
* No alternar entre singular y plural sin criterio.
* Mantener coherencia semántica entre Base de Datos, Backend y Frontend.
* Toda nueva entidad debe respetar estas reglas.

---

# 🏆 Resumen Oficial

| Capa           | Convención            |
| -------------- | --------------------- |
| Tablas         | snake_case (singular) |
| Columnas       | snake_case            |
| Clases Java    | PascalCase            |
| Atributos Java | camelCase             |
| Métodos        | camelCase             |
| JSON           | camelCase             |
| JavaScript     | camelCase             |
| Endpoints      | plural en minúsculas  |

---

**Documento oficial de convenciones de nomenclatura – Mini ERP**

