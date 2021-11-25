# LIng-2 DP1 Semester Project - No Time For Heroes
![Logo](/spring-boot/src/main/resources/static/resources/images/logo_ntfh.png)


## Getting started
First, some dependencies that have to be installed:
- Java JDK 11
- NodeJS 16.13 LTS

### Initializing the proyect
Before getting to the fun part, there is one little step we have to make.
Navigate to the /react folder in the project:
```
cd ./react/
```
After that, install the node modules necessary to run the application with:
```
npm install
```

## Running the application
Nearly there! As this application is split in two services (spring-boot for backend and database and react for frontend)
we need to initialize both services individually.

### Spring-Boot
From the source folder, navigate to the spring-boot directory:
```
cd ./spring-boot/
```
Now we execute the service with the appropiate maven command:
```
mvn spring-boot:run
```
From here on out, the spring-boot proyect will be located at localhost:8080/api, with the console at localhost:8080/api/h2-console.
To access the console follow this image:
![console-tutorial](/spring-boot/src/main/resources/static/resources/images/consola_db.png)

## Other work!
Link to tutorial and full game: https://youtu.be/T72qEQxI5pA