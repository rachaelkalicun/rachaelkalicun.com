---
layout: til
title:  "Add Classes in Markdown Thanks to kramdown"
date:   Oct 25, 2024
categories: bridgetown
---

To create disabled styling for some headings in Bridgetown content, I wanted to add a `.disabled` class in markdown. Markdown does not support this by default, but luckily, Bridgetown uses the Ruby Markdown converter, [kramdown](https://kramdown.gettalong.org/quickref.html#block-attributes]){:target="_blank"}, which does. 

```
## Sample Heading
{: .disabled }
```

## Default heading styling

## Disabled heading
{: .disabled }
