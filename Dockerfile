FROM gitpod/workspace-full-vnc

# Install dependencies for Chrome
RUN sudo apt-get update \
 && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
   libgtk2.0-0 \
   libgtk-3-0 \
   libnotify-dev \
   libgconf-2-4 \
   libnss3 \
   libxss1 \
   libasound2 \
   libxtst6 \
   xauth \
   xvfb \
   iptables \
 && sudo rm -rf /var/lib/apt/lists/*

# Enable user namespaces
RUN echo 'kernel.unprivileged_userns_clone=1' | sudo tee -a /etc/sysctl.conf && \
    sudo sysctl -p

# Ensure that Docker is running with user namespace support
RUN sudo dockerd --userns-remap=default &

# Set the working directory
WORKDIR /workspace

# Your additional commands can go here
