# Step 1: Use an official Python runtime as a parent image
# Project description specifies Python 3.10
FROM python:3.10-slim

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy the requirements file into the working directory
COPY requirements.txt .

# Step 4: Install any needed packages specified in requirements.txt
# requirements.txt includes flask and pymysql [cite: 1]
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the application code into the working directory
# app.py is the main application file
COPY app.py .

# Step 6: Make port 5000 available to the world outside this container
# app.py runs on port 5000
EXPOSE 5000

# Step 7: Define environment variables (if any are needed at build time or as defaults)
# app.py uses DB_HOST, DB_USER, DB_PASSWORD, DB_NAME environment variables
# These are best set at runtime (e.g., via docker run -e or docker-compose.yaml)
# but you can set defaults here if needed:
# ENV DB_HOST=mysql
# ENV DB_USER=root
# ENV DB_PASSWORD=password
# ENV DB_NAME=app_db

# Step 8: Run app.py when the container launches
# The command to run the Flask app is "python app.py" as seen in the if __name__ == '__main__': block
CMD ["python", "app.py"]
