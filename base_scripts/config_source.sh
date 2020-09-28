# set apt source
yes | cp -rf sources.list /etc/apt/sources.list

# set pip source
pip install pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple