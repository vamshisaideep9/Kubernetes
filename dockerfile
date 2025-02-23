#Light-weight base image
FROM python:3.9-slim

#Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

#Copy only the required files
COPY ./requirements.txt /app/requirements.txt
COPY app.py /app/
COPY templates /app/templates
COPY static /app/static

#Install python dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r /app/requirements.txt

#Expose the port the app runs on
EXPOSE 5000

#Run the application
CMD ["python", "app.py"]


