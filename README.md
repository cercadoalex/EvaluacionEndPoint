# Creacion de  Servicio Web Api

Habilitar un End Point para cada Stored Procedure.
> Requerimientos

- Crear un Stored Procedure que liste facturas emitidas por día ordenado por el importe de mayor a menor, mostrar datos del cliente, del vendedor, y valor de la factura
- Crear un Stored Procedure que liste los clientes de categoría ‘A’ y que no tengan ninguna factura emitida.
-  Crear un Stored Procedure que liste todos los productos.
-  Crear un Stored Procedure que liste los vendedores que ingresaron en el 2019.
-  Crear un Stored Procedure que permita una registrar factura, validar que tenga como mínimo un producto, y que la cantidad de los productos será mayor a cero.

## Base Datos (SQL Server)

Verificar el archivo BaseDatos.txt , el cual se encuentra los script de la base de datos el cual se debe ejecutar.
```sh
Ruta:   EvaluacionQS\WebApi\Document\BaseDatos.txt
```

## Servicio Web Api (.Net Core)
Modificar el Acceso a la base de datos
 ```sh
Ruta:   appsettings.json -> ConnectionStrings -> Conection
```
