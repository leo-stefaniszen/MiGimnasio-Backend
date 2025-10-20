'# MiGimnasio-Backend' 
----------------------------------------
INICIAR SERVIDOR - PROYECTO MiGimnasio
----------------------------------------

REQUISITOS:
- Java 11 instalado y configurado en PATH
- Apache Maven 3.9.x instalado y configurado en PATH
- MySQL 8 instalado y en ejecución
- Base de datos 'migimnasio' creada (usar script SQL)
- Archivo 'application.properties' configurado correctamente

----------------------------------------
PASOS PARA LEVANTAR EL SERVIDOR
----------------------------------------

1. Abrir MySQL Workbench o la terminal
   -> Ejecutar el script SQL completo de 'migimnasio' para crear la base de datos.

2. Abrir una terminal en la carpeta del proyecto
   Ejemplo:
   C:\Proyecto\demo

3. Ejecutar el siguiente comando para limpiar y compilar:
   mvn clean package

4. Iniciar el servidor con:
   mvn spring-boot:run

5. Esperar a que aparezca el mensaje:
   "Tomcat started on port(s): 8080"

6. Abrir el navegador y entrar a:
   http://localhost:8080

----------------------------------------
URLS PARA PROBAR (EJEMPLOS)
----------------------------------------
* Página raíz del servidor:
  → http://localhost:8080/

* Controlador de sucursales (si existe):
  → http://localhost:8080/sucursales

* Controlador de empleados:
  → http://localhost:8080/empleados

* Controlador de clases:
  → http://localhost:8080/clases

* Controlador de socios:
  → http://localhost:8080/socios

* Controlador de planes:
  → http://localhost:8080/planes

(Si alguno devuelve error 404, todavía no se creó el controlador o endpoint correspondiente)

----------------------------------------
SI HAY ERRORES COMUNES
----------------------------------------
- Error "mvn no reconocido":
  -> Agregar la ruta de Maven al PATH del sistema.

- Error de conexión MySQL:
  -> Revisar 'application.properties' y asegurarse de que:
     spring.datasource.url=jdbc:mysql://localhost:3306/migimnasio
     spring.datasource.username=root
     spring.datasource.password=TU_PASSWORD

- Error de compilación:
  -> Revisar que las dependencias del pom.xml estén correctas.

----------------------------------------
PARA DETENER EL SERVIDOR
----------------------------------------
Presionar CTRL + C en la terminal donde está corriendo.

----------------------------------------
FIN DEL TUTORIAL
----------------------------------------
