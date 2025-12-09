---
layout: page
title: Talks
permalink: /talks/
description:
nav: true
nav_order: 3
---

<div class="talks">

<div class="text-center mb-4">
  <a href="https://github.com/misskecupbung/misskecupbung.github.io/tree/main/assets/slides" target="_blank" class="btn btn-primary btn-lg">
    <i class="fa-solid fa-folder-open me-2"></i> Browse All Slides
  </a>
</div>

{% if site.data.talks.size > 0 %}
<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 mb-4">
  {% for talk in site.data.talks %}
  <div class="col">
    <div class="card h-100 slide-card">
      <a href="{{ '/assets/slides/' | append: talk.filename | relative_url }}" target="_blank" class="slide-thumbnail">
        <div class="slide-preview">
          <i class="fa-solid fa-file-pdf"></i>
        </div>
      </a>
      <div class="card-body d-flex flex-column">
        <h5 class="card-title mb-2">{{ talk.title }}</h5>
        <div class="talk-meta mb-3">
          <span class="talk-event"><i class="fa-solid fa-calendar-check me-1"></i> {{ talk.event }}</span>
          <span class="talk-date"><i class="fa-regular fa-calendar me-1"></i> {{ talk.date | date: "%b %d, %Y" }}</span>
        </div>
        <div class="mt-auto">
          <a href="{{ '/assets/slides/' | append: talk.filename | relative_url }}" target="_blank" class="btn btn-outline-primary btn-sm">
            <i class="fa-solid fa-eye me-1"></i> View Slides
          </a>
        </div>
      </div>
    </div>
  </div>
  {% endfor %}
</div>
{% else %}
<p class="text-muted fst-italic text-center">No presentations available at the moment.</p>
{% endif %}

</div>

<style>
.slide-card {
  border: none;
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  overflow: hidden;
}

.slide-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

.slide-thumbnail {
  display: block;
  text-decoration: none;
}

.slide-preview {
  height: 120px;
  background: linear-gradient(135deg, var(--global-theme-color) 0%, #a8c0e8 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 3rem;
  color: white;
  opacity: 0.9;
  transition: opacity 0.2s ease;
}

.slide-card:hover .slide-preview {
  opacity: 1;
}

.slide-card .card-title {
  font-size: 0.95rem;
  font-weight: 600;
  line-height: 1.4;
  color: var(--global-text-color);
}

.talk-meta {
  display: flex;
  flex-direction: column;
  gap: 0.3rem;
  font-size: 0.8rem;
  color: var(--global-text-color-light);
}

.talk-event {
  color: var(--global-theme-color);
  font-weight: 500;
}

.talk-date {
  opacity: 0.8;
}

.slide-card .btn-outline-primary {
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
