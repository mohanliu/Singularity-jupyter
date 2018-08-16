# Jupyter Notebook Server Singularity Image
[![https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg](https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg)](https://singularity-hub.org/collections/1443)

This is a forked jupyter notebook server composer file for building Singularity image to be used on HPCC envionrments.

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
