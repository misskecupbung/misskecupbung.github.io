---
layout: page
permalink: /certifications/
title: certifications
description: Professional certifications and credentials
nav: true
nav_order: 6
---

<div class="certifications">

## Professional Certifications

<p class="mb-4">
  View all my verified credentials on <a href="https://www.credly.com/users/anandadwir/badges" target="_blank">Credly</a>.
</p>

{% if site.data.credly_badges and site.data.credly_badges.size > 0 %}

<div class="row row-cols-2 row-cols-md-4 g-4 mb-5">
  {% for badge in site.data.credly_badges %}
  <div class="col">
    <div class="card h-100 text-center">
      <a href="{{ badge.badge_url }}" target="_blank">
        <img src="{{ badge.image_url }}" class="card-img-top p-2" alt="{{ badge.name }}" style="max-height: 150px; object-fit: contain;">
      </a>
      <div class="card-body p-2">
        <p class="card-text small mb-0">
          <a href="{{ badge.badge_url }}" target="_blank">{{ badge.name }}</a>
        </p>
        <p class="card-text text-muted" style="font-size: 0.7rem;">{{ badge.issuer }}</p>
      </div>
    </div>
  </div>
  {% endfor %}
</div>
{% else %}

### Cloud Platforms

| Certification                          | Issuer              |
| -------------------------------------- | ------------------- |
| HashiCorp Terraform Associate (003)    | HashiCorp           |
| AWS Solutions Architect Associate      | Amazon Web Services |
| AWS Cloud Practitioner                 | Amazon Web Services |
| Google Professional Cloud Architect    | Google Cloud        |
| Google Associate Cloud Engineer        | Google Cloud        |
| Microsoft Azure Administrator (AZ-104) | Microsoft           |
| Microsoft Azure Fundamentals (AZ-900)  | Microsoft           |
| Oracle Cloud Foundations Associate     | Oracle              |
| Oracle Cloud Operations Associate      | Oracle              |
| Alibaba Cloud ACA Security             | Alibaba Cloud       |
| Alibaba Cloud ACA Cloud Computing      | Alibaba Cloud       |

### Linux & Security

| Certification                           | Issuer               |
| --------------------------------------- | -------------------- |
| Linux Foundation LFCS                   | Linux Foundation     |
| Linux Foundation LFCA                   | Linux Foundation     |
| CompTIA Security+                       | CompTIA              |
| Certified OpenStack Administrator (COA) | OpenStack Foundation |

### Networking

| Certification   | Issuer   |
| --------------- | -------- |
| MikroTik MTCNA  | MikroTik |
| MikroTik MTCRE  | MikroTik |
| MikroTik MTCWE  | MikroTik |
| MikroTik MTCSE  | MikroTik |
| MikroTik MTCTCE | MikroTik |
| MikroTik MTCUME | MikroTik |
| MikroTik MTCINE | MikroTik |

{% endif %}

</div>
