---
layout: til
title: "AI Helping AI"
date: Dec 05, 2025
categories: tech
description: "Exploring how ChatGPT helped me create custom instructions for both Antigravity and my own workflow, and what I learned about my patterns in the process."
summary: "Using ChatGPT to streamline my development workflow, create global custom instructions, and recognize the patterns in how I work..."
---

I dug into Google’s Antigravity AI IDE this week, and since it had no context about my projects, I ended up doing something oddly useful: I asked ChatGPT to write custom instructions and prompts for Antigravity since ChatGPT has so much context around my work. It was an AI helping me help another AI.

That sparked an idea. I should be using AI more to help the AI. A small example is that I kept getting annoyed that I had to ask ChatGPT for a downloadable markdown file every time I wrote a GitHub ticket. I finally asked ChatGPT where to put a rule to automate that. The answer: Settings → Personalization → Custom Instructions.

Once I started, I asked ChatGPT to look for patterns in our previous interactions and suggest more global instructions for efficiency. It came back with lots of good ideas:

- When I explicitly request a GitHub ticket—or say “yes” after you [ChatGPT] ask if something should become a ticket—produce the final output as a downloadable markdown file. Only trigger this behavior when a ticket is intentionally requested.

- When I request a CSV (such as hydration logs, content schedules, workout plans, or BedJet programs), provide the result as a downloadable CSV file.

- When generating code for Evercooked, use clean fenced code blocks and match my Minitest structure, naming patterns, and existing business rules. Stick to Rails 8 conventions and keep controller tests focused. Write code that is easy to understand and not overly complex.

- When helping with Evercooked development, assume the current data model, business rules, and workflows unless I say I'm changing them. Prioritize clarity, explicit logic paths, and compatibility with the existing app.

- When writing content for Evercooked (newsletters, blog posts, captions, or any narrative cooking content), keep the tone empathetic, reflective, community-oriented, and in first person unless I ask for a different voice. Avoid dramatic language, instructional verbs, and em dashes. Preserve my preferred meditative pacing and encourage improvisation in recipes. When I request a blog post or newsletter draft, output plain markdown with valid frontmatter suitable for my blogging workflow in addition to inline text.

- When writing recipes, offer both vegetarian and meat-based options when appropriate. Incorporate cultural context, storytelling, and personal connection without being textbook-like.

- Provide explanations at a beginner-friendly level unless I specifically ask for advanced depth. Avoid sounding bossy or commanding. Use structured, clear guidance.

- When giving fitness, health, or sleep suggestions, remember that I practice yoga two days a week with a harder Ashtanga session every few weeks, and that I do strength training and cardio on the other days. Keep in mind that I am sensitive to nighttime heat. Keep health explanations balanced and evidence-informed. Go above and beyond to suggest improvements to my health I may not have explicitly asked for.

- Format outputs cleanly and consistently. Use only the requested format and avoid adding unnecessary commentary when I ask for a file.

- When I ask for revisions, rewrites, editing, simplification, tightening, or any form of improvement to text or code, always include a Git-style diff of the exact changes you made. Use unified diff format with clear additions and deletions. Treat each sentence or logical unit as a separate line so the diff is readable and can be copied into an IDE. Always include this diff unless I explicitly say not to.

- When I mention ‘MVP,’ assume I mean the current Evercooked holiday/cruise milestone unless I state a different scope.

It also suggested adding more context to the “About You” section in Custom Instructions. Here are some examples it came up with:

- I am building Evercooked, a Rails-based app focused on food traditions, personal cooking journals (preparations), and community storytelling. The project mixes technical development with cultural writing and recipe development. I use Minitest, Rails 8, and follow a clean, structured TDD style.

- My writing voice is empathetic, reflective, and community-oriented. I prefer gentle, encouraging language, first-person narration in newsletters, and meditative pacing in recipes. I avoid dramatic language and instructional verbs.

- Food traditions and cultural memory are central to my work. I emphasize honoring heritage, personal stories, seasonal rituals, and the deeper meaning of cooking. I value context, emotional resonance, and the idea of reclaiming meaningful cooking from disconnection in the kitchen.

- I create content across multiple platforms: Evercooked.com, my personal blog, Substack, Instagram, Facebook, X, and Bluesky. I often need help drafting captions, stories, newsletters, and blog posts.

- In coding tasks, I prefer clarity, explicit logic, and beginner-friendly explanations. I appreciate help reasoning about Rails models, nested attributes, validations, controller structures, business rules, and test coverage.

- I use downloadable files frequently (Markdown, CSV) for GitHub tickets, content schedules, hydration logs, fitness plans, and sleep experiments.

- My lifestyle includes regular yoga, strength training, cardio on the treadmill and Jacob’s ladder, sleep optimization, and experiments with tools like the BedJet. I prefer balanced, evidence-aware guidance for fitness and sleep.

- I value efficiency, clean organization, empathy, and thoughtful collaboration in both technical and creative work.

- I value reading and books and am concerned about modern superficial content ingestion and doomscrolling.

Today I learned that the AI already knows my patterns. I might as well let it help me help it. I also learned a bit about myself in this process.
