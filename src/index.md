---
layout: page
title: ''
---

<div class="sm:w-[640px] mx-auto my-0 bg-white p-[40px] pb-1">
  <% collections.posts.each do |post| %>
    <div class="mb-10">
      <div class="text-xs"><%= post.data.date.to_date.strftime("%B %d, %Y") %></div>
      <h2 class="text-base mt-0 mb-0">
        <a class="" href="<%= post.relative_url %>"><%= post.data.title %></a>
      </h2>
      <p class="text-sm"><%= post.data.summary %></p>
    </div>
  <% end %>
</div>
