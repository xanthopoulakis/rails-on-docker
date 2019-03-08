# Rails On Docker
An intoduction to creating and running a Ruby on Rails service API on Docker. For a more comprehensive tutorial, feel free to take a look at the  [Docker docs](https://docs.docker.com/compose/rails/#restart-the-application).
# Prerequisites
  - Make sure [Docker](https://docs.docker.com/docker-for-windows/install/) is installed and running on your machine
  - Use the IDE of you preference, such as [Sublime Text](https://www.sublimetext.com/) or [Visual Studio Code](https://code.visualstudio.com/) or [Atom](https://atom.io/) or [RubyMine](https://www.jetbrains.com/ruby/)
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
create the project
```sh
$ docker-compose run rails-service rails new . --api -T
```
 