docker create --gpus all -u user -h docker -it \
              --name zmh_pt-1.8 common:pytorch-1.8 \
              -v /home/user/zmh:/home/user/Programs
              
# docker create --gpus all -u user -h docker -it \
#               --name zmh_tf-0.12 common:tensorflow-0.12 \
#               -v /home/user/zmh:/home/user/Programs
