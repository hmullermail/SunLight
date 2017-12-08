FROM resin/%%RESIN_MACHINE_NAME%%-python


# Install Python.
RUN apt-get update && apt-get install -y python python-pip python-dev && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN pip install RPi.GPIO

COPY . /app

# Start blink app
CMD ["python", "/app/ldr_muller_mod.py"]
