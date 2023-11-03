[Home](README.md) | [Sprint 7](./sprint-7/README.md)

---

<p align="right">
    <img src="../.assets/logo-02.png" width="140x" />
</p>

# Knixat Cloud DevOps - Group Repository

## Evaluate, compare, and document the performance and cost implications of different Azure storage types (Blob, File share, Queues, Tables) for a common use case within the group.

### Scenario:
Building a social media platform where users can upload images and videos, share them with their followers, and interact with content through comments and likes. The application needs to provide fast and scalable access to media files, efficient metadata storage, and handle asynchronous tasks such as notifications and message queuing.

#### Azure Blob:
Azure Blob Storage for the case Scenario of storing binary large objects (BLOBs) such as images and videos.


#### Performance:
Azure Blob Storage is well-suited for storing binary large objects like images and videos. It provides high performance for reading and writing large media files.
It can be further optimized for performance by integrating it with Content Delivery Networks (CDN), which enable fast content distribution to users across the globe. CDNs cache and deliver content from edge locations, reducing latency and improving user experience.

#### Cost Implications:
Azure Blob Storage is cost-effective and flexible in terms of pricing.
It offers tiered storage options, which include:
Hot storage: Designed for frequently accessed data. It's suitable for media files that are actively used and accessed.
Cool storage: Intended for data that is accessed less frequently but still needs to be readily available. It offers lower storage costs compared to hot storage.
Archive storage: Ideal for data that is rarely accessed but needs to be retained for compliance or backup purposes. It provides the lowest storage costs but has longer retrieval times.


Using Azure Blob Storage with a combination of hot and cool storage tiers, along with a Content Delivery Network (CDN), is indeed an effective approach for storing and delivering images and videos in a social media platform. This setup allows you to balance performance and cost, ensuring that frequently accessed content is readily available while keeping storage expenses in check.


### Azure File Shares

File shares provide a fully managed file sharing service that allows users to share files with each other over the internet. File shares are a good choice for storing user-generated content, such as profile pictures and post attachments, that needs to be accessed frequently.

#### Performance:

Azure File Shares offer good performance for reading and writing small files, which makes them suitable for scenarios where you need to access user-generated content frequently. For example, profile pictures and post attachments can be efficiently stored and retrieved using file shares.
However, Azure File Shares may not be the best choice for streaming large media files, such as high-definition videos. In such cases, Azure Blob Storage is a more performant option because it's optimized for serving large binary files to users. Blob Storage can handle media files more efficiently and with lower latency.


#### Suitability:

Azure File Shares are well-suited for storing user-generated content in a social media platform. This content often includes small files like profile pictures, documents, and smaller images, where performance is more than adequate.
For larger media files, like videos, it's generally recommended to use Azure Blob Storage. Blob Storage can handle the efficient storage and delivery of media files and is specifically designed for such use cases.


#### Cost Implication:

Azure File Shares are more expensive than Azure Blob Storage, but they are still relatively affordable compared to other storage options.
The cost of Azure File Shares is typically based on the amount of data stored and the number of transactions performed. Therefore, the cost can increase as the amount of data and the level of activity in your file shares grow.
It's essential to consider both storage costs and transaction costs when using Azure File Shares, especially if your platform experiences significant user-generated content and interactions.


In summary, Azure File Shares are a suitable choice for storing user-generated content like profile pictures and post attachments that are frequently accessed. However, for large media files, it's advisable to use Azure Blob Storage due to its superior performance in handling streaming and serving of such content. The choice between these two options depends on your specific use case and the performance requirements of your social media platform. Cost considerations should also be taken into account when making this decision.

---

<p align="left">
    <img src="../.assets/logo-03.png" width="50x" />
</p>

**Contact Us:**  
Email: [admissions@knixat.com](mailto:admissions@email.com)  
Website: [www.knixat.com](https://www.knixat.com)

&copy; 2023 Knixat. All Rights Reserved.

---

[Home](README.md) | [Sprint 7](./sprint-7/README.md)