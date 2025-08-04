---
layout: post
title: "Wealth Is Writing a Ruby Script for a Week To Track My Freedom, Not Just My Finances"
date: Aug 4, 2025
description: "An update to my spreadsheet-based budgeting system — now with rule-based categorization, CSV normalization, and a little AI magic."
summary: lorem...
categories: frugality
---

It’s been a full year since I stopped trading my time for money. This is freedom but not the kind that erases fear or doubt. It's the solitary kind. The kind that makes you confront yourself. It gives you space, but it also gives you yourself, unfiltered, 100 percent of the time.

What happened this year was quiet and hard to quantify, but it was a year of:

- figuring out what I should do next
- learning how to be disciplined on my own
- learning how to live with myself at a time when I'm not useful to a team
- reckoning with getting older and seeing there are no guarantees of tomorrow

What I’ve done with this freedom hasn’t always looked productive from the outside (or even from the inside). I decided to build something I care about. It’s taking longer than I anticipated, but I’m not beating myself up over it or apologizing for it. I'm owning it. Even with the freedom to spend time how I want, there are always setbacks, both internal and external. I'm not a machine.

Last week, I paused that main effort and spent a full week writing code for something completely different: a tool to partially automate my financial tracking. Why?
Well, because I wanted to and because I could. That, to me, is one of the definitions of wealth. I can follow what interests me and build something just because I care about it.

But let’s get serious, too. This is America, the land of no safety nets. I still have to worry about money. This kind of freedom depends on a more traditional kind of wealth: the kind with dollar signs.

That’s why I built the tool. I want to keep practicing this version of wealth, but I also want to do it for many decades to come.
So until I make $10 million with my unshipped cooking app, I need to keep answering the question:

> “Can I actually sustain this lifestyle indefinitely?”

---

## Looking Back at the Last Time I Did This

I [wrote about my financial tracking process last November](/blog/cash-flow-tracking). It was a very manual process I started before I quit my job as an attempt to understand how much I actually spend in a year, broken down by category.

I haven’t done it since December because it was a pain in the ass. I had to download CSVs from every bank, credit card, brokerage, and HSA account. I renamed columns, flipped signs, spent half a day deciphering Amazon orders, and manually categorized every transaction.

Now, it’s August. It’s officially been a year since my last paycheck, and that milestone has been weighing on me. I wanted to see my finances clearly and with honesty.
I wanted to answer the real question with real data:

"Is this lifestyle actually viable?"

---

## How the Tool Works

The script I wrote is built in Ruby and designed to handle a bunch of financial institution CSV formats. It:

