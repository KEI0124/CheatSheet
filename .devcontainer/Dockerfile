FROM ubuntu:18.04

# install basic package
RUN apt update && apt-get install -y git curl wget unzip docker.io sudo build-essential gettext-base jq

# install aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# install git lfs
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash && apt-get install git-lfs && git lfs install

RUN curl -L https://packagecloud.io/github/git-lfs/gpgkey | sudo apt-key add -

# git secrets 
RUN git clone https://github.com/awslabs/git-secrets.git && cd git-secrets && make install && cd .. && rm -rf git-secrets

# install packer
RUN apt-get install -y gnupg2 lsb-release software-properties-common && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get install packer

RUN apt update && apt-get install -y python3.7 && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1 && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2 && \
    echo 2 | update-alternatives --config python3 && \
    rm /usr/bin/python3 && \
    sudo ln -s python3.7 /usr/bin/python3

RUN apt update && apt-get install -y python3-pip

RUN pip3 install GitPython

RUN sudo apt-get install -y python3-git 

# install terraform
ARG TERRAFORM_VERSION=1.0.3
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin

# bash history setting
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && echo $SNIPPET >> "/root/.bashrc"