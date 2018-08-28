# Jupyter Notebook Server Singularity Image
[![https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg](https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg)](https://singularity-hub.org/collections/1443)

This is a forked jupyter notebook server composer file for building Singularity image to be used in HPCC envionrments. The short tutorial below are designed for [Northwestern University's QUEST computing cluster](https://www.it.northwestern.edu/research/user-services/quest/overview.html) but likely can be applied to many other HPCC and cloud computing IasS like AWS EC2.

The Singularity image is automatically built and hosted on [Singularity Hub](https://www.singularity-hub.org). To invoke a basic scientific jupyter notebook server without using any sudo previlage use (for example, on Northwestern University's QUEST computing cluster)

```bash
singularity run -B $PWD:/run/user shub://chenchen2015/Singularity-jupyter
```
This will pull the image from Singularity Hub and run a basic jupyter notebook instance loaded with essential libraries supporting research computing.

Alternatively, you could download the pre-built image first and run it locally
```bash
singularity pull --name jupyter.img shub://chenchen2015/Singularity-jupyter
singularity run -B $PWD:/run/user jupyter.img
```

## Machine Learning Image
An additional image designed for machine learning is also included under tag `ML`. It is loaded with essential machine learning libraries and is built on top of the basic scientific jupyter notebook server image. To use the ML image, use `shub://chenchen2015/Singularity-jupyter:ML`:
```bash
singularity run -B $PWD:/run/user shub://chenchen2015/Singularity-jupyter:ML
```
or 
```bash
singularity pull --name jupyter-ML.img shub://chenchen2015/Singularity-jupyter:ML
singularity run -B $PWD:/run/user jupyter-ML.img
```

## Port Forwarding
In order to connect to the jupyter remote server, we need to properly forward the remote port (`8888` by default) to our local machine.

If using SSH client:
```
ssh -L 8888:localhost:<some_open_port> <netid>@quest.northwestern.edu
```
This enables local port forwarding which will forward local port `<some_open_port>`, `8888` for example, to the remote host's port `8888`. This way we can establish connection directly by using `localhost:<some_open_port>` in our local machine as if it is running on the remote machine.

Similarly, SSH client like PuTTY can do the same.

![](/imgs/port-forwarding-PuTTY.png)
