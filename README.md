# ESIEE - 2022 - Pilotage de performance

Ce projet a été testé sur une machine virtuel **Ubuntu 22.04** sous **VirtualBox**.

## Github du projet :

[github - mybatis-spring-boot-jpetstore](https://github.com/kazuki43zoo/mybatis-spring-boot-jpetstore)

## Pré-requis

### Net Tools

```
apt install net-tools
```

Permet de faire plein de chose, comme `ifconfig` 😉

![img](_img/001.png)

### JDK 11 

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

## TP - 1 - Installation d'une application Java JEE

### Clone & Run

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

### Accés via `localhost` et `ip`

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