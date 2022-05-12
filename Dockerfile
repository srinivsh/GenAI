FROM tensorflow/tensorflow

RUN apt-get update
RUN apt-get install -y unzip graphviz

RUN pip install --upgrade pip

WORKDIR /app

COPY ./requirements.txt /app
RUN pip install -r /app/requirements.txt

COPY /models/. /app/models
COPY /utils/. /app/utils
COPY /notebooks/. /app/notebooks
COPY /scripts/. /app/scripts

COPY /setup.cfg /app

ENV PYTHONPATH="${PYTHONPATH}:/app"