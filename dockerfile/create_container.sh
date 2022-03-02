docker create --gpus all -u user -h docker -it \
              -v /home/user/zmh:/home/user/Programs \
              --name zmh_pt-1.8 common:pytorch-1.8


# docker create --gpus all -u user -h docker -it \
#               -v /home/user/zmh:/home/user/Programs \
#               --name zmh_tf-0.12 common:tensorflow-0.12
