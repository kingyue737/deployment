# set apt source
yes | cp -rf sources.list /etc/apt/sources.list

# set pip source
pip install pip -U
pip config set global.index-url http://mirrors.aliyun.com/pypi/simple/

# set conda source
conda config --add channels http://mirrors.aliyun.com/pypi/simple/