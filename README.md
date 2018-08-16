# Jupyter Notebook Server Singularity Image
[![https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg](https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg)](https://singularity-hub.org/collections/1443)

This is a forked jupyter notebook server composer file for building Singularity image to be used on HPCC envionrments. The short tutorial below are designed for [Northwestern University's QUEST computing cluster](https://www.it.northwestern.edu/research/user-services/quest/overview.html).

The Singularity image will be build automatically and is hosted on [Singularity Hub](). To invoke a jupyter notebook instance without using any sudo previlage use (for example, on Northwestern University's QUEST computing cluster)

```bash
singularity run -B $PWD:/run/user shub://chenchen2015/Singularity-jupyter
```
This will pull the image from Singularity Hub and run a jupyter notebook instance.

Alternatively, you could download the pre-built image first and run it locally
```bash
singularity pull --name jupyter.img shub://chenchen2015/Singularity-jupyter
singularity run -B $PWD:/run/user jupyter.img
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
