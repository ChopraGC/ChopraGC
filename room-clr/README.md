COMMAND LINE RUNNER INTERFACE

cd c:\develop\learning\room-clr
gradlew clean
gradlew build
java -jar build/libs/room-clr-0.0.1-SNAPSHOT.jar


This is a standalone application 
We do not need an embedded tomcat here so the output is there after spring is started.
Application starts, run and then stops with exit code 0

If this was server application, application would remain open even after execution finishes.

FizzBuzz exercise:

Use command line runner to implement FizzBuzz

print all numbers between 1 and 100
if divisible by 3, print Fizz
if divisble by 5, print Buzz
if divisble by both, print FizzBuzz

