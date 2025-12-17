---
layout: page
permalink: /repositories/
title: Repositories
description:
nav: true
nav_order: 4
---

<div class="repositories">

{% assign total_stars = 0 %}
{% assign total_forks = 0 %}
{% assign languages = "" %}
{% if site.data.github_repos_data %}
  {% for repo in site.data.github_repos_data %}
    {% assign total_stars = total_stars | plus: repo.stargazers_count %}
    {% assign total_forks = total_forks | plus: repo.forks_count %}
    {% if repo.language and repo.language != "" %}
      {% unless languages contains repo.language %}
        {% if languages == "" %}
          {% assign languages = repo.language %}
        {% else %}
          {% assign languages = languages | append: "," | append: repo.language %}
        {% endif %}
      {% endunless %}
    {% endif %}
  {% endfor %}
{% endif %}

<div class="repos-header text-center mb-5">
  {% if site.data.github_repos_data %}
  <div class="repos-stats mb-4">
    <div class="stat-item">
      <span class="stat-number">{{ site.data.github_repos_data.size }}</span>
      <span class="stat-label">Repositories</span>
    </div>
    <div class="stat-item">
      <span class="stat-number">{{ total_stars }}</span>
      <span class="stat-label">Total Stars</span>
    </div>
    <div class="stat-item">
      <span class="stat-number">{{ total_forks }}</span>
      <span class="stat-label">Total Forks</span>
    </div>
  </div>
  {% endif %}
  <a href="https://github.com/misskecupbung" target="_blank" class="btn btn-dark btn-lg">
    <i class="fa-brands fa-github me-2"></i> View GitHub Profile
  </a>
</div>

{% if site.data.github_repos_data and site.data.github_repos_data.size > 0 %}

<!-- Featured Repos Section -->
<div class="featured-section mb-5">
  <h2 class="section-title"><i class="fa-solid fa-star me-2"></i>Featured Projects</h2>
  <div class="row row-cols-1 row-cols-md-2 g-4" id="featuredRepos">
    {% assign featured_repos = "aws-openvpn-stack,rhel-ansible-terraform-infra" | split: "," %}
    {% for repo in site.data.github_repos_data %}
      {% if featured_repos contains repo.name %}
      <div class="col">
        <div class="card h-100 repo-card featured-card">
          <div class="card-body d-flex flex-column">
            <div class="featured-badge"><i class="fa-solid fa-trophy"></i> Featured</div>
            <h5 class="card-title">
              <a href="{{ repo.html_url }}" target="_blank">
                <i class="fa-brands fa-github me-1"></i> {{ repo.name }}
              </a>
            </h5>
            <p class="card-text text-muted flex-grow-1">{{ repo.description | default: "No description available" }}</p>
            <div class="d-flex justify-content-between align-items-center mt-auto">
              <div class="repo-stats">
                <span class="repo-stat"><i class="fa-solid fa-star"></i> {{ repo.stargazers_count }}</span>
                <span class="repo-stat"><i class="fa-solid fa-code-fork"></i> {{ repo.forks_count }}</span>
              </div>
              {% if repo.language %}
              <span class="badge language-badge" data-language="{{ repo.language }}">{{ repo.language }}</span>
              {% endif %}
            </div>
          </div>
        </div>
      </div>
      {% endif %}
    {% endfor %}
  </div>
</div>

<!-- Search and Filter Controls -->
<div class="controls-section mb-4">
  <div class="row g-3 align-items-center">
    <div class="col-12 col-md-4">
      <div class="search-box">
        <i class="fa-solid fa-search search-icon"></i>
        <input type="text" id="searchInput" class="form-control" placeholder="Search repositories...">
      </div>
    </div>
    <div class="col-6 col-md-3">
      <select id="languageFilter" class="form-select">
        <option value="">All Languages</option>
        {% assign lang_array = languages | split: "," | sort %}
        {% for lang in lang_array %}
        <option value="{{ lang }}">{{ lang }}</option>
        {% endfor %}
      </select>
    </div>
    <div class="col-6 col-md-3">
      <select id="sortSelect" class="form-select">
        <option value="updated">Recently Updated</option>
        <option value="stars">Most Stars</option>
        <option value="forks">Most Forks</option>
        <option value="name">Name (A-Z)</option>
      </select>
    </div>
    <div class="col-12 col-md-2">
      <button id="resetFilters" class="btn btn-outline-secondary w-100">
        <i class="fa-solid fa-rotate-left"></i> Reset
      </button>
    </div>
  </div>
  <div class="results-info mt-3">
    <span id="resultsCount">Showing all repositories</span>
  </div>
</div>

<h2 class="section-title"><i class="fa-solid fa-folder-open me-2"></i>All Repositories</h2>

