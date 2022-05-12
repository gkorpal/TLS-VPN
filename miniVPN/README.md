A Virtual Private Network (VPN) implementation consists of two parts: building a tunnel and securing the tunnel. In this project I implemented a VPN in which an IP tunnel at the transport layer is built using TUN/TAP, and the tunnel is secured using TLS/SSL (traffic encryption and server authentication) and shadow file (user authentication).

The book, "Computer \& Internet Security: A Hands-on Approach" by Wenliang Du, served as a great resource. Following is the VM network setup:

![VM](/miniVPN/Host2Gateway.jpg)

We will get the following VPN tunnel:

![tunnel](/miniVPN/ClientServerTunnel.jpg)
