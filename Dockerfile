FROM quay.io/operator-framework/ansible-operator:v1.32.0

USER ${USER_UID}

# Copy Ansible Operator files
COPY requirements.yml ${HOME}/requirements.yml
RUN ansible-galaxy collection install -r ${HOME}/requirements.yml \
 && chmod -R ug+rwx ${HOME}/.ansible

COPY watches.yaml ${HOME}/watches.yaml
COPY roles/ ${HOME}/roles/
COPY playbooks/ ${HOME}/playbooks/
COPY files/ueransim.tgz ${HOME}/
COPY files/kconfig ${HOME}/config
COPY files/values.yaml ${HOME}/

#USER root
#RUN yum -y update
#RUN yum -y install git
#USER 1001
