---
layout: page
permalink: /certifications/
title: Certifications
description: Cloud, DevOps, and networking certifications from AWS, Google, Azure, HashiCorp, Linux Foundation, and MikroTik
nav: true
nav_order: 6
---

<div class="certifications">

<div class="text-center mb-4">
  <a href="https://www.credly.com/users/anandadwir/badges" target="_blank" class="btn btn-primary btn-lg">
    <i class="fa-solid fa-certificate me-2"></i> View on Credly
  </a>
</div>

{% if site.data.credly_badges and site.data.credly_badges.size > 0 %}

<nav aria-label="Certifications navigation" class="mb-4">
  <ul class="pagination justify-content-center" id="paginationTop">
    <li class="page-item" id="prevPageTop">
      <a class="page-link" href="#" onclick="changePage(currentPage - 1); return false;" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <!-- Page numbers will be inserted by JavaScript -->
    <li class="page-item" id="nextPageTop">
      <a class="page-link" href="#" onclick="changePage(currentPage + 1); return false;" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

<div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 g-4 mb-5" id="certsGrid">
  {% for badge in site.data.credly_badges %}
  <div class="col">
    <div class="card h-100 text-center cert-card">
      <a href="{{ badge.badge_url }}" target="_blank" class="cert-link">
        <img src="{{ badge.image_url }}" class="card-img-top p-3" alt="{{ badge.name }}">
        <div class="card-body p-2">
          <p class="card-title mb-1">{{ badge.name }}</p>
          <p class="card-text text-muted">{{ badge.issuer }}</p>
        </div>
      </a>
    </div>
  </div>
  {% endfor %}
</div>

<nav aria-label="Certifications navigation" class="mt-4 mb-4">
  <ul class="pagination justify-content-center" id="paginationBottom">
    <li class="page-item" id="prevPageBottom">
      <a class="page-link" href="#" onclick="changePage(currentPage - 1); return false;" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <!-- Page numbers will be inserted by JavaScript -->
    <li class="page-item" id="nextPageBottom">
      <a class="page-link" href="#" onclick="changePage(currentPage + 1); return false;" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

{% else %}

<div class="cert-section">
<h3><i class="fa-solid fa-cloud me-2"></i>Cloud Platforms</h3>

| Certification                          | Issuer              |
| -------------------------------------- | ------------------- |
| HashiCorp Terraform Associate (003)    | HashiCorp           |
| AWS Solutions Architect Associate      | Amazon Web Services |
| AWS Cloud Practitioner                 | Amazon Web Services |
| Google Professional Cloud Architect    | Google Cloud        |
| Google Associate Cloud Engineer        | Google Cloud        |
| Microsoft Azure Administrator (AZ-104) | Microsoft           |
| Microsoft Azure Fundamentals (AZ-900)  | Microsoft           |
| Oracle Cloud Foundations Associate     | Oracle              |
| Oracle Cloud Operations Associate      | Oracle              |
| Alibaba Cloud ACA Security             | Alibaba Cloud       |
| Alibaba Cloud ACA Cloud Computing      | Alibaba Cloud       |

</div>

<div class="cert-section">
<h3><i class="fa-brands fa-linux me-2"></i>Linux & Security</h3>

| Certification                           | Issuer               |
| --------------------------------------- | -------------------- |
| Linux Foundation LFCS                   | Linux Foundation     |
| Linux Foundation LFCA                   | Linux Foundation     |
| CompTIA Security+                       | CompTIA              |
| Certified OpenStack Administrator (COA) | OpenStack Foundation |

</div>

<div class="cert-section">
<h3><i class="fa-solid fa-network-wired me-2"></i>Networking</h3>

| Certification   | Issuer   |
| --------------- | -------- |
| MikroTik MTCNA  | MikroTik |
| MikroTik MTCRE  | MikroTik |
| MikroTik MTCWE  | MikroTik |
| MikroTik MTCSE  | MikroTik |
| MikroTik MTCTCE | MikroTik |
| MikroTik MTCUME | MikroTik |
| MikroTik MTCINE | MikroTik |

</div>

{% endif %}

