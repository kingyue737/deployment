# generate ssh-key if it doesn't exist
cat /dev/zero | ssh-keygen -t rsa -q -N ""
ssh-copy-id -i ~/.ssh/id_rsa.pub yuejin@192.168.1.49

# reversely copy key