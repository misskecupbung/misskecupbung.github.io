---
layout: page
permalink: /talks/
title: talks
description: Conference & community talks delivered as a speaker.
nav: true
nav_order: 2
---

<!-- Auto-generated from _data/talks.yml -->

<div class="talks">
  {% assign sorted_talks = site.data.talks | sort: 'date' | reverse %}
  {% for talk in sorted_talks %}
    <div class="talk mb-4">
      <h3 class="h5 mb-1">{{ talk.title }}</h3>
      <p class="mb-1">
        <strong>{{ talk.event }}</strong> · {{ talk.location }} · {{ talk.date | date: '%b %Y' }}
        {% if talk.role %} · <em>{{ talk.role }}</em>{% endif %}
      </p>
      {% if talk.description %}<p class="small mb-1">{{ talk.description }}</p>{% endif %}
      <p class="small mb-0">
        {% if talk.slides_url %}<a href="{{ talk.slides_url }}" target="_blank">slides</a>{% endif %}
        {% if talk.video_url %}
          {% if talk.slides_url %} · {% endif %}
          <a href="{{ talk.video_url }}" target="_blank">video</a>
        {% endif %}
      </p>
    </div>
  {% endfor %}
</div>

<p class="mt-4"><em>For upcoming sessions and more details see the <a href="https://misskecupbung.wordpress.com/talks" target="_blank">full talks page</a>.</em></p>
