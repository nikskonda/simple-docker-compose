FROM openjdk:12
WORKDIR /jarFile
COPY . /jarFile/
CMD ["java","-jar","/jarFile/kek.jar", "--spring.config.location=file:///jarFile/application.yml"]
