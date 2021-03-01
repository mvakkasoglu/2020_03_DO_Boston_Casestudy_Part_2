# base image
FROM alpine:3.5 
#set a working directory to copy files to
WORKDIR /usr/src/app
# copy all the files to the working directory
COPY . /usr/src/app/
RUN apk add --update py2-pip
# install dependencies
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt
# expose the port number (container
EXPOSE 5000
CMD ["python", "/usr/src/app/web.py"]
