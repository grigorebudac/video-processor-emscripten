#!/bin/bash

# Define your project name and output folder
PROJECT_NAME=video_processor
OUTPUT_FOLDER=dist

# Ensure the Docker container is running
docker-compose -p $PROJECT_NAME up -d

# Compile main.cpp inside the container
docker-compose -p $PROJECT_NAME exec -T $PROJECT_NAME bash -c "cd /build && make"

# Copy dist folder to the test website
cp -r ./dist/* ./www