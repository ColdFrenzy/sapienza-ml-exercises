# sapienza-ml-exercises
This repository is for the Machine Learning course held by prof. Iocchi
## Install Docker

In order to have a ready environment without installing manually all the libraries and dependencies, we'll use docker to do this.

- [docker](http://www.docker.com)

In order to install docker on your PC, you can follow the following guide:

- [install docker for ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- [Post-installation steps for Linux](https://docs.docker.com/install/linux/linux-postinstall/)

NB: It's important that you add your user to the `docker` group and log out and in again, before proceeding.

## Tensorflow GPU 
The standard docker image used in this course is [**tensorflow 2.3.2-gpu-jupyter**](https://hub.docker.com/layers/tensorflow/tensorflow/2.3.2-gpu-jupyter/images/sha256-9978ac424e00e3461accff7c1cf97484e61cca23820941c20335e0b5d4499a02?context=explore) with both GPU support and jupyter notebook pre installed. 
In order to run the tensorflow-gpu container you need to have an Nvidia GPU and the host machine requires the [NVIDIA driver](https://www.tensorflow.org/install/source#gpu_support_3). To install Nvidia driver insert your GPU model here:
- [nvidia-driver](https://www.nvidia.com/Download/index.aspx?lang=en-us)

Tensorflow will automatically be built with GPU support if it's available. 

## Installation

You'll need to follow this few steps:

- Clone the repository with the following command:

```bash
git clone https://github.com/ErmannoBartoli99/sapienza-ml-exercise.git
```
- go inside the repository and create a folder called notebooks

```bash
cd sapienza-ml-exercises
```

- Build the docker image. 

```bash
docker built -t NAME_OF_IMAGE .
```

or you can simply use the provided script
```bash
bash build.bash
```


## Usage
Once that you're ready, you have to run the image by using the following run.bash script:

```bash
bash run.bash
```
or by using the following command:
```bash
docker run -p 8888:8888 -v PATH_TO_DIRECTORY/:/src/ NAME_OF_IMAGE
```
NB: -p 8888:8888 should be always the same because it's for the port

NB: -v is needed to share folders between your pc and docker so if you add a file inside the docker, the changes will be visible also after the closure of it.
If you want to see the PATH_TO_DIRECTORY just go inside the directory (cd sapienza-ml2021) then use this command:

```bash
pwd
```

## Connect Colab to local Notebook
Since [Google Colab](https://colab.research.google.com/) has some [limitations](https://research.google.com/colaboratory/faq.html#limitations-and-restrictions) but a well structured interface, you can decide to connect colab to a local runtime and use the computational power of your machine.
1. First of all upload your local ipynb file to colab
![upload file on colab](/images/colab_upload.png)
2. Once you upload your file the first time, colab will automatically save and update (CTRL+S) it on your drive. Next time you want to work on this file just open it from google drive
![open from google drive](/images/google_drive.png)
3. Connect google colab to local runtime (after running the docker container):
![local runtime](/images/local_runtime.png)
4. Write http://localhost:8888/?token= as  showed below:
![connection](/images/localhost.png)
5. Add the token showed when executing the command in the [**Usage** section](#Usage)
|[token](/images/get_token.png)

If you are not sure if tensorflow is running on GPU, you can check it by running in a code cell the following line:
```python
print("Num GPUs Available: ", len(tf.config.list_physical_devices('GPU')))
```

## Commit the docker
If you change something inside the docker and you want to keep the changes don't forget to commit the image by doing the following command:
```bash
docker commit ID_IMAGE NAME_OF_IMAGE
```
NB: you can see the id of the image by doing the command:
```bash
docker ps -a
```


