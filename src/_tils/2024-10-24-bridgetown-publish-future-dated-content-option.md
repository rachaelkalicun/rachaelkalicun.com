---
layout: til
title:  "Bridgetown Publish Future-dated Content Option"
date:   Oct 24, 2024
categories: bridgetown
description: Learn how to publish future-dated content in Bridgetown. After troubleshooting why a new collection item didn’t appear during development, I found a simple solution, a configuration change.
summary: Today, I spent a couple of hours troubleshooting why a new Bridgetown collection item wasn’t appearing during local development. The item needed to be published next week so I had given it a date for this coming Monday...
---

Today, I spent a couple of hours troubleshooting why a new Bridgetown collection item wasn’t appearing during local development. The item needed to be published next week so I had given it a date for this coming Monday. 

I thought the issue was with the collection setup, but then it finally dawned on me that Bridgetown might not display items with future dates. After some digging, I found [the configuration option](https://www.bridgetownrb.com/docs/collections#custom-collections){:target="_blank"} of `future: true` that allowed me to toggle this behavior so I could see the item from the new collection.



```
# bridgetown.config.yml

collections:
  foo:
    future: true
```
