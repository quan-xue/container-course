FROM python:3.7
## build
#build argument
ARG APP_DIR=/app

WORKDIR ${APP_DIR}

# copy files from local into image
ADD main.py .
ADD utils.py .
ADD requirements.txt .
ADD public public
ADD templates templates

# install dependencies
RUN pip3 install -r requirements.txt

## run
#run environment variables
ENV APP_DIR=/app
ENV PORT=3000

# what are the required ports
EXPOSE ${PORT}

WORKDIR ${APP_DIR}

# run the app
ENTRYPOINT python main.py

# CMD ["--port", "3000]
