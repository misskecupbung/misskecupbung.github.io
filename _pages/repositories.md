---
layout: page
permalink: /repositories/
title: Repositories
description: Open source projects and contributions on GitHub
nav: true
nav_order: 4
---

<div class="repositories">

<p class="mb-4">
  <a href="https://github.com/misskecupbung" target="_blank" class="btn btn-dark">
    <i class="fa-brands fa-github"></i> View GitHub Profile
  </a>
</p>

{% if site.data.github_repos_data and site.data.github_repos_data.size > 0 %}

<div class="table-responsive">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>Repository</th>
        <th>Description</th>
        <th>Language</th>
        <th>Updated</th>
      </tr>
    </thead>
    <tbody>
      {% for repo in site.data.github_repos_data limit:20 %}
      <tr>
        <td>
          <a href="{{ repo.html_url }}" target="_blank">
            <i class="fa-brands fa-github"></i> {{ repo.name }}
          </a>
          {% if repo.fork %}<span class="badge bg-secondary">fork</span>{% endif %}
        </td>
        <td>{{ repo.description | default: "-" | truncate: 80 }}</td>
        <td>
          {% if repo.language %}
          <span class="badge bg-primary">{{ repo.language }}</span>
          {% else %}
          -
          {% endif %}
        </td>
        <td>{{ repo.pushed_at | date: "%b %d, %Y" }}</td>
      </tr>
      {% endfor %}
    </tbody>
  </table>
</div>

{% if site.data.github_repos_data.size > 20 %}

<p class="text-center">
  <a href="https://github.com/misskecupbung?tab=repositories" target="_blank" class="btn btn-outline-primary">
    View all {{ site.data.github_repos_data.size }} repositories on GitHub
  </a>
</p>
{% endif %}

{% else %}

<!-- Fallback when plugin hasn't run -->
<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% if site.data.repositories.github_users %}
    {% for user in site.data.repositories.github_users %}
      {% include repository/repo_user.liquid username=user %}
    {% endfor %}
  {% endif %}
</div>

{% endif %}

</div>
