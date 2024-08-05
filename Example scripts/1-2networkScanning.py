import socket
import nmap

target = "example.com"
nm = nmap.PortScanner()

nm.scan(target, '1-1024')

for host in nm.all_hosts():
    print(f"Host: {host}")
    for proto in nm[host].all_protocols():
        ports = nm[host][proto].keys()
        for port in ports:
            print(f"Port: {port} - State: {nm[host][proto][port]['state']}")

for port in range (1, 1025):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(1)
    result = sock.connect_ex((target, port))
    if result == 0:
        print(f"Port {port} is open")
    sock.close()