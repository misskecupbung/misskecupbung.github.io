---
layout: page
title: Talks
permalink: /talks/
description:
nav: true
nav_order: 3
---

<div class="talks">

{% assign slides = site.static_files | where_exp: "file", "file.path contains '/assets/slides/'" | where_exp: "file", "file.extname == '.pdf'" %}

{% if slides.size > 0 %}
<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 mb-4">
  {% for slide in slides %}
  {% assign filename = slide.name | remove: ".pdf" | replace: "-", " " | replace: "_", " " %}
  <div class="col">
    <div class="card h-100 slide-card">
      <div class="card-body d-flex flex-column">
        <div class="slide-icon mb-3">
          <i class="fa-solid fa-file-pdf"></i>
        </div>
        <h5 class="card-title mb-3">{{ filename | capitalize }}</h5>
        <div class="mt-auto">
          <a href="{{ slide.path | relative_url }}" target="_blank" class="btn btn-outline-primary btn-sm">
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

<div class="text-center mt-4 mb-4">
  <a href="{{ 'assets/slides/' | relative_url }}" target="_blank" class="btn btn-primary btn-lg">
    <i class="fa-solid fa-folder-open me-2"></i> Browse All Slides
  </a>
</div>

</div>

<style>
.slide-card {
  border: none;
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.slide-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

.slide-icon {
  font-size: 2.5rem;
  color: var(--global-theme-color);
  opacity: 0.8;
}

.slide-card .card-title {
  font-size: 1rem;
  font-weight: 500;
  line-height: 1.4;
  color: var(--global-text-color);
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
