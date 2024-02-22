# Usamos una imagen base con soporte para Java y Maven
FROM maven:3.8.4-openjdk-11-slim AS build
WORKDIR /app

# Copiamos los archivos de configuración y compila el proyecto
COPY pom.xml .
COPY src ./src
RUN mvn clean package

# Utiliza una imagen más ligera de Java para ejecutar la aplicación
FROM adoptopenjdk:11-jre-hotspot
WORKDIR /app

# Copiamos el archivo JAR generado en la fase de compilación
COPY --from=build /app/target/SD ./app.jar

# Expone el puerto en el que la aplicación se ejecuta
EXPOSE 8080

# Ejecuta la aplicación
CMD ["java", "-jar", "app.jar"]
