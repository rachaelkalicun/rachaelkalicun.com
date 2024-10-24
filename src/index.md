---
layout: page
title: 'Home'
---

<div class="mx-auto my-0 bg-white p-[40px] pb-1">
	<!-- <h2>Sprints</h2>
	<% collections.sprints.each do |sprint| %>
    <div class="mb-10">
      <div class="mt-0 mb-0">
        <a class="" href="<%= sprint.relative_url %>"><%= sprint.data.title %></a>
      </div>
    </div>
  <% end %> -->
	<h2>Today I Learned</h2>
	<% collections.tils.each do |til| %>
    <div class="mb-10">
			<div class="text-[10px] text-[#959595] font-medium"><%= til.data.date.to_date.strftime("%B %d, %Y") %></div>
      <div class="mt-0 mb-0">
        <a class="" href="<%= til.relative_url %>"><%= til.data.title %></a>
      </div>
    </div>
  <% end %> 

	<h2>Recent blog posts</h2>
  <% collections.posts.each do |post| %>
    <div class="mb-10">
      <div class="text-[10px] text-[#959595] font-medium"><%= post.data.date.to_date.strftime("%B %d, %Y") %></div>
      <div class="mt-0 mb-0">
        <a class="" href="<%= post.relative_url %>"><%= post.data.title %></a>
      </div>
      <p class=""><%= post.data.summary %></p>
    </div>
  <% end %>
</div>
