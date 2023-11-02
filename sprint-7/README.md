[Home](README.md) | [Sprint 7](./sprint-1/README.md)

---

<p align="right">
    <img src="./.assets/logo-02.png" width="140x" />
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


---

<p align="left">
    <img src="./.assets/logo-03.png" width="50x" />
</p>

**Contact Us:**  
Email: [admissions@knixat.com](mailto:admissions@email.com)  
Website: [www.knixat.com](https://www.knixat.com)

&copy; 2023 Knixat. All Rights Reserved.

---

[Home](README.md) | [Sprint 7](./sprint-1/README.md)