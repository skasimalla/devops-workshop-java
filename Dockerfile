#Somebody's alpine image with java, probably bad choice but cutting steps for this assignment (I don't wanna deal with layering/ installing java)
FROM anapsix/alpine-java
MAINTAINER Sam K 
COPY target/spring-petclinic-2.7.3.jar /home/spring-petclinic-2.7.3.jar
CMD ["java","-jar","/home/spring-petclinic-2.7.3.jar"]
