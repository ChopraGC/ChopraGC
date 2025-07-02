# Download any java greater than or equal to 8
#Add java_home variable
# Open command prompt
# cd c:\develop\learning
# Download Gradle (binary only) from https://gradle.org/install/
# Unzip and copy to C:\Program Files\Gradle  
# Add Gradle (C:\Program Files\Gradle\gradle-8.14.2\bin) to Path in environment variables 
# Create folder gradlebuilddemo
mkdir gradlebuilddemo

# Initialize GIT repo
git init 
git remote add origin https://github.com/ChopraGC/ChopraGC.git
git remote -v
git status
git add .
git commit -m "Results of gradle init"
git push --set-upstream origin master

###########################################################
			BASIC PROJECT
###########################################################


cd c:\develop\learning\gradlebuilddemo
mkdir basic
cd basic

gradle init
project type: 1. basic
build script DSL: 1. Groovy
project name: mybasicproject

gradlew tasks

Gralde components:
1. Projects
2. Build Scripts
3. Tasks  - build actions
4. Plugins

#Create java file
Create a java file "GradleTutorial.java" under C:\develop\learning\gradlebuilddemo\basic\src\main\java\com\gauravchopra

# Add entry for java plugin in build.gradle

plugins {
    id 'java'
}

#############################################################
gradlew build

-- creates class file and jar file in build folder


##############################################################
# Pscksge into JAR and Inform gradle which class to run using jar task in build.gradle

jar {
    manifest {
        attributes 'Main-Class': 'com.gauravchopra.GradleTutorial'
    }
}

# Rebuild project
gradlew build

# Run project
java -jar build\libs\mybasicproject.jar

# Create test class
GradleTutorialTest.java under C:\develop\learning\gradlebuilddemo\basic\src\test\java\com\gauravchopra

# add dependencies in build.gralde for test
dependencies {
    testImplementation group: 'junit', name: 'junit', version: '4.13.2'  
}

# add dependencies for which repo to use to Download dependencies in build.Gradle
repositories {
    mavenCentral()
}

# Build to run build and test
gradlew build

# Verify results of tests
Open and verify results in file: C:/develop/learning/gradlebuilddemo/basic/build/reports/tests/test/index.html

# Get list of dependencies
gradlew dependencies

# Compile java file into classes
gradlew compileJava

# Copy content of Resources directory into build directory in similar directory structure
gradlew processResources

# Run tests 
gradlew tests 

###########################################################
			Gradle Java project layout
			
src/main/java				===> build/classes/java/main
src/main/resources			===> build/resources/main
src/test/java				===> build/classes/java/test
src/test/resources			===> build/resources/test

###########################################################

Youtube course: https://www.youtube.com/watch?v=R6Z-Sxb837I

gradlew build
gradlew dependencies
gradlew compileJava
gradlew processResources
gradlew jar
java -jar build\libs\mybasicproject.jar en
java -jar build\libs\mybasicproject.jar 
gradlew test
gradlew clean
###########################################################

Java plugin Task Graph

:build
    :assemble
        :jar
            :classes
                :compileJava
                :processResources
    :check
        :test
            :classes
                :compileJava
                :processResources
            :testClasses
                :compileTestJava
                    :classes
                        :compileJava
                        :processResources
                :procesTestResources
