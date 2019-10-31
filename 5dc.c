/*----------------------------------------------------------------
Assignment No:
Write a program using TCP socket for wired network for following 
a. Say Hello to Each other ( For all students) 
b. File transfer ( For all students) 
c. Calculator (Arithmetic) 
d. Calculator (Trigonometry) 
Demonstrate the packets captured traces using Wireshark Packet Analyzer Tool for peer to peer mode
Roll No.:
Batch:
----------------------------------------------------------------*/

#include<sys/types.h>
#include<sys/socket.h>
#include<stdio.h>
#include<netinet/in.h> 
#include <unistd.h>
#include<string.h> 
#include<strings.h>
#include <arpa/inet.h>
#include <math.h>

//#define buffsize  150
void main()
{
int b,sockfd,sin_size,con,n,len;
//char buff[256];
char operator;
int op1,op2;
double result;
if((sockfd=socket(AF_INET,SOCK_STREAM,0))>0)
printf("socket created sucessfully\n");
//printf("%d\n", sockfd);
struct sockaddr_in servaddr;

servaddr.sin_family=AF_INET;
servaddr.sin_addr.s_addr=inet_addr("127.0.0.1");
servaddr.sin_port=6006;

sin_size = sizeof(struct sockaddr_in);
if((con=connect(sockfd,(struct sockaddr *) &servaddr, sin_size))==0); 
//initiate a connection on a socket
printf("connect sucessful\n");
printf("Enter operation:\n s:Sin \n c: cos \n t: tan\n");
scanf("%c",&operator);
printf("Enter angle:\n");
scanf("%d", &op1);

write(sockfd,&operator,sizeof(operator));
write(sockfd,&op1,sizeof(op1));
printf("Sent op1: %d\n",op1);
read(sockfd,&result,sizeof(result)); 
printf("Operation result from server=%f\n",result);  
close(sockfd);
}

