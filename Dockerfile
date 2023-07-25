FROM python:3.11

ENV PYTHONUNBUFFERED=1

ARG WORKDIR=/wd
ARG USER=user

WORKDIR ${WORKDIR}

RUN useradd --system ${USER} && \
    chown --recursive ${USER} ${WORKDIR}

RUN apt update && apt upgrade -y

COPY --chown=${USER} requirements.txt requirements.txt

RUN pip install --upgrade pip && \
    pip install --requirement requirements.txt

COPY --chown=${USER} ./homework__voloshyn__10 homework__voloshyn__10
COPY --chown=${USER} ./app app
COPY --chown=${USER} ./manage.py manage.py

USER ${USER}

VOLUME ${WORKDIR}/db

EXPOSE 8000

RUN python manage.py migrate

ENTRYPOINT ["python", "manage.py", "runserver"]
