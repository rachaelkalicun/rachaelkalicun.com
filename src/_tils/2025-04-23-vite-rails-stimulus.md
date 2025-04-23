---
layout: til
title:  "Vite, Rails, Stimulus, Tailwind"
date:   Apr 23, 2025
categories: tech
description: "Rails 8 asset pipeline with Vite, Stimulus, and Tailwind 4: configuration of gems, npm packages, Vite setup, Stimulus controllers, and Tailwind integration."
summary: "Rails 8 asset pipeline with Vite, Stimulus, and Tailwind 4: configuration of gems, npm packages, Vite setup, Stimulus controllers, and Tailwind integration..."
---

Rails 8, Vite, Stimulus, Tailwind 4

## Gems & Packages
Add gems:
- stimulus-rails
- vite_rails

Add packages (devDependencies):
- @hotwired/stimulus
- stimulus-vite-helpers
- vite
- vite-plugin-full-reload
- vite-plugin-ruby
- vite-plugin-stimulus-hmr

Add packages (dependencies)
- @tailwindcss/aspect-ratio
- @tailwindcss/forms
- @tailwindcss/line-clamp
- @tailwindcss/typography
- @tailwindcss/vite
- tailwindcss
- vite-plugin-rails

## Vite

vite.config.mts:

<code>

	import { defineConfig } from 'vite'
	import ViteRails from 'vite-plugin-rails'
	import tailwindcss from "@tailwindcss/vite";

	export default defineConfig({
		clearScreen: false,
		plugins: [
			tailwindcss(),
			ViteRails({
				fullReload: {
					additionalPaths: ["config/routes.rb", "app/views/**/*"],
					delay: 300,
				},
			})
		],
		root: "./app/assets",
		build: {
			manifest: true,
			rollupOptions: {
				input: "./app/frontend/entrypoints/application.js"
			}
		},
		css: {
			preprocessorOptions: {
				scss: {
					api: 'modern-compiler' // or "modern"
				}
			}
		}
	})


CSS & JS managed from /app/frontend.

/app/frontend/entrypoints
- application.css & application.js
- application.js
	- import '../javascript/application'
	- import "~/controllers"
	- console.log('Vite ⚡️ Rails')

Include assets in head:
	<code>

		vite_client_tag
		vite_javascript_tag 'application'
		vite_stylesheet_tag 'application.css', data: { "turbo-track": "reload" }

Run it: bin/vite dev


## Stimulus

/app/frontend/controllers/index.js

<code>

	import { Application } from '@hotwired/stimulus'
	import { registerControllers } from 'stimulus-vite-helpers'

	const application = Application.start()
	const controllers = import.meta.glob("./**/*_controller.js", { eager: true });
	registerControllers(application, controllers)

Test Stimulus by adding a hello controller to /app/frontend/controllers:

<code>

	import { Controller } from "@hotwired/stimulus"

	export default class extends Controller {

			connect() {
					console.log("Hello, Stimulus!")
			}

			static targets = [ "name" ]

			greet() {
					const element = this.nameTarget
					const name = element.value
					console.log(`Hello, ${name}!`)
			}
	}

Then call it from your layout:

<code>

	<div data-controller="hello">
		<input data-hello-target="name" type="text">/</input>
		<button data-action="click->hello#greet">Greet</button>
	</div>

Fill in your name and click "Greet". See output in the console.

## Tailwind

No config file in v4. Add directly to stylesheet.

/app/frontend/entrypoints/application.css

<code>

	@import "../stylesheets/application.tailwind.css";

	@plugin "@tailwindcss/forms";
	@plugin "@tailwindcss/typography";
	@plugin "@tailwindcss/aspect-ratio";

	@theme {
		--font-serif: "EB Garamond", "serif";
		--color-link: #5960B2;
	}

	@layer base {
		h1 {
			font-size: var(--text-2xl);
		}
	}

/app/frontend/stylesheets/application.tailwind.css

<code>

	@import "tailwindcss";

	@source "../../../app/views/**/*.html.erb";
	@source "../../../app/views/**/*.rb";
	@source "../../../app/helpers/**/*.rb";
