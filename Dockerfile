FROM ubuntu:16.04

ENV http_proxy=http://10.158.100.6:8080/
ENV https_proxy=https://10.158.100.6:8080/

RUN apt-get update -y &&\ 
    apt-get install -y git python python-dev python-pip
    
RUN git clone https://bitbucket.org/azneita/devops-challenge.git /webapps/devops &&\
    pip install -r /webapps/devops/requirements.txt
    
RUN useradd devops &&\
    chown -Rf devops:devops /webapps/devops
    
EXPOSE 5000

USER devops

CMD ["python", "/webapps/devops/app.py"]


