# ESIEE - 2022 - Pilotage de performance

Ce projet a été testé sur une machine virtuel **Ubuntu 22.04** sous **VirtualBox**.

## Github du projet :

[github - mybatis-spring-boot-jpetstore](https://github.com/kazuki43zoo/mybatis-spring-boot-jpetstore)

## 1 - Pré-requis

### 1.1 - Net Tools

```
apt install net-tools
```

Permet de faire plein de chose, comme `ifconfig` 😉

![img](_img/001.png)

### 1.2 - JDK 11 

```
sudo apt install openjdk-11-jre-headless
```

Vérification de JDK

```
> java --version
openjdk 11.0.16 2022-07-19
OpenJDK Runtime Environment (build 11.0.16+8-post-Ubuntu-0ubuntu122.04)
OpenJDK 64-Bit Server VM (build 11.0.16+8-post-Ubuntu-0ubuntu122.04, mixed mode, sharing)
```

## 2 - TP - 1 - Installation d'une application Java JEE

### 2.1 - Clone & Run

Clone du git

```
git clone https://github.com/kazuki43zoo/mybatis-spring-boot-jpetstore.git
```

Déplacer dans le dossier

```
cd mybatis-spring-boot-jpetstore
```

Démarrage du projet avec Maven

```
./mvnw clean spring-boot:run
```

### 2.2 - Accés via `localhost` et `ip`

Accès par : 

- [http://locahost:8080/](http://locahost:8080/)
- [http://172.16.202.226:8080/](http://172.16.202.226:8080/)

Changer le port pour `8081`

```
nano src/main/resources/application.properties
```

![img](_img/002.png)

Accès par : 

- [http://locahost:8081/](http://locahost:8081/)
- [http://172.16.202.226:8081/](http://172.16.202.226:8081/)

## 3 - TP - 2 - Configuration de 2 JPetStore avec LoadBalancer

### 3.1 - Configuration de 2 JPetStore

1. Avoir 2 instances de JPetStore
2. Changé les ports de chaque applications pour :
    - JPetStore_1 : `8081`
    - JPetStore_2 : `8082`

Duplication de **jpetstore** vers **jpetstore_1** et **jpetstore_2**.

```
mkdir apps
cp -r mybatis-spring-boot-jpetstore/ apps/jpetstore_1
cp -r mybatis-spring-boot-jpetstore/ apps/jpetstore_2
```

Vérification de la création

```
ls -ali apps/

total 16
1476918 drwxrwxr-x  4 ldumay ldumay 4096 oct.   3 16:15 .
1327599 drwxr-x--- 22 ldumay ldumay 4096 oct.   3 16:13 ..
1477139 drwxrwxr-x  8 ldumay ldumay 4096 oct.   3 16:15 jpetstore_1
1477158 drwxrwxr-x  8 ldumay ldumay 4096 oct.   3 16:15 jpetstore_2
```

Modification des fichiers `application.properties` por **jpetstore_1** et **jpetstore_2**.

```
nano apps/jpetstore_1/src/main/resources/application.properties
nano apps/jpetstore_2/src/main/resources/application.properties
```

Modifier la configuration du datasource Sring

```
spring.datasource.url=jdbc:hsqldb:file:false
```


**----------------[EN COURS - NON TESTER]----------------**

Compilation en jar

```
./mvnw clean package -DskipTests=true
```

```
nohup java -jar apps/jpetstore_1/target/mybatis-spring-boot-jpetstore-2.0.0-SNAPSHOT.jar
nohup java -jar apps/jpetstore_2/target/mybatis-spring-boot-jpetstore-2.0.0-SNAPSHOT.jar
```

### 3.2 - LoadBalancer

```
sudo systemctl enable apache2
sudo systemctl start apache2.service
sudo systemctl status apache2.service
```

```
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod proxy_balancer
sudo a2enmod headers
sudo a2enmod lbmethod_byrequests
sudo systemctl restart apache2.service
```