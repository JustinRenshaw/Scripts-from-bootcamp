#!/bin/bash

#cleanup tmp 
rm -rf /tmp/*
rm -rf /var/tmp/*

# clear apt cache
apt clean -y

# Clear thumbnail cache for sysadmin, instructor, and student
rm -rf /home/sysadmin/.cache/thumbnails
rm -rf /home/instructor/.cache/thumbnails
rm -rf /home/student/.cache/thumbnails
rm -rf /root/.cache/thumbnails
