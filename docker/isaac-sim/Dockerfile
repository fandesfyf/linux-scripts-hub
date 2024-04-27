# FROM nvidia/cuda:12.3.1-base-ubuntu20.04
FROM nvcr.io/nvidia/isaac-sim:2023.1.1

# FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

# 安装Python 3及相关依赖
RUN apt-get update && \
    apt-get install -y python3 python3-pip
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install pip -U

# 安装SSH服务
RUN apt-get install -y openssh-server net-tools nano htop
ENV USER=root
# 设置root用户的密码为1234
RUN echo 'root:123456' | chpasswd

# 允许SSH远程登录
RUN sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config

# 安装图形界面和vnc
RUN apt-get install xorg xfce4 xfce4-goodies tightvncserver -y
RUN mkdir -p ~/.vnc && \
    echo "123456" | vncpasswd -f > ~/.vnc/passwd && \
    chmod 600 ~/.vnc/passwd

# 生成xstartup脚本
RUN echo "" > ~/.vnc/xstartup && \
    echo "#!/bin/bash" > ~/.vnc/xstartup && \
    echo "startxfce4 &" >> ~/.vnc/xstartup && \
    echo "xsetroot -solid grey" >> ~/.vnc/xstartup && \
    chmod +x ~/.vnc/xstartup
# 
RUN alias sudo=""
COPY .bashconfig.sh /root/.bashconfig.sh
RUN chmod +x ~/.bashconfig.sh
RUN echo "\n\
# Customizations added during Docker build\n\
HISTSIZE=30000\n\
HISTFILESIZE=3000000\n\
export GIT_SSL_NO_VERIFY=1\n\
source ~/.bashconfig.sh\n\
" >> /root/.bashrc

# 生成~/.startup.sh脚本
COPY startup.sh /root/.startup.sh
RUN chmod +x /root/.startup.sh
RUN touch /root/.Xauthority && chmod 600 /root/.Xauthority

# RUN echo '#!/bin/bash\n\
# # Your startup commands here\n\
# echo "Hello from ~/.startup.sh!"\n\
# # Example: Start SSH service\n\
# service ssh start\n\
# # Example: Start some other command\n\
# # your_command_here\n
# vncserver :0\n\
# cd\n\
# bash\
# ' > /root/.startup.sh && \
#     chmod +x /root/.startup.sh

# 设置容器在启动时执行~/.startup.sh脚本,CMD可覆盖
# CMD ["/bin/bash", "/root/.startup.sh"]
# ENTRYPOINT ["/root/.startup.sh","/bin/bash"]
# 使用ENTRYPOINT指定默认执行命令
ENTRYPOINT ["/root/.startup.sh"]


# 使用CMD提供默认参数
# CMD ["/bin/bash /root/.startup.sh"]

