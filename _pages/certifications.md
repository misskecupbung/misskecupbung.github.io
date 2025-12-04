---
layout: page
permalink: /certifications/
title: certifications
description: Professional certifications and badges from Credly
nav: true
nav_order: 6
---

<div class="certifications">
  <p class="mb-4">
    View all my certifications on <a href="https://www.credly.com/users/anandadwir" target="_blank">Credly</a>.
  </p>

  {% if site.data.credly_badges and site.data.credly_badges.size > 0 %}
  <div class="row row-cols-1 row-cols-md-3 g-4">
    {% for badge in site.data.credly_badges %}
    <div class="col">
      <div class="card h-100">
        <a href="{{ badge.badge_url }}" target="_blank">
          <img src="{{ badge.image_url }}" class="card-img-top p-3" alt="{{ badge.name }}" style="max-height: 200px; object-fit: contain;">
        </a>
        <div class="card-body">
          <h5 class="card-title">
            <a href="{{ badge.badge_url }}" target="_blank">{{ badge.name }}</a>
          </h5>
          <p class="card-text text-muted small">{{ badge.issuer }}</p>
          {% if badge.issued_at %}
          <p class="card-text small">
            <i class="fa-solid fa-calendar"></i> 
            {{ badge.issued_at | date: "%b %Y" }}
            {% if badge.expires_at %}
              - {{ badge.expires_at | date: "%b %Y" }}
            {% endif %}
          </p>
          {% endif %}
        </div>
      </div>
    </div>
    {% endfor %}
  </div>
  {% else %}
  <!-- Fallback: Show embedded Credly badges -->
  <div class="row row-cols-1 row-cols-md-4 g-4">
    <div class="col text-center">
      <div data-iframe-width="150" data-iframe-height="270" data-share-badge-id="your-badge-id" data-share-badge-host="https://www.credly.com"></div>
    </div>
  </div>
  
  <h3 class="mt-5">Certifications</h3>
  <ul class="list-group list-group-flush">
    <li class="list-group-item"><i class="fa-solid fa-cloud me-2"></i> HashiCorp Terraform Associate (003)</li>
    <li class="list-group-item"><i class="fa-brands fa-aws me-2"></i> AWS Solutions Architect Associate</li>
    <li class="list-group-item"><i class="fa-brands fa-aws me-2"></i> AWS Cloud Practitioner</li>
    <li class="list-group-item"><i class="fa-brands fa-google me-2"></i> Google Professional Cloud Architect</li>
    <li class="list-group-item"><i class="fa-brands fa-google me-2"></i> Google Associate Cloud Engineer</li>
    <li class="list-group-item"><i class="fa-brands fa-microsoft me-2"></i> Microsoft Azure Administrator (AZ-104)</li>
    <li class="list-group-item"><i class="fa-brands fa-microsoft me-2"></i> Microsoft Azure Fundamentals (AZ-900)</li>
    <li class="list-group-item"><i class="fa-brands fa-linux me-2"></i> Linux Foundation LFCS</li>
    <li class="list-group-item"><i class="fa-brands fa-linux me-2"></i> Linux Foundation LFCA</li>
    <li class="list-group-item"><i class="fa-solid fa-shield me-2"></i> CompTIA Security+</li>
    <li class="list-group-item"><i class="fa-solid fa-server me-2"></i> Certified OpenStack Administrator (COA)</li>
    <li class="list-group-item"><i class="fa-solid fa-cloud me-2"></i> Oracle Cloud Foundations Associate</li>
    <li class="list-group-item"><i class="fa-solid fa-cloud me-2"></i> Oracle Cloud Operations Associate</li>
    <li class="list-group-item"><i class="fa-solid fa-cloud me-2"></i> Alibaba Cloud ACA Security</li>
    <li class="list-group-item"><i class="fa-solid fa-cloud me-2"></i> Alibaba Cloud ACA Cloud Computing</li>
    <li class="list-group-item"><i class="fa-solid fa-network-wired me-2"></i> MikroTik MTCNA, MTCRE, MTCWE, MTCSE, MTCTCE, MTCUME, MTCINE</li>
  </ul>
  {% endif %}
</div>

<script type="text/javascript" async src="//cdn.credly.com/assets/utilities/embed.js"></script>
