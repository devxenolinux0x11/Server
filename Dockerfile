# Use an official Ubuntu base image
FROM ubuntu:latest

# Update the package list and install necessary GUI dependencies
RUN apt-get update && \
    apt-get install -y xorg xserver-xorg-video-dummy x11-apps && \
    apt-get install -y --no-install-recommends desktop-base

# Install a desktop environment (optional based on your needs)
#RUN apt-get install -y ubuntu-gnome-desktop

# Install additional tools if needed
RUN apt-get install -y curl wget

# Set up the display environment variables
ENV DISPLAY :0
ENV XAUTHORITY /tmp/.X11-unix/XAUTHORITY

# Create a directory for X11 socket
RUN mkdir -p /tmp/.X11-unix

# Copy any necessary files or scripts
# COPY your-gui-app /

# Expose the necessary ports for GUI
EXPOSE 6000

# Start the X server
CMD ["startx"]
