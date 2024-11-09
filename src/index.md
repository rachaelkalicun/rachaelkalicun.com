---
layout: page
title: 'Home'
---

<div class="mx-auto my-0 p-[20px] pb-1">
	<h2 class="mt-0 alt_font text-3xl">My Writing</h2>
  <% collections.posts.each do |post| %>
    <div class="mb-[20px]">
      <h3 class="post-title">
        <a href="<%= post.relative_url %>"><%= post.data.title %></a>
      </h3>
			<div class="post-date"><%= post.data.date.to_date.strftime("%B %d, %Y") %></div>
    </div>
  <% end %>
	<div class="mt-2">
		<a class="text-sm text-black" href="/blog/">More blog posts →</a>
	</div>
	<hr class="mt-6">
	<h2 class="mt-6 alt_font text-3xl">Tangible Work</h2>
	<% collections.tangible_works.each do |tangible| %>
		<div class="mb-[20px]">
			<h3 class="post-title">
				<a href="<%= tangible.relative_url %>"><%= tangible.data.title %></a>
			</h3>
			<div class="post-date"><%= tangible.data.date.to_date.strftime("%B %d, %Y") %></div>
		</div>
	<% end %> 
	<div class="mt-2">
		<a class="text-sm text-black" href="/tangible-work/">More work away from the keyboard →</a>
	</div>
	<hr class="mt-6">
	<h2 class="mt-6 alt_font text-3xl">Today I Learned</h2>
	<% collections.tils.each do |til| %>
		<div class="mb-[20px]">
			<h3 class="post-title">
				<a href="<%= til.relative_url %>"><%= til.data.title %></a>
			</h3>
			<div class="post-date"><%= til.data.date.to_date.strftime("%B %d, %Y") %></div>
		</div>
	<% end %>
	<div class="mt-2 mb-6">
		<a class="text-sm text-black" href="/today-i-learned/">More tips →</a>
	</div>
</div>
