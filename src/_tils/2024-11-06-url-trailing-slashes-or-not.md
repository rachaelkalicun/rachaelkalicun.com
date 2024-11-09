---
layout: til
title:  "URL Trailing Slashes - Use Them or Not?"
date:   Nov 6, 2024
categories: seo
description: Today, I revisited the question of trailing slashes in URLs after spotting redirects in Google Search Console and whether URLs should have them or not for SEO optimization.
summary: After reviewing the redirects report today in Google Search Console, I faced the question of whether URLs should have trailing slashes. When I initially set up my URL structure, I made a cursory decision to have directory URLs include trailing slashes but not files... 
---

After reviewing the redirects report today in Google Search Console, I faced the question of whether URLs should have trailing slashes. When I initially set up my URL structure, I made a cursory decision to have directory URLs include trailing slashes but not files. 

For example, [https://www.rachaelkalicun.com/blog/](https://www.rachaelkalicun.com/blog/) has a trailing slash but [https://www.rachaelkalicun.com/blog/anti-role-models](https://www.rachaelkalicun.com/blog/anti-role-models) does not. Then I completely forgot about this decision and created internal links to directories without trailing slashes which created redirects.

I decided to confirm the correct choice from an SEO perspective so I could stick to one approach or the other. In this [article from 2010](https://developers.google.com/search/blog/2010/04/to-slash-or-not-to-slash){:target="_blank"}, Google states that either way is fine, but from a conventional standpoint, directory URLs include trailing slashes and files do not. I'm good there and just need to make sure my internal linking follows this suggestion.

The home page is a tricky one. No trailing slash is visible in the URL bar in Chrome, yet it appears if you copy and paste the URL. I learned [here](https://support.google.com/webmasters/thread/140249355?hl=en&msgid=140249850){:target="_blank"} that it always exists for the home page, but browsers hide it. The canonical version of the home page always includes the slash, while other pages may or may not include it.
