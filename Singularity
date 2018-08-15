BootStrap: docker
From: continuumio/anaconda3

%runscript

     echo "Starting notebook..."
     echo "Open browser to localhost:8888"
     exec /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --allow-root --port=8888 --no-browser

%post
     
     # Install jupyter notebook
     /opt/conda/bin/conda install jupyter -y --quiet
     # Install additional packages
     /opt/conda/bin/conda install lightgbm sklearn --quiet
     # Update conda packages
     /opt/conda/bin/conda update --all -y --quiet
     /opt/conda/bin/conda clean --all -y --quiet
     mkdir /opt/notebooks
     apt-get autoremove -y
     apt-get clean
     # create bind points for HPCC environment
     mkdir -p /projects
     mkdir -p /home