- Standardizes columns like date, description, and amount
- Automatically flips debits/credits when needed
- Skips known patterns like credit card payments or IRS refunds
- Auto-categorizes transactions
- Has special logic for Amazon orders
- Splits the data into `income.csv` and `expenses.csv`
- Outputs clean, ready-to-import files for [The Measure of a Plan budget tracking tool](https://themeasureofaplan.com/budget-tracking-tool/){:target="_blank"}

![Data](/images/financial-tracking-spreadsheet.jpg "Data")

I drop all my CSVs into a folder, and it does the rest.

```ruby
input_paths = Dir["data/*.csv"]
rows = NormalizeCsvs.normalize_csvs(input_paths, FORMATS)
```

Each institution has quirks so I map to a `FORMATS` hash:

```ruby
FORMATS = {
  "amazon" => {
	type: :expense,
	date: "date",
	description: "items",
	debit: "total",
	credit: "refund",
	bank_account: false
	},
  "capital_one" => {
	type: :expense,
	date: "Transaction Date",
	description: "Description",
	debit: "Debit",
	credit: "Credit",
	bank_account: false
	},
  "fidelity" => {
	type: :income,
	date: "Run Date",
	description: "Action",
	debit: "Amount ($)",
	credit: "Amount ($)",
	bank_account: true
	}
}

```

The script parses and standardizes each row like this:

```ruby
{
  "Date" => "2025-07-10",
  "Description" => "Trader Joe's",
  "Amount" => 49.99,
  "Category" => "Groceries",
  "Notes" => "",
  "Source" => "Citibank",
  "Type" => "Expense"
}
```

It handles:

- Different date formats
- Amounts with `$`, commas, signs, or parentheses
- Credit card vs bank account polarity
- Proper and sometimes custom classifcation of expenses vs. income

---

## Categorization: My Rules

Regex-based rules tag most expenses automatically:

```ruby
CATEGORIZATION_RULES = {
  /safeway|trader joe|natural grocers/i => "Groceries",
  /jiffy lube|progressive|motor vehicle/i => "Car",
  /chatgpt|canva|taxact/i => "Subscriptions",
  /airways|united|hotel/i => "Travel"
}
```

Amazon has its own logic:

```ruby
CATEGORIZATION_RULES_AMAZON = {
  /dog|pet/i => "Dog",
  /nuts|coffee|tea/i => "Groceries",
  /blanket|nonstick|curtain/i => "Home",
  /book|kindle/i => "Books",
  /.*/ => "Amazon - Uncategorized"
}
```

Multi-item Amazon orders like `Dog food; Paper towels` are flagged in a "Notes" column as "Amazon Multi Order" so I can pull them apart manually.

---

## Output: Just Two Files

Once processed, rows are separated:

```ruby
income_rows = rows.select { |r| r["Type"] == "Income" }
expense_rows = rows.select { |r| r["Type"] == "Expense" }

NormalizeCsvs.write_csv("output/income.csv", income_rows, columns)
NormalizeCsvs.write_csv("output/expenses.csv", expense_rows, columns)
```

Each file includes only what I care about:

Date, Description, Amount, Category, Notes, Source

---

## I Trust It Through Tests

I wrote a full test suite using Minitest to catch edge cases and regression issues.

---

## Amazon Data: Still a Work in Progress

I used the [AZAD Chrome extension](https://github.com/philipmulcahy/azad){:target="_blank"} to export my Amazon orders as CSV. It’s been helpful, but I’m relying on a third-party tool that could break or disappear. I’ve considered:
- Tracking purchases manually at the time of purchase (maybe through email confirmations)
- Writing my own scraper

---

## Remaining Limitations

- Downloading CSVs is still annoying. Each institution is different. It’s the most tedious part. Could I build something to automate this? Maybe, but I don’t want to spend more time on this project right now.

- Adding a new account is a manual step. I have to update the script with format info.


- Gift cards: I often buy gift cards around Thanksgiving when bonuses are offered. Should I count the expense when I buy the gift card or when I use it? If I count it at purchase, I lose granularity of categories. (I could buy groceries at Target or motor oil.) If I try to track it at usage, there's no clean electronic trail.

---

## What I Learned After Running It

After running the tool and reviewing the results:

- I’m still on track. If I follow the 4% rule, my expenses are in a sustainable zone.
- Health insurance is the biggest cost, followed by groceries, then home-related expenses.
- Categorizing took 10 minutes. The regex rules covered almost everything.
- The CSV downloads remain the most painful part.


![2025 spending categories](/images/2025-spending-categories.jpg "2025 spending categories")
![2025 grocery spending](/images/2025-grocery-spending.jpg "2025 grocery spending")

---

## Freedom Revisited

Spending a week building this tool is a form of wealth but so is the choice to even care about financial visibility.

This kind of freedom is the kind of wealth I want to preserve. To do that, I need to be sure the machine I’ve built for myself can keep running.

This script helps me with that.

---

## Why I Didn't Use AI (This Time)

I initially thought this project might be the perfect place to use (try for the first time!) AI to analyze and categorize transactions, but once I started implementing my regex rules, I realized I didn’t need it.

Regex gave me full control, predictable behavior, and fast results.

AI did write my readme, though.

---

➡ [View the code on GitHub](https://github.com/rachaelkalicun/budget-tracking)
