---
layout: page
title: Gallery
permalink: /gallery/
description:
nav: true
nav_order: 7
images:
  photoswipe: true
---

<div class="gallery">

{% if site.data.google_photos and site.data.google_photos.size > 0 %}
<div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 g-3 mb-4">
  {% for photo in site.data.google_photos %}
  <div class="col">
    <div class="gallery-item">
      <a href="{{ photo.full }}" data-pswp-width="1600" data-pswp-height="1200" target="_blank">
        <img src="{{ photo.thumbnail }}" alt="Gallery photo {{ photo.index | plus: 1 }}" class="img-fluid" loading="lazy">
      </a>
    </div>
  </div>
  {% endfor %}
</div>
{% else %}
{% assign gallery_images = site.static_files | where_exp: "file", "file.path contains '/assets/img/gallery/'" %}
{% if gallery_images.size > 0 %}
<div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 g-3 mb-4">
  {% for image in gallery_images %}
  <div class="col">
    <div class="gallery-item">
      <a href="{{ image.path | relative_url }}" data-pswp-width="1200" data-pswp-height="800">
        <img src="{{ image.path | relative_url }}" alt="Gallery photo" class="img-fluid" loading="lazy">
      </a>
    </div>
  </div>
  {% endfor %}
</div>
{% else %}
<p class="text-center text-muted fst-italic mb-4">Photos are loading... Please check back later.</p>
{% endif %}
{% endif %}

<div class="text-center mt-4 mb-4">
  <a href="https://photos.app.goo.gl/tjiChbGu6ZPXbwPr5" target="_blank" class="btn btn-primary btn-lg">
    <i class="fa-solid fa-images me-2"></i> View More on Google Photos
  </a>
</div>

</div>

<style>
.gallery-item {
  overflow: hidden;
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  cursor: pointer;
}

.gallery-item:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

.gallery-item img {
  width: 100%;
  height: 200px;
  object-fit: cover;
  transition: transform 0.3s ease;
}

.gallery-item:hover img {
  transform: scale(1.05);
}

.gallery .btn-primary {
  border-radius: 25px;
  padding: 0.75rem 2rem;
  font-weight: 500;
}

@media (min-width: 768px) {
  .gallery-item img {
    height: 220px;
  }
}

@media (min-width: 992px) {
  .gallery-item img {
    height: 180px;
  }
}
</style>
