---
layout: post
title:  "Using Jira Automation to Clone Epics and Children into a Future Sprint"
description: How I automated creating recurring epics and children while adding them to a future sprint.
date:   Nov 17, 2024
categories: agile
summary: In my new personal Agile practice, I wanted to make the process of setting up sprints easier. I decided to automate the creation of epics and tasks, which recur each sprint. These would then be added to the next sprint automatically....
---

In my new [personal Agile practice](/blog/personal-agile-practice), I wanted to make the process of setting up sprints easier. I decided to automate the creation of epics and tasks, which recur each sprint. These would then be added to the next sprint automatically.

The first element required for a Jira automation is a [trigger](https://support.atlassian.com/cloud-automation/docs/jira-automation-triggers/){:target="_blank"}, the event that kicks off the automation. I chose the trigger "[sprint created](https://support.atlassian.com/cloud-automation/docs/jira-automation-triggers/#Sprint-created--started--or-completed){:target="_blank"}." I planned to manually create a new sprint each week, and then the automation would populate it with the recurring tasks.

I added an [_if_ condition](https://support.atlassian.com/cloud-automation/docs/jira-automation-conditions/#If-else-block){:target="_blank"} to match a specific epic to clone. I then created a clone [action](https://support.atlassian.com/cloud-automation/docs/jira-automation-actions/){:target="_blank"} for the epic and added a [branch](https://support.atlassian.com/cloud-automation/docs/jira-automation-branches/){:target="_blank"} to apply the same logic to its children. Unfortunately, I got a glaring and confusing error: 

"This component may be incompatible. One of the following needs to be produced earlier in the rule by the trigger or with a 'for each' branch for this component to work: Issue."

Upon further investigation, this error occurred because there wasn't a reference issue for the transition. If the automation had originally been triggered by something related to an issue, it would've had a reference issue. The _if_ condition did not achieve this as I had hoped. 

![Jira Sprint Created Trigger Error](/images/jira_sprint_created_trigger_error.jpg "Jira Sprint Created Trigger Error")

To fix this, I attempted to create a branch off of the trigger using JQL to reference the epic. This worked for the epic but not for the children since Jira automations do not support nested branches. Without nested branches, the children couldn't reference the parent.

<img src="/images/jira_children_issue_error.jpg" alt="Jira Children Issue Error" title="Jira Children Issue Error" width="540"/>

Finally, I learned that using a [scheduled trigger](https://support.atlassian.com/cloud-automation/docs/jira-automation-triggers/#Scheduled){:target="_blank"} allows matching on issues with JQL. I am now referencing three epics that will recur each sprint. Every Friday morning, the automation clones these epics, appending the week number to each epic's summary to avoid duplicate names. Then the children are cloned. All are added to the next sprint. The story points, assignee, and descriptions are cloned, too. [Smart values](https://confluence.atlassian.com/automation/smart-values-in-jira-automation-993924627.html){:target="_blank"} were instrumental in populating these correctly.

## The Automation Flow:
**Schedule Trigger:**
- Runs every Friday at 9 AM.
- Uses JQL to specify the epics to clone. 

![Jira Automation Schedule Trigger](/images/jira_schedule_trigger.jpg "Jira Automation Schedule Trigger")

**Clone Issue Action:**
- Utilizes smart values to populate the summary, description, and story point estimate from the original epic.
- Appends "week #" to summaries to avoid duplicate epic names.
- Adds the cloned epic to the next sprint.

![Jira Clone Epic Action](/images/jira_clone_epic_action.jpg "Jira Clone Epic Action")

**Create Variable Action:**
- Creates a variable referencing the cloned epic so it can be passed to the cloned children.

![Jira Cloned Epic Key Variable](/images/jira_cloned_epic_key_variable.jpg "Jira Cloned Epic Key Variable")

**Create Branch for Children:**
- Loops through the child issues.
- Uses smart values to populate the summary, description, and story point estimates.
- References the cloned epic as the parent using the new clonedEpicKey variable.

![Jira Children Branch](/images/jira_epic_children_branch.jpg "Jira Children Branch")
{: .mb-5 }

![Jira Clone Children Action](/images/jira_clone_children_action.jpg "Jira Clone Children Action")

## Limitations: 

1. **No future sprint:** If a future sprint has not been created, the tickets will get added to the backlog. This is not ideal but not a huge deal since it's  easy to drag the new tickets from the backlog into the new sprint. To address this, I might create an automation to create a new sprint prior to this automation running.

2. **Story point errors:** I ran into trouble with story points. My tasks use the "Story Points Estimate" field, but this field isn't available in the clone action. "Story Points" is, though. Initially, I didn't notice the difference and got errors indicating the field couldn't be found on the issue types. I fixed this by adding the "Story Points Estimate" field to the JSON additional fields section. I also set the default story points to 0 if the field was null, otherwise I got errors.

<img src="/images/jira_additional_fields_story_point_estimate.jpg" alt="Jira Additional Fields Story Point Estimate" title="Jira Additional Fields Story Point Estimate" width="726"/>

## New Sprint Populated from Automation:
![Jira Sprint Populated Using Automation](/images/jira_automated_sprint_population.jpg "Jira Sprint Populated Using Automation")

While this process took a lot more time than I'd ever spend manually creating the tickets, I embraced it as a learning opportunity and am glad I invested the effort. It was certainly a challenge that I overcame.
