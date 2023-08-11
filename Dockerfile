FROM maven as build
WORKDIR /work
COPY . /work 
RUN mvn install  
# mvn install - build and compile pom.xml file into .jar, .war files and puts in local repo#
FROM openjdk:11.0
WORKDIR /uber
COPY --from=build /work/target/Uber.jar /uber
EXPOSE 9090
CMD [ "java", "-jar", "Uber.jar" ]