# Usar una imagen base de Java
FROM openjdk:11-jdk-slim

# Crear el directorio de la aplicación
WORKDIR /app

# Copiar el archivo de compilación y el código fuente al contenedor
COPY build.xml /app/
COPY src /app/src
COPY librerias /app/librerias

# Instalar Ant
RUN apt-get update && apt-get install -y ant

# Compilar el proyecto
RUN ant dist

# Definir el comando para ejecutar la aplicación
CMD ["java", "-cp", "dist/punto-de-venta.jar", "sistemaventa.SistemaVenta"]
