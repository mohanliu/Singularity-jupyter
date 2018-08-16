BootStrap: docker
From: continuumio/anaconda3

%labels
   Maintainer Chen Chen (chenchen.bme@gmail.com)
   Version v0.1
   
%environment
     conda=/opt/conda/bin/conda
     pip=/opt/conda/bin/pip
     python3=/opt/conda/bin/python
     export conda pip python3
     
%runscript
     echo "Starting notebook..."
     echo "Open browser to localhost:8888"
     exec /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --allow-root --port=8888 --no-browser

%post   
     # Install jupyter notebook
     /opt/conda/bin/conda install jupyter -y --quiet
     # Install additional packages
     /opt/conda/bin/conda install -c conda-forge pip lightgbm scikit-learn pandas seaborn matplotlib tqdm opencv pillow scikit-image -y -q
     /opt/conda/bin/pip install -U imutils -q
     # Update conda packages
     /opt/conda/bin/conda update --all -y --quiet
     /opt/conda/bin/conda clean --all -y --quiet
     #mkdir /opt/notebooks
     apt-get autoremove -y
     apt-get clean
     # create bind points for HPCC environment
     mkdir -p /projects
     mkdir -p /home

%test  
     echo "Testing python..."
     /opt/conda/bin/python -V
