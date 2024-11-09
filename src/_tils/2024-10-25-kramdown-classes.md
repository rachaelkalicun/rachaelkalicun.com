---
layout: til
title:  "Add Classes in Markdown Thanks to kramdown"
date:   Oct 25, 2024
categories: bridgetown
description: Today, I wanted to style some headings as disabled in Bridgetown but found that Markdown doesn't support custom classes by default. Fortunately, Bridgetown’s use of kramdown lets me add them.
summary: To create disabled styling for some headings in Bridgetown content, I wanted to add a `.disabled` class in markdown. Markdown does not support this by default, but luckily, Bridgetown uses the Ruby Markdown converter, kramdown, which does...
---

To create disabled styling for some headings in Bridgetown content, I wanted to add a `.disabled` class in markdown. Markdown does not support this by default, but luckily, Bridgetown uses the Ruby Markdown converter, [kramdown](https://kramdown.gettalong.org/quickref.html#block-attributes]){:target="_blank"}, which does. 

```
## Sample Heading
{: .disabled }
```

## Default heading styling

## Disabled heading
{: .disabled }
