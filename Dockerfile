# Base image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install dependencies
ARG REQUIREMENTS=requirements-freeze.txt
COPY requirements.txt .
COPY requirements-freeze.txt .
RUN pip install --no-cache-dir -r $REQUIREMENTS

# Copy project files
COPY . .

# Expose the port
EXPOSE 5000

# Run the application
CMD ["python", "run.py"]
