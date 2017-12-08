FROM resin/%%RESIN_MACHINE_NAME%%-python


# Set our working directory
WORKDIR /usr/src/app



# Copy requirements.txt first for better cache on later pushes
#COPY ./requirements.txt /requirements.txt

# pip install python deps from requirements.txt on the resin.io build server
#RUN pip install -r /requirements.txt

# This will copy all files in our root to the working  directory in the container
COPY . ./

# switch on systemd init system in container
ENV INITSYSTEM on

# main.py will run when container starts up on the device
#CMD ["python","src/main.py"]





# Install Python.
#RUN apt-get update && apt-get install -y python python-pip python-dev && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN pip install RPi.GPIO

#COPY . /app

# Start blink app
CMD ["python", "/app/ldr_muller_mod.py"]
