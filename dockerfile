FROM openjdk:17-jdk-alpine
ADD target/demo-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 7081
ENTRYPOINT ["java", "-jar", "/demo.jar"]
# Use a lightweight OpenJDK 17 base image
FROM openjdk:17-jdk-alpine

# Install required dependencies (git, ssh client)
RUN apk add --no-cache \
    git \
    openssh

# Set up SSH for cloning private repositories securely
# Copy the private SSH key (replace 'id_rsa' with your private key filename)
COPY ./id_rsa /root/.ssh/id_rsa

# Set permissions for the private key
RUN chmod 600 /root/.ssh/id_rsa

# Disable strict host key checking
RUN echo "Host *\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile=/dev/null" >> /root/.ssh/config

# Clone your private repository
RUN git clone https://github.com/dharanibeena123/Dockerize.git /app

# Ensure dependencies are installed (optional for Java projects)
# If you are using Maven, uncomment this line
git RUN mvn clean install

# Expose the application port
EXPOSE 7081
ADD target/demo-0.0.1-SNAPSHOT.jar demo.jar
ENTRYPOINT ["java", "-jar", "/demo.jar"]
