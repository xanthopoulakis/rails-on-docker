# Rails On Docker
An intoduction to creating and running a Ruby on Rails service API on Docker. For a more comprehensive tutorial, feel free to take a look at the  [Docker docs](https://docs.docker.com/compose/rails/#restart-the-application).
# Prerequisites
  - Make sure [Docker](https://docs.docker.com/docker-for-windows/install/) is installed and running on your machine
  - Use the IDE of you preference, such as [Sublime Text](https://www.sublimetext.com/) or [Visual Studio Code](https://code.visualstudio.com/) or [Atom](https://atom.io/) or [RubyMine](https://www.jetbrains.com/ruby/)
>If you are using Docker Machine, then docker-machine ip MACHINE_VM returns the Docker host IP address, to which you can append the port (<Docker-Host-IP>:3000)
# Getting Started
Open the command line console in your machine (or use [Git Bash](https://gitforwindows.org/)) and follow the steps below
Checkout:
```sh
$ git clone git@github.com:xanthopoulakis/rails-on-docker.git
```
enter the folder
```sh
$ cd rails-on-docker
```
Switch to template:
```sh
$ git fetch
$ git checkout template
```
build the project
```sh
$ docker-compose build rails-service
```
setup the database
```sh
$ docker-compose run rails-service rake db:setup
```
run the project
```sh
$ docker-compose up rails-service
```
open google chrome and navigate to (http://localhost:3000). To run the rails console do
```sh
$ docker-compose run rails-service rails c
```