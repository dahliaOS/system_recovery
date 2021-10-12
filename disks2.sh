lsblk --output NAME,LABEL,MODEL -nr | awk '{print $2}'