<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 mb-4" id="reposGrid">
  {% for repo in site.data.github_repos_data %}
  <div class="col repo-item" 
       data-name="{{ repo.name | downcase }}" 
       data-description="{{ repo.description | default: '' | downcase }}"
       data-language="{{ repo.language | default: '' }}"
       data-stars="{{ repo.stargazers_count }}"
       data-forks="{{ repo.forks_count }}"
       data-updated="{{ repo.updated_at }}">
    <div class="card h-100 repo-card">
      <div class="card-body d-flex flex-column">
        <h5 class="card-title">
          <a href="{{ repo.html_url }}" target="_blank">
            <i class="fa-brands fa-github me-1"></i> {{ repo.name }}
          </a>
          {% if repo.fork %}<span class="badge bg-secondary ms-2">fork</span>{% endif %}
        </h5>
        <p class="card-text text-muted flex-grow-1">{{ repo.description | default: "No description available" | truncate: 100 }}</p>
        <div class="repo-meta mb-2">
          <small class="text-muted"><i class="fa-solid fa-clock"></i> Updated {{ repo.updated_at | date: "%b %d, %Y" }}</small>
        </div>
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
          <span class="badge language-badge" data-language="{{ repo.language }}">{{ repo.language }}</span>
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
.repositories h2.section-title {
  font-size: 1.5rem;
  font-weight: 600;
  margin-bottom: 1.5rem;
  color: var(--global-theme-color);
  display: flex;
  align-items: center;
}

.featured-section {
  background: linear-gradient(135deg, rgba(var(--global-theme-color-rgb), 0.05) 0%, rgba(var(--global-theme-color-rgb), 0.02) 100%);
  border-radius: 16px;
  padding: 2rem;
  border: 1px solid rgba(var(--global-theme-color-rgb), 0.1);
}

