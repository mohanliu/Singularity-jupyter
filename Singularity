BootStrap: docker
From: continuumio/anaconda3

%runscript

     echo "Starting notebook..."
     echo "Open browser to localhost:8888"
     exec /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --allow-root --port=8888 --no-browser

%post
     
     # Export conda
     export PATH=/opt/conda/bin/conda:$PATH
     ~/.bashrc
     # Install jupyter notebook
     /opt/conda/bin/conda install jupyter -y --quiet
     # Install additional packages
     conda install lightgbm sklearn --quiet
     # Update conda packages
     conda update --all -y --quiet
     conda clean --all -y --quiet
     mkdir /opt/notebooks
     apt-get autoremove -y
     apt-get clean
     # create bind points for HPCC environment
     mkdir -p /projects
     mkdir -p /home
