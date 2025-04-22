FROM eclipse-temurin:21

# Define o diretório de trabalho
WORKDIR /app

# Copia arquivos necessários para o Maven Wrapper
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Faz o download das dependências offline
RUN chmod +x mvnw && ./mvnw dependency:go-offline

# Copia o código-fonte
COPY src ./src

# Comando para rodar a aplicação
CMD ["./mvnw", "spring-boot:run"]
