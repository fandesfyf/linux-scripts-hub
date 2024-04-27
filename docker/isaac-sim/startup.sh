#!/bin/bash
echo "Hello from ~/.startup.sh!"
service ssh start
vncserver :0
cd
bash
