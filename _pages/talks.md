---
layout: page
title: talks
permalink: /talks/
description: Conference presentations at AWS Summit, Google Cloud Summit, and Azure Community Conference
nav: true
nav_order: 3
---

<div class="talks">

---

### Speaker Deck

{% if site.data.speakerdeck_presentations and site.data.speakerdeck_presentations.size > 0 %}

<div class="row row-cols-1 row-cols-md-2 g-4 mb-4">
  {% for talk in site.data.speakerdeck_presentations %}
  <div class="col">
    <div class="card h-100">
      <div class="card-body">
        <h5 class="card-title">
          <a href="{{ talk.url }}" target="_blank">{{ talk.title }}</a>
        </h5>
      </div>
      <div class="card-footer">
        <a href="{{ talk.url }}" target="_blank" class="btn btn-sm btn-outline-primary">
          <i class="fa-solid fa-arrow-up-right-from-square"></i> View Slides
        </a>
      </div>
    </div>
  </div>
  {% endfor %}
</div>
{% else %}
<p class="text-muted">Loading presentations from Speaker Deck...</p>
{% endif %}

<p class="mt-4">
  <a href="https://speakerdeck.com/misskecupbung" target="_blank" class="btn btn-primary">
    <i class="fa-solid fa-arrow-up-right-from-square"></i> View All on Speaker Deck
  </a>
</p>

</div>