#CS2080: Programming with Unix, Assignment 7 DockerFile
#Holder, Joshua
#DUE 20250410

#Extend from the ubuntu page.
FROM ubuntu

#Install and update vim and nginx using one RUN line.
RUN apt-get update && apt-get install -y vim nginx

#Copy the script into the docker container.
COPY Holder_App.sh /Holder_App.sh

#Make the script executable to avoid having to do in terminal.
RUN chmod +x /Holder_App.sh

#Run the attached script once the container becomes a process.
CMD ["/Holder_App.sh"]