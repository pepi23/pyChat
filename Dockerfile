# TODO: we need this to get Python 3 at least 3.4; remove when 21 becomes "the" fedora docker image
FROM fedora:21

WORKDIR /srv
RUN yum -y install python-virtualenv && virtualenv "pyChat"

ADD . /srv/pyChat/pyChat
RUN cd "pyChat" && source bin/activate && pip install -r "pyChat/requirements.txt"


EXPOSE 8000
CMD source /srv/pyChat/bin/activate && \
 /srv/pyChat/pyChat/manage.py runserver 0.0.0.0:8000
