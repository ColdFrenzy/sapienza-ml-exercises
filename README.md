# sapienza-ml2021
This repository is for the Machine Learning course held by prof. Iocchi

## Installation

In order to have a ready environment without installing manually all the libraries and dependencies, we'll use docker to do this.

You'll need to follow this few steps:

- Clone the repository with the following command:

```bash
git clone https://github.com/ErmannoBartoli99/sapienza-ml2021.git
```
- go inside the repository and create a folder called notebooks

```bash
cd sapienza-ml2021
mkdir notebooks
```

- Build the docker image. 

NB : By doing this also the image "ermannobartoli99/sapienza-ml2021:latest" will be pulled, so you'll start from this existing image

NB : the folder nootebooks that you've create will be useful in order to share files between your pc and the container

NB : the command sudo is not always needed for docker commands, but in some cases they only work with sudo

```bash
sudo docker built -t NAME_OF_IMAGE .
```

- after this step you'll have your image that you can run.
- NB : in the folder sapienza-ml2021 there is a file called "requirements.txt" with only 1 library (numpy). Whenever you'll need one more library to import just write the name on the following line and then re-build the docker (important).

## Usage
Once that you're ready, you have to run the image by doing the following command:

```bash
sudo docker run -p 8888:8888 -v PATH_TO_DIRECTORY/:/src/ NAME_OF_IMAGE
```
NB: -p 8888:8888 should be always the same because it's for the port

NB: -v is needed to share folders between your pc and docker so if you add a file inside the docker, the changes will be visible also after the closure of it.
If you want to see the PATH_TO_DIRECTORY just go inside the directory (cd sapienza-ml2021) then use this command:

```bash
pwd
```

## Commit the docker
If you change something inside the docker and you want to keep the changes don't forget to commit the image by doing the following command:
```bash
sudo docker commit ID_IMAGE NAME_OF_IMAGE
```
NB: you can see the id of the image by doing the command:
```bash
sudo docker ps -a
```

