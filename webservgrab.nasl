# Old Code 2006
# http://www.infointox.net/?paged=23


#####################################################################
# Name: webserv-naslgrab.nasl					    #
# Description: A non-intrusive way to grab the web server version   #
#              by sending opening a socket to 80 and sending a      #
#	       HEAD Request. This can be modified to use other      #
#	       ports.                                               #
# Version: .1                                                       #
# Author : Devin Ertel                                              #
# Usage	 : nasl -t 192.168.1-155 webserv-naslgrab.nasl              #
#####################################################################
 
#Create tcp socket to port 80
soc = open_sock_tcp(80);
 
#grab host ip of current box with socket open
hostip=get_host_ip();
 
#if socket was created
if (soc) {
 
#create string and send
str = string("HEAD / HTTP/1.0\r\n\r\n");
send(socket:soc, data:str);
 
#grab data from the socket
name = recv(socket:soc, length:1024);
 
#grep for the line with server in it
server = egrep(pattern:"Server.*", string : name);
 
#if grep returns value
if(server){
display(server," On IP ",hostip,"\n");
}
 
#close socket
close(soc);
}
