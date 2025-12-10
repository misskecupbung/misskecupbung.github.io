---
layout: page
title: Talks
permalink: /talks/
description:
nav: true
nav_order: 3
---

<div class="talks">

<div class="talks-header text-center mb-3">
  <div class="talks-stats mb-2">
    <div class="stat-item">
      <span class="stat-number">{{ site.data.talks.size }}</span>
      <span class="stat-label">Presentations</span>
    </div>
  </div>
  <a href="https://github.com/misskecupbung/misskecupbung.github.io/tree/main/assets/slides" target="_blank" class="btn btn-primary btn-lg">
    <i class="fa-solid fa-folder-open me-2"></i> Browse All Slides
  </a>
</div>

{% if site.data.talks.size > 0 %}

<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 mb-4" id="talksGrid">
  {% for talk in site.data.talks %}
  {% assign thumb_name = talk.filename | remove: ".pdf" | append: ".png" %}
  <div class="col">
    <div class="card h-100 slide-card">
      {% unless talk.filename == "" or talk.filename == nil or talk.filename == blank %}
      <a href="{{ '/assets/slides/' | append: talk.filename | relative_url }}" target="_blank" class="slide-thumbnail">
        <img src="{{ '/assets/img/talks/' | append: thumb_name | relative_url }}" alt="{{ talk.title }}" class="card-img-top slide-thumb-img">
      </a>
      {% else %}
      <div class="slide-thumbnail no-slides-placeholder">
        <div class="placeholder-content">
          <i class="fa-solid fa-file-powerpoint fa-4x"></i>
          <span class="mt-2">Slides unavailable</span>
        </div>
      </div>
      {% endunless %}
      <div class="card-body d-flex flex-column">
        <h5 class="card-title mb-2">{{ talk.title }}</h5>
        <div class="talk-meta mb-3">
          <span class="talk-event"><i class="fa-solid fa-calendar-check me-1"></i> {{ talk.event }}</span>
          <span class="talk-date"><i class="fa-regular fa-calendar me-1"></i> {{ talk.date | date: "%b %d, %Y" }}</span>
        </div>
        <div class="mt-auto">
          {% unless talk.filename == "" or talk.filename == nil or talk.filename == blank %}
          <a href="{{ '/assets/slides/' | append: talk.filename | relative_url }}" target="_blank" class="btn btn-outline-primary btn-sm">
            <i class="fa-solid fa-eye me-1"></i> View Slides
          </a>
          {% else %}
          <span class="btn btn-outline-secondary btn-sm disabled">
            <i class="fa-solid fa-eye-slash me-1"></i> No Slides
          </span>
          {% endunless %}
        </div>
      </div>
    </div>
  </div>
  {% endfor %}
</div>

<nav aria-label="Talks page navigation">
  <ul class="pagination pagination-lg justify-content-center" id="paginationNav">
  </ul>
</nav>

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
  overflow: hidden;
}

.slide-thumb-img {
  width: 100%;
  height: auto;
  aspect-ratio: 16 / 9;
  object-fit: contain;
  background: #f8f9fa;
  transition: transform 0.3s ease;
}

.slide-card:hover .slide-thumb-img {
  transform: scale(1.05);
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

.talks-stats {
  display: flex;
  justify-content: center;
  gap: 2rem;
}

.stat-item {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.stat-number {
  font-size: 2rem;
  font-weight: 700;
  color: var(--global-theme-color);
  line-height: 1;
}

.stat-label {
  font-size: 0.9rem;
  color: var(--global-text-color-light);
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

.no-slides-placeholder {
  aspect-ratio: 16 / 9;
  background: linear-gradient(135deg, #e8eef5 0%, #d4dce8 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  border-bottom: 1px solid rgba(0, 0, 0, 0.05);
}

.no-slides-placeholder .placeholder-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  color: var(--global-theme-color);
  opacity: 0.6;
}

.no-slides-placeholder .placeholder-content i {
  font-size: 3.5rem;
}

.no-slides-placeholder .placeholder-content span {
  font-size: 0.8rem;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

.slide-card .btn-outline-secondary.disabled {
  border-radius: 20px;
  font-size: 0.85rem;
  padding: 0.4rem 1rem;
  opacity: 0.6;
}
</style>

<script>
const ITEMS_PER_PAGE = 12;
let currentPage = 1;
let totalPages = 1;

document.addEventListener('DOMContentLoaded', function() {
  const items = document.querySelectorAll('#talksGrid > .col');
  totalPages = Math.ceil(items.length / ITEMS_PER_PAGE);
  
  renderPagination();
  showPage(1);
});

function renderPagination() {
  const nav = document.getElementById('paginationNav');
  nav.innerHTML = '';
  
  // Previous button
  const prevLi = document.createElement('li');
  prevLi.className = 'page-item';
  prevLi.id = 'prevPage';
  prevLi.innerHTML = '<a class="page-link" href="#" onclick="changePage(-1); return false;">&lt;</a>';
  nav.appendChild(prevLi);
  
  // Page numbers
  for (let i = 1; i <= totalPages; i++) {
    const li = document.createElement('li');
    li.className = 'page-item';
    li.setAttribute('data-page', i);
    li.innerHTML = `<a class="page-link" href="#" onclick="goToPage(${i}); return false;">${i}</a>`;
    nav.appendChild(li);
  }
  
  // Next button
  const nextLi = document.createElement('li');
  nextLi.className = 'page-item';
  nextLi.id = 'nextPage';
  nextLi.innerHTML = '<a class="page-link" href="#" onclick="changePage(1); return false;">&gt;</a>';
  nav.appendChild(nextLi);
}

function showPage(page) {
  const items = document.querySelectorAll('#talksGrid > .col');
  const start = (page - 1) * ITEMS_PER_PAGE;
  const end = start + ITEMS_PER_PAGE;
  
  items.forEach((item, index) => {
    item.style.display = (index >= start && index < end) ? 'block' : 'none';
  });
  
  currentPage = page;
  
  // Update active state
  document.querySelectorAll('#paginationNav .page-item[data-page]').forEach(li => {
    li.classList.toggle('active', parseInt(li.getAttribute('data-page')) === page);
  });
  
  // Update disabled state
  document.getElementById('prevPage').classList.toggle('disabled', page === 1);
  document.getElementById('nextPage').classList.toggle('disabled', page === totalPages);
}

function goToPage(page) {
  showPage(page);
  window.scrollTo({ top: 0, behavior: 'smooth' });
}

function changePage(delta) {
  const newPage = currentPage + delta;
  if (newPage >= 1 && newPage <= totalPages) {
    goToPage(newPage);
  }
}
</script>
