Important Notes for Developers
1.Version Management

The pipeline automatically increments the pom.xml version when you push changes to the dev or master branches.
Example:
If the current version is 1.0.0 and you push a commit, the pipeline updates it to 1.0.1.

2.Syncing Your Local Repository

After a pipeline run, your local repository may be out of sync because the pom.xml file is updated and committed by the workflow.
Always run the following command before making new changes:

git pull origin dev  # For the dev branch
git pull origin master  # For the master branch
This ensures you have the latest version of the pom.xml and other files.

3.Triggering the Pipeline

The pipeline is triggered automatically when you push to the dev or master branches.


# A simple, minimal Maven example: hello world


To create the files in this git repo we've already run `mvn archetype:generate` from http://maven.apache.org/guides/getting-started/maven-in-five-minutes.html
    
    mvn archetype:generate -DgroupId=com.myapp.app -DartifactId=myapp -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false

Now, to print "Hello World!", type either...

    cd myapp
    mvn compile
    java -cp target/classes com.myapp.app.App

or...

    cd myapp
    mvn package
    java -cp target/myapp-1.0-SNAPSHOT.jar com.myapp.app.App

Running `mvn clean` will get us back to only the source Java and the `pom.xml`:

    murphy:myapp pdurbin$ mvn clean --quiet
    murphy:myapp pdurbin$ ack -a -f
    pom.xml
    src/main/java/com/myapp/app/App.java
    src/test/java/com/myapp/app/AppTest.java

Running `mvn compile` produces a class file:

    murphy:myapp pdurbin$ mvn compile --quiet
    murphy:myapp pdurbin$ ack -a -f
    pom.xml
    src/main/java/com/myapp/app/App.java
    src/test/java/com/myapp/app/AppTest.java
    target/classes/com/myapp/app/App.class
    murphy:myapp pdurbin$ 
    murphy:myapp pdurbin$ java -cp target/classes com.myapp.app.App
    Hello World!

Running `mvn package` does a compile and creates the target directory, including a jar:

    murphy:myapp pdurbin$ mvn clean --quiet
    murphy:myapp pdurbin$ mvn package > /dev/null
    murphy:myapp pdurbin$ ack -a -f
    pom.xml
    src/main/java/com/myapp/app/App.java
    src/test/java/com/myapp/app/AppTest.java
    target/classes/com/myapp/app/App.class
    target/maven-archiver/pom.properties
    target/myapp-1.0-SNAPSHOT.jar
    target/surefire-reports/com.myapp.app.AppTest.txt
    target/surefire-reports/TEST-com.myapp.app.AppTest.xml
    target/test-classes/com/myapp/app/AppTest.class
    murphy:myapp pdurbin$ 
    murphy:myapp pdurbin$ java -cp target/myapp-1.0-SNAPSHOT.jar com.myapp.app.App
    Hello World!

Running `mvn clean compile exec:java` requires https://www.mojohaus.org/exec-maven-plugin/

Running `java -jar target/myapp-1.0-SNAPSHOT.jar` requires http://maven.apache.org/plugins/maven-shade-plugin/

# Runnable Jar:
JAR Plugin
The Maven’s jar plugin will create jar file and we need to define the main class that will get executed when we run the jar file.
```
<plugin>
  <artifactId>maven-jar-plugin</artifactId>
  <version>3.0.2</version>
  <configuration>
    <archive>
      <manifest>
        <addClasspath>true</addClasspath>
        <mainClass>com.myapp.App</mainClass>
      </manifest>
    </archive>
  </configuration>
</plugin>
```


# Folder tree before package:
```
├── pom.xml
└── src
    ├── main
    │   └── java
    │       └── com
    │           └── myapp
    │               └── app
    │                   └── App.java
    └── test
        └── java
            └── com
                └── myapp
                    └── app
                        └── AppTest.java

```
# Folder tree after package:
```

.
├── pom.xml
├── src
│   ├── main
│   │   └── java
│   │       └── com
│   │           └── myapp
│   │               └── app
│   │                   └── App.java
│   └── test
│       └── java
│           └── com
│               └── myapp
│                   └── app
│                       └── AppTest.java
└── target
    ├── classes
    │   └── com
    │       └── myapp
    │           └── app
    │               └── App.class
    ├── generated-sources
    │   └── annotations
    ├── generated-test-sources
    │   └── test-annotations
    ├── maven-archiver
    │   └── pom.properties
    ├── maven-status
    │   └── maven-compiler-plugin
    │       ├── compile
    │       │   └── default-compile
    │       │       ├── createdFiles.lst
    │       │       └── inputFiles.lst
    │       └── testCompile
    │           └── default-testCompile
    │               ├── createdFiles.lst
    │               └── inputFiles.lst
    ├── myapp-1.0-SNAPSHOT.jar
    ├── surefire-reports
    │   ├── com.myapp.app.AppTest.txt
    │   └── TEST-com.myapp.app.AppTest.xml
    └── test-classes
        └── com
            └── myapp
                └── app
                    └── AppTest.class
```
