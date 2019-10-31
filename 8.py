import socket

def resolve(str):
    print ("##### DNS Lookup #####")
    print ('Entered DN:',str)
    
    dnsname = socket.gethostbyname(str)

    print ('Host by Name: ', dnsname)

    dnsaddr = socket.gethostbyaddr(str)

    print ('Host by Address: ', dnsaddr)

i=1
while(i):
    str = input()
    resolve(str)
    print('Do you want to resolve another?')
    up = input()
    if( up!='y'):
        i=0

print('Exiting...')
