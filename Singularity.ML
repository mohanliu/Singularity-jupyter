BootStrap: shub
From: chenchen2015/Singularity-jupyter

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
     exec /opt/conda/bin/jupyter notebook --notebook-dir=/projects --allow-root --port=8888 --no-browser

%post   
     # Install additional packages
     /opt/conda/bin/conda install -c conda-forge lightgbm scikit-learn seaborn opencv pillow scikit-image -y -q
     /opt/conda/bin/pip install -U imutils -q
     # Clean up
     /opt/conda/bin/conda clean --all -y --quiet
     apt-get autoremove -y
     apt-get clean
     # create bind points for HPCC environment
     mkdir -p /projects

%test  
     echo "Testing python..."
     /opt/conda/bin/python -V
