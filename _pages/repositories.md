---
layout: page
permalink: /repositories/
title: Repositories
description:
nav: true
nav_order: 4
---

<div class="repositories">

<div class="repos-header text-center mb-3">
  {% if site.data.github_repos_data %}
  <div class="repos-stats mb-2">
    <div class="stat-item">
      <span class="stat-number">{{ site.data.github_repos_data.size }}</span>
      <span class="stat-label">Repositories</span>
    </div>
  </div>
  {% endif %}
  <a href="https://github.com/misskecupbung" target="_blank" class="btn btn-dark btn-lg">
    <i class="fa-brands fa-github me-2"></i> View GitHub Profile
  </a>
</div>

{% if site.data.github_repos_data and site.data.github_repos_data.size > 0 %}

<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 mb-4" id="reposGrid">
  {% for repo in site.data.github_repos_data %}
  <div class="col">
    <div class="card h-100 repo-card">
      <div class="card-body d-flex flex-column">
        <h5 class="card-title">
          <a href="{{ repo.html_url }}" target="_blank">
            <i class="fa-brands fa-github me-1"></i> {{ repo.name }}
          </a>
          {% if repo.fork %}<span class="badge bg-secondary ms-2">fork</span>{% endif %}
        </h5>
        <p class="card-text text-muted flex-grow-1">{{ repo.description | default: "No description available" | truncate: 100 }}</p>
        <div class="d-flex justify-content-between align-items-center mt-auto">
          <div class="repo-stats">
            {% if repo.stargazers_count > 0 %}
            <span class="repo-stat"><i class="fa-solid fa-star"></i> {{ repo.stargazers_count }}</span>
            {% endif %}
            {% if repo.forks_count > 0 %}
            <span class="repo-stat"><i class="fa-solid fa-code-fork"></i> {{ repo.forks_count }}</span>
            {% endif %}
          </div>
          {% if repo.language %}
          <span class="badge bg-primary">{{ repo.language }}</span>
          {% endif %}
        </div>
      </div>
    </div>
  </div>
  {% endfor %}
</div>

<nav aria-label="Repositories navigation" class="mt-4">
  <ul class="pagination pagination-lg justify-content-center" id="paginationNav">
    <!-- Pagination will be inserted by JavaScript -->
  </ul>
</nav>

{% else %}

<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% if site.data.repositories.github_users %}
    {% for user in site.data.repositories.github_users %}
      {% include repository/repo_user.liquid username=user %}
    {% endfor %}
  {% endif %}
</div>

{% endif %}

</div>

<style>
.repositories h2 {
  font-size: 1.75rem;
  font-weight: 600;
  margin-bottom: 1.5rem;
  color: var(--global-theme-color);
  text-align: center;
}

.repo-card {
  border: none;
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.repo-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

.repo-card .card-title {
  font-size: 1rem;
  font-weight: 600;
}

.repo-card .card-title a {
  color: var(--global-text-color);
  text-decoration: none;
}

.repo-card .card-title a:hover {
  color: var(--global-theme-color);
}

.repo-card .card-text {
  font-size: 0.875rem;
  line-height: 1.5;
}

.repositories .btn-dark {
  border-radius: 25px;
  padding: 0.75rem 2rem;
}

.repositories .btn-outline-primary {
  border-radius: 25px;
  padding: 0.75rem 2rem;
}

.repos-stats {
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

.repo-stats {
  display: flex;
  gap: 0.75rem;
}

.repo-stat {
  font-size: 0.8rem;
  color: var(--global-text-color-light);
}

.repo-stat i {
  color: var(--global-theme-color);
  margin-right: 0.25rem;
}

.pagination .page-item .page-link {
  color: var(--global-theme-color);
  border-color: var(--global-divider-color);
  padding: 0.375rem 0.75rem;
}

.pagination .page-item.active .page-link {
  background-color: var(--global-theme-color);
  border-color: var(--global-theme-color);
  color: white;
}

.pagination .page-item.disabled .page-link {
  color: var(--global-text-color-light);
  pointer-events: none;
  background-color: transparent;
}

.pagination .page-item .page-link:hover {
  background-color: var(--global-theme-color);
  border-color: var(--global-theme-color);
  color: white;
}
</style>

<script>
const ITEMS_PER_PAGE = 12;
let currentPage = 1;
let totalPages = 1;

document.addEventListener('DOMContentLoaded', function() {
  const items = document.querySelectorAll('#reposGrid > .col');
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
  const items = document.querySelectorAll('#reposGrid > .col');
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
