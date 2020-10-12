mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash

# silent
install_miniconda > /dev/null 2>&1
# logged
install_miniconda > miniconda_install.log

# create environment
conda create -n nuclear python=3.8

# change source
yes | cp -rf .condarc ~/.condarc

# 清除索引缓存，保证用的是镜像站提供的索引
conda clean -i