# Use an official Ubuntu image as the base image
FROM ubuntu:20.04

# Install necessary dependencies including curl
RUN apt-get update
RUN apt-get install -y curl gnupg
RUN apt-get install -y wget openjdk-17-jdk 

# Download and install Jenkins
RUN curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | gpg --dearmor -o /usr/share/keyrings/jenkins-archive-keyring.gpg 
RUN echo "deb [signed-by=/usr/share/keyrings/jenkins-archive-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list && \
    apt-get update 
RUN apt-get install -y jenkins

# Expose port 8080 for Jenkins web interface and port 50000 for Jenkins agent communication
EXPOSE 8080 50000

# Start Jenkins on container launch
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]
