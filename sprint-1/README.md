[Home](../README.md) | [Sprint 1](README.md)

---

<p align="right">
    <img src="../.assets/logo-02.png" width="140x" />
</p>

# Knixat Cloud DevOps - Sprint 1

## 1) Compare cloud service providers and present findings.

This report outlines the comparison of various cloud services offered by Azure, AWS (Amazon Web Services), Google Cloud and Alibaba. The comparison table below is organized based on some of the popular services and the nomenclature of the respective cloud provider.


| Services              | Azure         | Amazon Web Services        | Google Cloud Platform   | Alibaba Cloud |
|-----------------------|-----------------------|--------------------------|-----------------------|-----------|
| **Virtual Machines** | Virtual Machines (VMs)|  EC2 Instances  | Compute Engine    | Elastic Compute Service |
| **Container Services** | Azure Kubernetes Service (AKS) | Amazon Elastic Kubernetes Service (EKS)   | Google Kubernets Engine  |Container Services for kuberneet Kubernets (ACK)   |
| **Serverless Computing** | Azure Functions  | AWS Lambda   | Cloud Functions  |  Function Compute 2.0 |
| **Object Storage** | Azure Blob Storage  | AWS Simple Storage Service (S3)   |  Cloud Storage | Object Storage Services  |
| **File Storage** | Azure Files  |Amazon Elastic File System (EFS)   | Google Cloud File Store  | Apsara File Storage NAS  |
| **Database Storage** | Azure Table Storage  | Amazon DynamoDB   |  Google BigTable |Cloud Table Store   |
| **Virtual Network** | Azure Virtual Network  | Amazon Virtual Private Cloud (VPC)   |  Virtual Private Cloud |Virtual Private Cloud   |
| **DNS Service** | Azure DNS  | Amazon Route 53   |   Google Cloud DNS| Cloud DNS Private zone  |



## 2) Create an Azure storage account in your group Azure resource group.

Firstly, the name we chose for our group is **`knixat-group2`** and we have gone ahead to create a Resource Group using the group name. Please see the attached screenshot below showing the **`knixat-group2-rg`** resource group. 

![Image of Storage Account](image/Storage_Account.png)

In a bid to create a Storage account in the **`knixat-group2-rg`** resource group, the following considerations were taken into account.

We came up with an hypothetical project plan to host a web application that delivers images and videos to users, we needed a secure and low-latency storage solution. Our selection criteria for the Azure Storage Account were as follows:

- **Storage Category**: We opted for the "Standard" category since we decided to use Blob Storage over a Virtual Machine.

- **Region Selection**: We chose the "EastUS2" region because it aligns with our target customer base and the location of our test server in the United States. This choice minimizes latency and cost considerations.

- **Redundancy**: For our testing phase, we selected "Local Redundant Storage" as it offers a cost-effective solution with acceptable risk for data loss.

- **Networking**: To enhance security, we enabled public access only from specific Virtual Networks and IP addresses. This ensures that the storage server is accessible only to our application within the same Virtual Network, rather than directly from the internet.

- **Data Protection**: We implemented "soft deletion" and configured a retention period of 7 days for deleted files to safeguard our data.

*By adhering to these selection criteria, we have ensured a robust and cost-effective storage solution that meets the requirements of our web application.*


<p align="left">
    <img src="../.assets/logo-03.png" width="50x" />
</p>

**Contact Us:**
Email: [admissions@knixat.com](mailto:admissions@email.com)
Website: [www.knixat.com](https://www.knixat.com)

&copy; 2023 Knixat. All Rights Reserved.

---

[Home](../README.md) | [Sprint 1](README.md)
