[Home](README.md) | [Sprint 3](./sprint-3/README.md)

---

<p align="right">
    <img src="./.assets/logo-02.png" width="140x" />
</p>

# Knixat Cloud DevOps - Group Repository

## Collaboratively design a virtual network and implement network security rules for a 3 tier architecture using Terraform
- The design for our 3-Tier architecture include the:
  - Client facing/Presentation Tier which accepts the end user requests and serves them with the web pages/ application UI. This could be our loadbalancer e.g., Nginx server. We will only accept inbound traffic from the internet on port 80 and 443 on this tier.
  - The Application Tier is the second one. We will assume the use of a Tomcat server in hosting our web application listening on port 8080. We will only accept inbound traffic on this server on port 8080 and from the private IP address of the Nginx server.
  - The Database Tier is the third one. We will assume we are making use of an MySQL database which communicates by default on port 3306. We will ensure that only inbound traffic from the Tomcat server's private IP is able to communicate on this port.

<br> Please see the architectural diagram to represent our 3-Tier application below.

---

<p align="left">
    <img src="./.assets/logo-03.png" width="50x" />
</p>

**Contact Us:**  
Email: [admissions@knixat.com](mailto:admissions@email.com)  
Website: [www.knixat.com](https://www.knixat.com)

&copy; 2023 Knixat. All Rights Reserved.

---

[Home](README.md) | [Sprint 3](./sprint-3/README.md)
