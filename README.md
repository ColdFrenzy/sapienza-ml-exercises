# sapienza-ml-exercises
This repository is for the Machine Learning course held by prof. Iocchi. 
## Install Docker

In order to have a ready environment without installing manually all the libraries and dependencies, we'll use docker to do this.

- [docker](http://www.docker.com)

In order to install docker on your PC, you can follow the following guide:

- [Install docker for Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- [Post-installation steps for Linux](https://docs.docker.com/install/linux/linux-postinstall/)

**NB**: It's important that you add your user to the `docker` group and log out and in again, before proceeding.

## Tensorflow GPU 
The standard docker image used in this course is [**tensorflow 2.3.2-gpu-jupyter**](https://hub.docker.com/layers/tensorflow/tensorflow/2.3.2-gpu-jupyter/images/sha256-9978ac424e00e3461accff7c1cf97484e61cca23820941c20335e0b5d4499a02?context=explore) with both GPU support and jupyter notebook pre installed. 
In order to run the tensorflow-gpu container you need to have an NVIDIA GPU and the host machine requires the NVIDIA driver (you don't need the NVIDIA CUDA Toolkit). Follow the 
- [NVIDIA Driver Installation Guide](https://docs.nvidia.com/datacenter/tesla/tesla-installation-notes/index.html)


**NB**: If you  don't have an NVIDIA GPU skip to the [**Installation** section](#Installation)

Follow the remaining steps described on the [tensorflow website](https://www.tensorflow.org/install/docker#gpu_support). 
In particular, Install the [Nvidia Container Toolkit](https://github.com/NVIDIA/nvidia-docker/tree/master) by following the 
- [Nvidia container toolkit installation guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#setting-up-nvidia-container-toolkit)


## Installation

You'll need to follow this few steps:

- Clone the repository with the following command:

```bash
git clone https://github.com/ErmannoBartoli99/sapienza-ml-exercises.git
```
- go inside the repository and create a folder called notebooks

```bash
cd sapienza-ml-exercises
```

- Build the docker image by running the script:
```bash
bash build.bash
```
or 
```bash
docker built -t NAME_OF_IMAGE .
```



## Usage
Once that you're ready, if in the previous step you have built the container with the `build.bash` script, you can run the image **with GPU support** by executing the script:
```bash
bash rungpu.bash
```
or **without GPU support**
```bash
bash run.bash
```
If you have built your image without a script use the following command for an image with GPU support
```bash
nvidia-docker run --name NAME_OF_IMAGE --rm -p 8888:8888 -v PATH_TO_DIRECTORY/:/src/ NAME_OF_IMAGE
```
or without GPU support
```bash
docker run --name NAME_OF_IMAGE --rm -p 8888:8888 -v PATH_TO_DIRECTORY/:/src/ NAME_OF_IMAGE
```
**NB**: -p 8888:8888 should be always the same because it's for the port

**NB**: -v is needed to share folders between your pc and docker so if you add a file inside the docker, the changes will be visible also after the closure of it.
If you want to see the PATH_TO_DIRECTORY just go inside the directory (cd sapienza-ml2021) then use this command:

```bash
pwd
```

## Connect Colab to local Notebook
Since [Google Colab](https://colab.research.google.com/) has some [limitations](https://research.google.com/colaboratory/faq.html#limitations-and-restrictions) but a well structured interface, you can decide to connect colab to a local runtime and use the computational power of your machine.
1. First of all upload your local ipynb file to colab
![upload file on colab](/images/colab_upload.png)
2. Once you have uploaded your file the first time, colab will automatically save and update (CTRL+S) it on your drive. Next time you want to work on this file just open it from google drive
![open from google drive](/images/google_drive.png)
3. Connect google colab to local runtime (after running the docker container):
![local runtime](/images/local_runtime.png)
4. Write http://localhost:8888/?token= as  showed below:
![connection](/images/localhost.png)
5. Add the token showed when executing the command in the [**Usage** section](#Usage)
![token](/images/get_token.png)

To test your image, use the `first_notebook.ipynb` available in the notebooks directory

## Commit the docker
If you change something inside the docker and you want to keep the changes don't forget to commit the image by doing the following command:
```bash
docker commit ID_IMAGE NAME_OF_IMAGE
```
**NB**: you can see the id of the image by doing the command:
```bash
docker ps -a
```


