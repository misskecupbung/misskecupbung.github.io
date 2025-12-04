---
layout: page
title: talks
permalink: /talks/
description: Conference talks and presentations from Speaker Deck
nav: true
nav_order: 3
---

<div class="talks">
  <p class="mb-4">
    View all my presentations on <a href="https://speakerdeck.com/misskecupbung" target="_blank">Speaker Deck</a>.
  </p>

{% if site.data.speakerdeck_presentations and site.data.speakerdeck_presentations.size > 0 %}

  <div class="row row-cols-1 row-cols-md-2 g-4">
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
          <p class="card-text text-muted small">
            <i class="fa-solid fa-calendar"></i> {{ talk.date | date: "%B %Y" }}
          </p>
          {% endif %}
        </div>
        <div class="card-footer">
          <a href="{{ talk.url }}" target="_blank" class="btn btn-sm btn-outline-primary">
            <i class="fa-solid fa-presentation-screen"></i> View Slides
          </a>
        </div>
      </div>
    </div>
    {% endfor %}
  </div>
  {% else %}
  <!-- Fallback: Featured talks -->
  <h3>Featured Talks</h3>
  <div class="row row-cols-1 row-cols-md-2 g-4">
    <div class="col">
      <div class="card h-100">
        <div class="card-body">
          <h5 class="card-title">Advanced Scheduling for AI/ML: Orchestrating Ray Applications with KubeRay and Kueue</h5>
          <p class="card-text text-muted">Google Cloud Summit Jakarta 2025</p>
        </div>
      </div>
    </div>
    <div class="col">
      <div class="card h-100">
        <div class="card-body">
          <h5 class="card-title">Multi-Cluster Security with Network Firewall: Consistent Protection for Distributed EKS</h5>
          <p class="card-text text-muted">AWS Summit Singapore 2024</p>
        </div>
      </div>
    </div>
    <div class="col">
      <div class="card h-100">
        <div class="card-body">
          <h5 class="card-title">Continuous Delivery using Spinnaker on Azure</h5>
          <p class="card-text text-muted">Azure Community Conference 2021</p>
        </div>
      </div>
    </div>
  </div>
  
  <p class="mt-4">
    <a href="https://speakerdeck.com/misskecupbung" target="_blank" class="btn btn-primary">
      <i class="fa-solid fa-arrow-up-right-from-square"></i> View All Talks on Speaker Deck
    </a>
  </p>
  {% endif %}
</div>
