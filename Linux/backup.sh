#!/bin/bash

tar cvf /var/backup/home.tar /home

mv /var/backup/home.tar /var/backup/home.01012022.tar

tar cvf /var/backup/system.tar /home
# $(date +%m+%d+%Y) date variable

ls -lh /var/backup > var/backup/file_report.txt

free -h > /var/backup/disk_report.txt

