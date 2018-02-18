FROM clojure:lein-2.8.1-alpine

RUN apk --update add git

WORKDIR /grumpy
COPY project.clj .
COPY src         ./src
COPY resources   ./resources

# Build the application
RUN lein deps
RUN lein package

# Initialize application data
RUN echo "nikitonsky" >> grumpy_data/FORCED_USER
RUN echo "http://localhost:8080" >> grumpy_data/HOSTNAME

# Install the ImageMagick
RUN apk add --no-cache file
RUN apk --update add imagemagick


# Default startup command line
CMD ["java", "-jar", "./target/grumpy.jar", "-h", "0.0.0.0"]