---
layout: about
title: About
permalink: /
subtitle: Cloud & DevOps Engineer | AWS Container Hero | Google Developer Expert Cloud - Modern Architecture

profile:
  align: right
  image: ananda.png
  image_circular: false # crops the image to make it circular
  more_info: >
    <p>Singapore</p>

selected_papers: false # includes a list of papers marked as "selected={true}"
social: true # includes social icons at the bottom of the page

announcements:
  enabled: false # includes a list of news items
  scrollable: true # adds a vertical scroll bar if there are more than 3 news items
  limit: 5 # leave blank to include all the news in the `_news` folder

latest_posts:
  enabled: true
  scrollable: true # adds a vertical scroll bar if there are more than 3 new posts items
  limit: 3 # leave blank to include all the blog posts
---

Hi, I'm Ananda Dwi Rahmawati — a Cloud and DevOps Engineer passionate about building scalable, secure, and automated infrastructure.

<div class="highlights-grid">
  <div class="highlight-card">
    <img src="/assets/img/Hero_Container_Graphic-BBIkZZj9.svg" alt="AWS Container Hero Badge" class="badge-icon">
    <h4>AWS Container Hero</h4>
    <p>Recognized for expertise in container technologies</p>
  </div>
  <div class="highlight-card">
    <img src="/assets/img/GDE2025_DigitalBadges_Cloud-Modern.png" alt="Google Developer Expert Badge" class="badge-icon">
    <h4>GDE Cloud</h4>
    <p>Google Developer Expert for Modern Architecture</p>
  </div>
  <div class="highlight-card">
    <i class="fa-solid fa-microphone"></i>
    <h4>Woman in Tech Speaker</h4>
    <p>AWS Summit, Google Cloud Summit, Open Source</p>
  </div>
  <div class="highlight-card">
    <i class="fa-solid fa-certificate"></i>
    <h4>20+ Certifications</h4>
    <p>AWS, GCP, Azure, Terraform, Linux</p>
  </div>
</div>

With experience across AWS, Google Cloud, and Azure, I specialize in Kubernetes orchestration, infrastructure as code, and CI/CD pipelines. I'm also an active speaker at cloud conferences and community events.

When I'm not building infrastructure, you'll find me contributing to open source projects and sharing knowledge through technical talks and blog posts.

<style>
.highlights-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 1rem;
  margin: 2rem 0;
}

@media (max-width: 576px) {
  .highlights-grid {
    grid-template-columns: 1fr;
  }
}

.highlight-card {
  background: var(--global-bg-color);
  border: 1px solid var(--global-divider-color);
  border-radius: 12px;
  padding: 1.25rem;
  text-align: center;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.highlight-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.highlight-card i {
  font-size: 2rem;
  color: var(--global-theme-color);
  margin-bottom: 0.75rem;
}

.highlight-card .badge-icon {
  width: 100px;
  height: 100px;
  object-fit: contain;
  margin-bottom: 0.75rem;
}

.highlight-card h4 {
  font-size: 1rem;
  font-weight: 600;
  margin-bottom: 0.5rem;
  color: var(--global-text-color);
}

.highlight-card p {
  font-size: 0.85rem;
  color: var(--global-text-color-light);
  margin: 0;
}
</style>
