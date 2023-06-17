---
layout: page
permalink: /categories/
title: Categories
---

<div id="archives">
  {% for category in site.categories reversed %}
    <div class="archive-group">
      {% capture category_name %}{{ category | first }}{% endcapture %}

      <h3 class="category-head">{{ category_name }}</h3>

      {% for post in site.categories[category_name] %}
        <article class="archive-item">
          <li><span>{{ post.date | date_to_string }}</span> &nbsp;<a href="{{ site.baseurl }}{{ post.url }}">{{post.title}}</a></li>
        </article>
      {% endfor %}

    </div>
  {% endfor %}
</div>