.featured-card {
  border: 2px solid rgba(var(--global-theme-color-rgb), 0.2) !important;
  background: linear-gradient(135deg, #fff 0%, rgba(var(--global-theme-color-rgb), 0.03) 100%);
}

.featured-badge {
  position: absolute;
  top: 12px;
  right: 12px;
  background: linear-gradient(135deg, #ffd700 0%, #ffaa00 100%);
  color: #333;
  font-size: 0.7rem;
  font-weight: 600;
  padding: 0.25rem 0.5rem;
  border-radius: 12px;
}

.controls-section {
  background: var(--global-bg-color);
  border-radius: 12px;
  padding: 1.5rem;
  border: 1px solid var(--global-divider-color);
}

.search-box {
  position: relative;
}

.search-box .search-icon {
  position: absolute;
  left: 12px;
  top: 50%;
  transform: translateY(-50%);
  color: var(--global-text-color-light);
}

.search-box input {
  padding-left: 40px;
  border-radius: 25px;
}

.form-select {
  border-radius: 25px;
}

.results-info {
  font-size: 0.9rem;
  color: var(--global-text-color-light);
}

.repo-card {
  border: none;
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  position: relative;
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

.repo-meta {
  font-size: 0.8rem;
}

.repositories .btn-dark {
  border-radius: 25px;
  padding: 0.75rem 2rem;
}

.repositories .btn-outline-primary,
.repositories .btn-outline-secondary {
  border-radius: 25px;
}

.repos-stats {
  display: flex;
  justify-content: center;
  gap: 2rem;
  flex-wrap: wrap;
}

.stat-item {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.stat-number {
  font-size: 2.5rem;
  font-weight: 700;
  color: var(--global-theme-color);
  line-height: 1;
}

.stat-label {
  font-size: 0.85rem;
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

/* Language colors */
.language-badge {
  font-size: 0.75rem;
  font-weight: 500;
}

.language-badge[data-language="Python"] { background-color: #3572A5; }
.language-badge[data-language="JavaScript"] { background-color: #f1e05a; color: #333; }
.language-badge[data-language="TypeScript"] { background-color: #2b7489; }
.language-badge[data-language="Go"] { background-color: #00ADD8; }
.language-badge[data-language="Rust"] { background-color: #dea584; color: #333; }
.language-badge[data-language="Java"] { background-color: #b07219; }
.language-badge[data-language="Shell"] { background-color: #89e051; color: #333; }
.language-badge[data-language="HCL"] { background-color: #844fba; }
.language-badge[data-language="Dockerfile"] { background-color: #384d54; }
.language-badge[data-language="HTML"] { background-color: #e34c26; }
.language-badge[data-language="CSS"] { background-color: #563d7c; }
.language-badge[data-language="Ruby"] { background-color: #701516; }
.language-badge[data-language="PHP"] { background-color: #4F5D95; }
.language-badge[data-language="C"] { background-color: #555555; }
.language-badge[data-language="C++"] { background-color: #f34b7d; }
.language-badge[data-language="C#"] { background-color: #178600; }
.language-badge[data-language="Kotlin"] { background-color: #A97BFF; }
.language-badge[data-language="Swift"] { background-color: #F05138; }
.language-badge[data-language="Scala"] { background-color: #c22d40; }
.language-badge:not([data-language]) { background-color: var(--global-theme-color); }

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

.no-results {
  text-align: center;
  padding: 3rem;
  color: var(--global-text-color-light);
}

.no-results i {
  font-size: 3rem;
  margin-bottom: 1rem;
  opacity: 0.5;
}

@media (max-width: 768px) {
  .stat-number {
    font-size: 2rem;
  }
  .repos-stats {
    gap: 1rem;
  }
  .featured-section {
    padding: 1rem;
  }
}
</style>

<script>
const ITEMS_PER_PAGE = 12;
let currentPage = 1;
let totalPages = 1;
let allItems = [];
let filteredItems = [];

document.addEventListener('DOMContentLoaded', function() {
  allItems = Array.from(document.querySelectorAll('#reposGrid > .repo-item'));
  filteredItems = [...allItems];
  
  // Initial sort by recently updated
  sortItems('updated');
  
  // Event listeners
  document.getElementById('searchInput').addEventListener('input', applyFilters);
  document.getElementById('languageFilter').addEventListener('change', applyFilters);
  document.getElementById('sortSelect').addEventListener('change', function() {
    sortItems(this.value);
    applyFilters();
  });
  document.getElementById('resetFilters').addEventListener('click', resetFilters);
});

function sortItems(sortBy) {
  const grid = document.getElementById('reposGrid');
  
  allItems.sort((a, b) => {
    switch(sortBy) {
      case 'stars':
        return parseInt(b.dataset.stars) - parseInt(a.dataset.stars);
      case 'forks':
        return parseInt(b.dataset.forks) - parseInt(a.dataset.forks);
      case 'name':
        return a.dataset.name.localeCompare(b.dataset.name);
      case 'updated':
      default:
        return new Date(b.dataset.updated) - new Date(a.dataset.updated);
    }
  });
  
  // Re-append in sorted order
  allItems.forEach(item => grid.appendChild(item));
}

function applyFilters() {
  const searchTerm = document.getElementById('searchInput').value.toLowerCase().trim();
  const languageFilter = document.getElementById('languageFilter').value;
  
  filteredItems = allItems.filter(item => {
    const matchesSearch = !searchTerm || 
      item.dataset.name.includes(searchTerm) || 
      item.dataset.description.includes(searchTerm);
    const matchesLanguage = !languageFilter || item.dataset.language === languageFilter;
    return matchesSearch && matchesLanguage;
  });
  
  // Update visibility
  allItems.forEach(item => {
    item.style.display = 'none';
  });
  
  totalPages = Math.ceil(filteredItems.length / ITEMS_PER_PAGE);
  currentPage = 1;
  
  renderPagination();
  showPage(1);
  updateResultsCount();
}

function updateResultsCount() {
  const count = filteredItems.length;
  const total = allItems.length;
  const resultsEl = document.getElementById('resultsCount');
  
  if (count === total) {
    resultsEl.textContent = `Showing all ${total} repositories`;
  } else if (count === 0) {
    resultsEl.textContent = 'No repositories found';
  } else {
    resultsEl.textContent = `Showing ${count} of ${total} repositories`;
  }
}

function resetFilters() {
  document.getElementById('searchInput').value = '';
  document.getElementById('languageFilter').value = '';
  document.getElementById('sortSelect').value = 'updated';
  sortItems('updated');
  applyFilters();
}

function renderPagination() {
  const nav = document.getElementById('paginationNav');
  nav.innerHTML = '';
  
  if (totalPages <= 1) return;
  
  // Previous button
  const prevLi = document.createElement('li');
  prevLi.className = 'page-item';
  prevLi.id = 'prevPage';
  prevLi.innerHTML = '<a class="page-link" href="#" onclick="changePage(-1); return false;">&lt;</a>';
  nav.appendChild(prevLi);
  
  // Page numbers (show max 5 pages)
  let startPage = Math.max(1, currentPage - 2);
  let endPage = Math.min(totalPages, startPage + 4);
  startPage = Math.max(1, endPage - 4);
  
  for (let i = startPage; i <= endPage; i++) {
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
  const start = (page - 1) * ITEMS_PER_PAGE;
  const end = start + ITEMS_PER_PAGE;
  
  filteredItems.forEach((item, index) => {
    item.style.display = (index >= start && index < end) ? 'block' : 'none';
  });
  
  currentPage = page;
  
  // Update active state
  document.querySelectorAll('#paginationNav .page-item[data-page]').forEach(li => {
    li.classList.toggle('active', parseInt(li.getAttribute('data-page')) === page);
  });
  
  // Update disabled state
  const prevBtn = document.getElementById('prevPage');
  const nextBtn = document.getElementById('nextPage');
  if (prevBtn) prevBtn.classList.toggle('disabled', page === 1);
  if (nextBtn) nextBtn.classList.toggle('disabled', page === totalPages);
}

function goToPage(page) {
  showPage(page);
  document.querySelector('.controls-section').scrollIntoView({ behavior: 'smooth' });
}

function changePage(delta) {
  const newPage = currentPage + delta;
  if (newPage >= 1 && newPage <= totalPages) {
    goToPage(newPage);
  }
}
</script>
