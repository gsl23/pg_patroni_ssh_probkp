FROM postgres:14.9-alpine

RUN apk add --no-cache --virtual .build-deps g++ py3-pip python3-dev libffi-dev openssl-dev openssh sudo pg_probackup && \
    apk add --no-cache --update python3 && \
    pip3 install --upgrade pip setuptools
RUN pip3 install wheel

COPY ./requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt

# RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

RUN echo -n 'root:secret' | chpasswd

RUN echo "postgres ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


# USER root 
RUN ssh-keygen -A

# USER postgres
COPY ./patroni.yml /patroni.yml

COPY ./ssh_patr_start.sh /ssh_patr_start.sh

ENTRYPOINT ["/ssh_patr_start.sh" ]
