# Use python:3.9 as the base image
FROM python:3.9

# Set the working directory to /app
WORKDIR /app

# Copy the backend code and install dependencies
COPY . /app
RUN pip install --no-cache-dir -r requirements.txt

# Install Prisma CLI
RUN npm install -g prisma

# Expose port 8000
EXPOSE 8000

# Set the entrypoint to gunicorn
ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:8000", "my_project.wsgi:application"]
