# docker_reverse_proxy
Working Simple Docker Reverse Proxy Nginx Server with docker-compose file.

After cloning the repo into the folder /appl all paths are already set up correctly. Adapt if you clone into another Location.
simply change the servername to your domain and the proxy_pass http://example.com to your backend.
Now go to the /appl/docker_reverse_proxy/ folder and type in "docker-compose up -d" this will start the container and fire everything up.

If this is the only docker container you can use the rerun.sh script with -x to shutdown all docker containers and remove them.
to change config simply run the rerun.sh script without parameters. Please be careful the script will take any docker container it can find a more elaborate version will be provided in the future. 

BR John
