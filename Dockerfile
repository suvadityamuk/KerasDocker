FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
git \
curl \
ca-certificates \
python3 \
python3-pip \
sudo \
&& rm -rf /var/lib/apt/lists/*

RUN useradd -m docker_runner

RUN chown -R docker_runner:docker_runner /home/docker_runner

COPY --chown=docker_runner *.* /home/docker_runner/flask_app/keras-docker-trial/

USER docker_runner

RUN mkdir /home/docker_runner/data

WORKDIR /home/docker_runner/flask_app/keras-docker-trial

RUN cd /home/docker_runner/flask_app/keras-docker-trial && pip install --no-cache-dir -r requirements.txt

ENV PATH="${PATH}:/home/docker_runner/.local/bin"

ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:5000", "--workers=4", "app:app"]

EXPOSE 5000