---
layout: page
title: 'Home'
---

<div class="mx-auto my-0 bg-white p-[20px] sm:p-[40px] pb-1">
	<h2 class="mt-0">Writing</h2>
  <% collections.posts.each do |post| %>
    <div class="mb-[16px]">
      <div class="mt-0 mb-0">
        <a href="<%= post.relative_url %>"><%= post.data.title %></a>
      </div>
			<div class="post-date"><%= post.data.date.to_date.strftime("%B %d, %Y") %></div>
    </div>
  <% end %>
	<div class="mt-2">
		<a class="text-xs text-[#616161]" href="/blog/">More blog posts →</a>
	</div>
	<hr class="mt-6">
	<h2 class="mt-6">Tangible work</h2>
	<% collections.tangible_works.each do |tangible| %>
		<div class="mb-[16px]">
			<div class="mt-0 mb-0">
				<a href="<%= tangible.relative_url %>"><%= tangible.data.title %></a>
			</div>
			<div class="post-date"><%= tangible.data.date.to_date.strftime("%B %d, %Y") %></div>
		</div>
	<% end %> 
	<div class="mt-2">
		<a class="text-xs text-[#616161]" href="/tangible-work/">More work away from the keyboard →</a>
	</div>
	<hr class="mt-6">
	<h2 class="mt-6">Today I learned</h2>
	<div class="mb-[16px]">
		<div class="mt-0 mb-0">
			<a href="<%= collections.tils[0].relative_url %>"><%= collections.tils[0].data.title %></a>
		</div>
		<div class="post-date"><%= collections.tils[0].data.date.to_date.strftime("%B %d, %Y") %></div>
	</div>
	<div class="mt-2 mb-6">
		<a class="text-xs text-[#616161]" href="/today-i-learned/">More tips →</a>
	</div>
	<!-- <hr class="mt-6">
	<h2 class="mt-6">This week</h2>
	<% collections.sprints.each do |sprint| %>
    <div class="mb-[16px]">
      <div class="mt-0 mb-0">
        <a class="" href="<%= sprint.relative_url %>"><%= sprint.data.title %></a>
      </div>
    </div>
  <% end %> -->
</div>
