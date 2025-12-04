---
layout: page
title: talks
permalink: /talks/
description: Conference talks and presentations
nav: true
nav_order: 3
---

<div class="talks">

## Conference Talks & Presentations

### 2025

<div class="card mb-3">
  <div class="card-body">
    <h5 class="card-title">Advanced Scheduling for AI/ML: Orchestrating Ray Applications with KubeRay and Kueue</h5>
    <p class="card-text text-muted"><i class="fa-solid fa-location-dot"></i> Google Cloud Summit Jakarta 2025</p>
  </div>
</div>

### 2024

<div class="card mb-3">
  <div class="card-body">
    <h5 class="card-title">Multi-Cluster Security with Network Firewall: Consistent Protection for Distributed EKS</h5>
    <p class="card-text text-muted"><i class="fa-solid fa-location-dot"></i> AWS Summit Singapore 2024</p>
  </div>
</div>

### 2021

<div class="card mb-3">
  <div class="card-body">
    <h5 class="card-title">Continuous Delivery using Spinnaker on Azure</h5>
    <p class="card-text text-muted"><i class="fa-solid fa-location-dot"></i> Azure Community Conference 2021</p>
  </div>
</div>

---

## Speaker Deck Presentations

{% if site.data.speakerdeck_presentations and site.data.speakerdeck_presentations.size > 0 %}

<div class="row row-cols-1 row-cols-md-2 g-4 mb-4">
  {% for talk in site.data.speakerdeck_presentations %}
  <div class="col">
    <div class="card h-100">
      {% if talk.image_url %}
      <a href="{{ talk.url }}" target="_blank">
        <img src="{{ talk.image_url }}" class="card-img-top" alt="{{ talk.title }}">
      </a>
      {% endif %}
      <div class="card-body">
        <h5 class="card-title">
          <a href="{{ talk.url }}" target="_blank">{{ talk.title }}</a>
        </h5>
        {% if talk.date %}
        <p class="card-text text-muted small">{{ talk.date }}</p>
        {% endif %}
      </div>
      <div class="card-footer">
        <a href="{{ talk.url }}" target="_blank" class="btn btn-sm btn-outline-primary">
          <i class="fa-solid fa-arrow-up-right-from-square"></i> View Slides
        </a>
      </div>
    </div>
  </div>
  {% endfor %}
</div>
{% else %}
<div class="row row-cols-1 row-cols-md-2 g-4 mb-4">
  <div class="col">
    <div class="card h-100">
      <div class="card-body">
        <h5 class="card-title">
          <a href="https://speakerdeck.com/misskecupbung/how-to-implement-wireless-qos-with-wmm-and-dscp-in-mikrotik" target="_blank">How To Implement Wireless QoS with WMM And DSCP In Mikrotik</a>
        </h5>
        <p class="card-text text-muted small">MikroTik networking presentation</p>
      </div>
      <div class="card-footer">
        <a href="https://speakerdeck.com/misskecupbung/how-to-implement-wireless-qos-with-wmm-and-dscp-in-mikrotik" target="_blank" class="btn btn-sm btn-outline-primary">
          <i class="fa-solid fa-arrow-up-right-from-square"></i> View Slides
        </a>
      </div>
    </div>
  </div>
</div>
{% endif %}

<p>
  <a href="https://speakerdeck.com/misskecupbung" target="_blank" class="btn btn-primary">
    <i class="fa-solid fa-arrow-up-right-from-square"></i> View All on Speaker Deck
  </a>
</p>

</div>
