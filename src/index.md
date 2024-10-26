---
layout: page
title: 'Home'
---

<div class="mx-auto my-0 bg-white p-[40px] pb-1">
	<h2 class="mt-0">Writing</h2>
  <% collections.posts.each do |post| %>
    <div class="mb-[16px]">
      <div class="mt-0 mb-0">
        <a class="" href="<%= post.relative_url %>"><%= post.data.title %></a>
      </div>
			<div class="text-[10px] text-[#959595] font-medium"><%= post.data.date.to_date.strftime("%B %d, %Y") %></div>
    </div>
  <% end %>
	<div class="mt-2">
		<a class="text-xs text-[#616161]" href="/blog">All of my writing →</a>
	</div>
	<hr class="mt-6">
	<h2 class="mt-6">Tangible work</h2>
	<% collections.tangible_works.each do |tangible| %>
		<div class="mb-[16px]">
			<div class="mt-0 mb-0">
				<a class="" href="<%= tangible.relative_url %>"><%= tangible.data.title %></a>
			</div>
			<div class="text-[10px] text-[#959595] font-medium"><%= tangible.data.date.to_date.strftime("%B %d, %Y") %></div>
		</div>
	<% end %> 
	<div class="mt-2">
		<a class="text-xs text-[#616161]" href="/tangible-work">All of my work away from the keyboard →</a>
	</div>
	<hr class="mt-6">
	<h2 class="mt-6">Today I learned</h2>
	<div class="mb-[16px]">
		<div class="mt-0 mb-0">
			<a class="" href="<%= collections.tils[0].relative_url %>"><%= collections.tils[0].data.title %></a>
		</div>
		<div class="text-[10px] text-[#959595] font-medium"><%= collections.tils[0].data.date.to_date.strftime("%B %d, %Y") %></div>
		<div class="mt-2">
			<a class="text-xs text-[#616161]" href="/today-i-learned">All of the tips I'm learning →</a>
		</div>
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
