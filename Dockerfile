# Use a base image with Python and Pandoc preinstalled
FROM pandoc/core

# Install any additional dependencies or tools your project needs
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    # Add other dependencies here

# Copy your project files into the container
COPY . /app
WORKDIR /app

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Specify the command to run when the container starts
CMD ["python3", "convert.py"]
