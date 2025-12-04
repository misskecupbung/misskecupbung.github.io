---
layout: page
permalink: /repositories/
title: Repositories
description: Open source projects and contributions on GitHub
nav: true
nav_order: 4
---

<div class="repositories">

## GitHub Projects

<div class="text-center mb-4">
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
          {% if repo.language %}
          <span class="badge bg-primary">{{ repo.language }}</span>
          {% else %}
          <span></span>
          {% endif %}
          <small class="text-muted">{{ repo.pushed_at | date: "%b %Y" }}</small>
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
</style>
