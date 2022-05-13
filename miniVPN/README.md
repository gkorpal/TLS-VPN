### Introduction
A Virtual Private Network (VPN) implementation consists of two parts: building a tunnel and securing the tunnel. In this project I implemented a VPN in which an IP tunnel at the transport layer is built using TUN/TAP, and the tunnel is secured using TLS/SSL (traffic encryption and server authentication) and shadow file (user authentication).

The book, "Computer \& Internet Security: A Hands-on Approach" by Wenliang Du, served as a great resource. My final VPN server and client programs offer the following functionalities: 
*  TLS/SSL certificate-based authentication of VPN server (checks certificate validity, CA's signature, and identity information).
*  Shadow file-based authentication of the VPN client (matches username and password hash).
*  Encrypted tunnel traffic using AES-256 GCM where each encrypted block contains a MAC generated using SHA-384.


### Platform
All code was tested on SEEDUbuntu 16.04 32bit Virtual Machines running on VirtualBox 6.0.4. The compilation and run instructions are available in the following README files accompanying the code. Following is the VM network setup:

![VM](/miniVPN/Host2Gateway.jpg)

### Run the VPN
Make sure that all the three VMs are configured properly. If not, then we can run the shell scripts `intnet-V.sh` and `intnet-G.sh` in Host V and Gateway, respectively. Moreover, the server and CA certificates must be set up properly.

In Gateway, we first compile and run `server.c` program, enter PEM pass phrase `dees` and then run `server-config.sh` (in a separate terminal) which will assign IP address `192.168.53.1/24` to `tun0` interface and enable routing capabilities of the server.

Next, in Host U, we first compile and run `client.c` program. It authenticates the server using `ca_cert` and then asks for username and password from server's shadow file (here, `seed` and `dees`, respectively).

Once the user authentication is done, we can run `client-config.sh` (in a separate terminal) to assign IP address `192.168.53.5/24` to `tun0` interface and assign `tun0` for packets destined to the private network `192.168.60.0/24`.

We will get the following secure VPN tunnel:

![tunnel](/miniVPN/ClientServerTunnel.jpg)

### Testing

VPN can be tested by using Wireshark to observe packets for `ping` and `telnet` operation between Host U (VPN client) and Host V (client on private network) via Gateway (VPN server).
