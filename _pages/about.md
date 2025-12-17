---
layout: about
title: About
permalink: /
subtitle:

profile:
  align: false
  image:
  image_circular: false
  more_info:

selected_papers: false
social: true

announcements:
  enabled: false
  scrollable: true
  limit: 5

latest_posts:
  enabled: true
  scrollable: true
  limit: 3
---

<div class="hero-section">
  <div class="hero-left">
    <p class="hero-subtitle">Cloud & DevOps Engineer | AWS Container Hero | Google Developer Expert Cloud - Modern Architecture</p>
    <p class="hero-intro">Hi, I'm Ananda Dwi Rahmawati — a Cloud and DevOps Engineer passionate about building scalable, secure, and automated infrastructure.</p>
    <p class="hero-description">With experience across AWS, Google Cloud, and Azure, I specialize in Kubernetes orchestration, infrastructure as code, and CI/CD pipelines. I'm also an active speaker at cloud conferences and community events.</p>
    <p class="hero-description">When I'm not building infrastructure, you'll find me contributing to open source projects and sharing knowledge through technical talks and blog posts.</p>
  </div>
  <div class="hero-right">
    <img src="/assets/img/ananda.png" alt="Ananda Dwi Rahmawati" class="hero-image">
    <p class="hero-location">Singapore</p>
  </div>
</div>

<div class="highlights-grid">
  <a href="https://builder.aws.com/community/heroes/AnandaDwiRahmawati" target="_blank" class="highlight-card badge-card">
    <img src="/assets/img/Hero_Container_Graphic-BBIkZZj9.svg" alt="AWS Container Hero Badge" class="badge-icon">
    <h4>AWS Container Hero</h4>
    <p>Recognized for expertise in container technologies</p>
  </a>
  <a href="https://developers.google.com/profile/u/misskecupbung" target="_blank" class="highlight-card badge-card">
    <img src="/assets/img/GDE2025_DigitalBadges_Cloud-Modern.png" alt="Google Developer Expert Badge" class="badge-icon">
    <h4>GDE Cloud</h4>
    <p>Google Developer Expert for Modern Architecture</p>
  </a>
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

<style>
.hero-section {
  display: flex;
  gap: 2rem;
  align-items: center;
  margin-bottom: 2rem;
}

.hero-left {
  flex: 1;
}

.hero-subtitle {
  font-size: 1rem;
  color: var(--global-text-color-light);
  margin-bottom: 1rem;
}

.hero-intro {
  font-size: 1.1rem;
  line-height: 1.6;
  color: var(--global-text-color);
  margin-bottom: 1rem;
}

.hero-description {
  font-size: 1rem;
  line-height: 1.6;
  color: var(--global-text-color);
  margin-bottom: 0.75rem;
}

.hero-right {
  flex-shrink: 0;
  text-align: center;
}

.hero-image {
  width: 280px;
  height: auto;
  border-radius: 8px;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.hero-location {
  margin-top: 0.5rem;
  font-family: monospace;
  font-size: 0.9rem;
  color: var(--global-text-color-light);
}

@media (max-width: 768px) {
  .hero-section {
    flex-direction: column-reverse;
    text-align: center;
  }
  
  .hero-image {
    width: 200px;
  }
}

.highlights-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 1rem;
  margin: 2rem 0;
  clear: both;
}

@media (max-width: 992px) {
  .highlights-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 576px) {
  .highlights-grid {
    grid-template-columns: 1fr;
  }
}

a.highlight-card {
  text-decoration: none;
  color: inherit;
}

a.highlight-card:hover {
  text-decoration: none;
}

.highlight-card {
  background: var(--global-bg-color);
  border: 1px solid var(--global-divider-color);
  border-radius: 12px;
  padding: 1.25rem;
  text-align: center;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.highlight-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.highlight-card i {
  font-size: 2.5rem;
  color: var(--global-theme-color);
  margin-bottom: 0.75rem;
}

.highlight-card .badge-icon {
  width: 120px;
  height: 120px;
  object-fit: contain;
  margin-bottom: 0.75rem;
}

.highlight-card h4 {
  font-size: 0.9rem;
  font-weight: 600;
  margin-bottom: 0.5rem;
  color: var(--global-text-color);
}

.highlight-card p {
  font-size: 0.8rem;
  color: var(--global-text-color-light);
  margin: 0;
}
</style>
