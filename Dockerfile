# Using lightweight alpine image
FROM python:3.8-alpine

# Installing packages
RUN apk update
RUN pip install --no-cache-dir pipenv

# Defining working directory and adding source code
WORKDIR /usr/src/app
COPY cashman ./cashman

# Install API dependencies
RUN pipenv install --system --deploy

# Start app
EXPOSE 5001
ENTRYPOINT ["/usr/src/app/bootstrap.sh"]