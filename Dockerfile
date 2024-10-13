# Use a base image with X11 support
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && \
    apt-get install -y \
    openbox \
    xorg \
    xfce4-terminal \
    novnc \
    websockify \
    supervisor \
    && apt-get clean

# Set up noVNC
RUN mkdir -p /var/run/novnc && \
    mkdir -p /etc/supervisor/conf.d

# Copy the supervisor config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose ports
EXPOSE 6080

# Start supervisord
CMD ["/usr/bin/supervisord"]
