---
layout: page
title: Talks
permalink: /talks/
description: Conference presentations at AWS Summit, Google Cloud Summit, and Azure Community Conference
nav: true
nav_order: 3
---

<div class="talks">

{% if site.data.speakerdeck_presentations and site.data.speakerdeck_presentations.size > 0 %}

<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 mb-4">
  {% for talk in site.data.speakerdeck_presentations %}
  <div class="col">
    <div class="card h-100 shadow-sm">
      <div class="card-body d-flex flex-column">
        <h5 class="card-title mb-3">
          <a href="{{ talk.url }}" target="_blank" class="text-decoration-none">{{ talk.title }}</a>
        </h5>
        <div class="mt-auto">
          <a href="{{ talk.url }}" target="_blank" class="btn btn-outline-primary btn-sm">
            <i class="fa-solid fa-presentation-screen me-1"></i> View Slides
          </a>
        </div>
      </div>
    </div>
  </div>
  {% endfor %}
</div>
{% else %}
<p class="text-muted fst-italic">No presentations available at the moment.</p>
{% endif %}

<div class="text-center mt-4 mb-4">
  <a href="https://speakerdeck.com/misskecupbung" target="_blank" class="btn btn-primary btn-lg">
    <i class="fa-brands fa-speaker-deck me-2"></i> View All on Speaker Deck
  </a>
</div>

</div>

<style>
.talks h2 {
  font-size: 1.75rem;
  font-weight: 600;
  margin-bottom: 1.5rem;
  color: var(--global-theme-color);
}

.talks .card {
  border: none;
  border-radius: 12px;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.talks .card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15) !important;
}

.talks .card-title {
  font-size: 1rem;
  font-weight: 500;
  line-height: 1.4;
}

.talks .card-title a {
  color: var(--global-text-color);
}

.talks .card-title a:hover {
  color: var(--global-theme-color);
}

.talks .btn-outline-primary {
  border-radius: 20px;
  font-size: 0.85rem;
  padding: 0.4rem 1rem;
}

.talks .btn-primary {
  border-radius: 25px;
  padding: 0.75rem 2rem;
  font-weight: 500;
}
</style>
