---
layout: page
permalink: /repositories/
title: Repositories
description: Open source projects and contributions on GitHub
nav: true
nav_order: 4
---

<div class="repositories">

<div class="repos-header text-center mb-5">
  {% if site.data.github_repos_data %}
  <div class="repos-stats mb-4">
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

<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 mb-4">
  {% for repo in site.data.github_repos_data limit:18 %}
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

{% if site.data.github_repos_data.size > 18 %}

<div class="text-center mt-4">
  <a href="https://github.com/misskecupbung?tab=repositories" target="_blank" class="btn btn-outline-primary btn-lg">
    View all {{ site.data.github_repos_data.size }} repositories
  </a>
</div>
{% endif %}

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
  font-size: 3rem;
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
</style>