</div>

<style>
.certifications h2 {
  font-size: 1.75rem;
  font-weight: 600;
  margin-bottom: 1.5rem;
  color: var(--global-theme-color);
  text-align: center;
}

.certifications h3 {
  font-size: 1.25rem;
  font-weight: 600;
  margin-top: 2rem;
  margin-bottom: 1rem;
  color: var(--global-theme-color);
}

.cert-card {
  border: none;
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.cert-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

.cert-card .card-img-top {
  max-height: 120px;
  object-fit: contain;
}

.cert-section {
  margin-bottom: 2rem;
}

.cert-section table {
  width: 100%;
  border-collapse: collapse;
  background: var(--global-bg-color);
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

.cert-section th {
  background: var(--global-theme-color);
  color: white;
  font-weight: 600;
  padding: 1rem;
  text-align: left;
}

.cert-section td {
  padding: 0.75rem 1rem;
  border-bottom: 1px solid var(--global-divider-color);
}

.cert-section tr:last-child td {
  border-bottom: none;
}

.cert-section tr:hover td {
  background: rgba(var(--global-theme-color-rgb), 0.05);
}

.cert-card .card-title {
  font-size: 0.8rem;
  font-weight: 500;
  line-height: 1.3;
  color: var(--global-text-color);
}

.cert-card .card-text {
  font-size: 0.7rem;
}

.cert-link {
  text-decoration: none;
}

.cert-link:hover .card-title {
  color: var(--global-theme-color);
}

.certifications .btn-primary {
  border-radius: 25px;
  padding: 0.75rem 2rem;
}

.cert-section {
  margin-bottom: 2rem;
}

.certifications table {
  font-size: 0.95rem;
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
const ITEMS_PER_PAGE = 16;
let currentPage = 1;
let totalPages = 1;

document.addEventListener('DOMContentLoaded', function() {
  const items = document.querySelectorAll('#certsGrid > .col');
  if (items.length === 0) return;
  
  totalPages = Math.ceil(items.length / ITEMS_PER_PAGE);
  
  renderPagination();
  showPage(1);
});

function renderPagination() {
  ['paginationTop', 'paginationBottom'].forEach(paginationId => {
    const pagination = document.getElementById(paginationId);
    const prevId = paginationId === 'paginationTop' ? 'prevPageTop' : 'prevPageBottom';
    const nextId = paginationId === 'paginationTop' ? 'nextPageTop' : 'nextPageBottom';
    const prevItem = document.getElementById(prevId);
    const nextItem = document.getElementById(nextId);
    
    // Remove existing page numbers
    const existingPages = pagination.querySelectorAll('.page-number');
    existingPages.forEach(p => p.remove());
    
    // Add page numbers
    for (let i = 1; i <= totalPages; i++) {
      const li = document.createElement('li');
      li.className = 'page-item page-number' + (i === currentPage ? ' active' : '');
      li.innerHTML = `<a class="page-link" href="#" onclick="changePage(${i}); return false;">${i}</a>`;
      pagination.insertBefore(li, nextItem);
    }
  });
}

function showPage(page) {
  const items = document.querySelectorAll('#certsGrid > .col');
  const start = (page - 1) * ITEMS_PER_PAGE;
  const end = start + ITEMS_PER_PAGE;
  
  items.forEach((item, index) => {
    item.style.display = (index >= start && index < end) ? 'block' : 'none';
  });
  
  currentPage = page;
  
  // Update active states
  document.querySelectorAll('.page-number').forEach((item, index) => {
    item.classList.toggle('active', index % totalPages === (page - 1));
  });
  
  // Update prev/next disabled states
  document.getElementById('prevPageTop').classList.toggle('disabled', page === 1);
  document.getElementById('nextPageTop').classList.toggle('disabled', page === totalPages);
  document.getElementById('prevPageBottom').classList.toggle('disabled', page === 1);
  document.getElementById('nextPageBottom').classList.toggle('disabled', page === totalPages);
}

function changePage(newPage) {
  if (newPage >= 1 && newPage <= totalPages) {
    showPage(newPage);
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }
}
</script>
