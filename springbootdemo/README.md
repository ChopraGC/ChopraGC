cd c:\develop\learning\springbootdemo
keytool -importcert -trustcacerts -alias gradlePlugin -file ".gradle.org.crt" -keystore "C:\Program Files\Java\jdk-21\lib\security\cacerts" -storepass changeit
gradlew clean
graldew build
graldew jar
java -jar ./build/libs/springbootdemo-0.0.1-SNAPSHOT.jar
java -jar -Dspring.profiles.active=dev ./build/libs/springbootdemo-0.0.1-SNAPSHOT.jar
java -jar -Dspring.profiles.active=dev ./build/libs/springbootdemo-0.0.1-SNAPSHOT.jar
docker build -t booting .
docker run -p 8080:8080 -d booting