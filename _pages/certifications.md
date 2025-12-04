---
layout: page
permalink: /certifications/
title: Certifications
description: Cloud, DevOps, and networking certifications from AWS, Google, Azure, HashiCorp, Linux Foundation, and MikroTik
nav: true
nav_order: 6
---

<div class="certifications">

## Professional Certifications

<div class="text-center mb-4">
  <a href="https://www.credly.com/users/anandadwir/badges" target="_blank" class="btn btn-primary btn-lg">
    <i class="fa-solid fa-certificate me-2"></i> View on Credly
  </a>
</div>

{% if site.data.credly_badges and site.data.credly_badges.size > 0 %}

<div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 g-4 mb-5">
  {% for badge in site.data.credly_badges %}
  <div class="col">
    <div class="card h-100 text-center cert-card">
      <a href="{{ badge.badge_url }}" target="_blank" class="cert-link">
        <img src="{{ badge.image_url }}" class="card-img-top p-3" alt="{{ badge.name }}">
        <div class="card-body p-2">
          <p class="card-title mb-1">{{ badge.name }}</p>
          <p class="card-text text-muted">{{ badge.issuer }}</p>
        </div>
      </a>
    </div>
  </div>
  {% endfor %}
</div>

{% else %}

<div class="cert-section">
<h3><i class="fa-solid fa-cloud me-2"></i>Cloud Platforms</h3>

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

</div>

<div class="cert-section">
<h3><i class="fa-brands fa-linux me-2"></i>Linux & Security</h3>

| Certification                           | Issuer               |
| --------------------------------------- | -------------------- |
| Linux Foundation LFCS                   | Linux Foundation     |
| Linux Foundation LFCA                   | Linux Foundation     |
| CompTIA Security+                       | CompTIA              |
| Certified OpenStack Administrator (COA) | OpenStack Foundation |

</div>

<div class="cert-section">
<h3><i class="fa-solid fa-network-wired me-2"></i>Networking</h3>

| Certification   | Issuer   |
| --------------- | -------- |
| MikroTik MTCNA  | MikroTik |
| MikroTik MTCRE  | MikroTik |
| MikroTik MTCWE  | MikroTik |
| MikroTik MTCSE  | MikroTik |
| MikroTik MTCTCE | MikroTik |
| MikroTik MTCUME | MikroTik |
| MikroTik MTCINE | MikroTik |

</div>

{% endif %}

</div>

<style>
.certifications h2 {
  font-size: 1.75rem;
  font-weight: 600;
  margin-bottom: 1.5rem;
  color: var(--global-theme-color);
  text-align: center;
}

.certifications h3 {
  font-size: 1.25rem;
  font-weight: 600;
  margin-top: 2rem;
  margin-bottom: 1rem;
  color: var(--global-theme-color);
}

.cert-card {
  border: none;
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.cert-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

.cert-card .card-img-top {
  max-height: 120px;
  object-fit: contain;
}

.cert-card .card-title {
  font-size: 0.8rem;
  font-weight: 500;
  line-height: 1.3;
  color: var(--global-text-color);
}

.cert-card .card-text {
  font-size: 0.7rem;
}

.cert-link {
  text-decoration: none;
}

.cert-link:hover .card-title {
  color: var(--global-theme-color);
}

.certifications .btn-primary {
  border-radius: 25px;
  padding: 0.75rem 2rem;
}

.cert-section {
  margin-bottom: 2rem;
}

.certifications table {
  font-size: 0.95rem;
}
</style>
