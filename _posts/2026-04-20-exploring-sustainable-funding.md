---
title: Exploring Sustainable Funding for Free Software
layout: post
author: HStill
---

If you have ever tried explaining the concept of free software to someone who is locked into a proprietary software ecosystem, you were probably met with some degree of confusion.

The first question, _"But if it's free, how do the people that create it get paid?"_

And while it is an interesting question, It is not the right question. At least not at first.

[Free Open Source Software](https://en.wikipedia.org/wiki/Free_and_open-source_software) (FOSS) has an inherent marketing and communications problem, in that when most people see the word "free" they understand "without cost" or "gratis". [Free Libre Open Source Software](https://www.gnu.org/philosophy/floss-and-foss.html) (FLOSS) does a somewhat better job at explaining this, however, those who are not familiar with French may not find the "Libre (L)" very helpful.

Once we get past the fact that free *can* mean without cost, but doesn't necessarily *always* mean without cost, we get to an arguably more interesting question, _"What does free software mean?"_

From there we can explain the concept of a black box vs open source code, how free software improves transparency, trustworthiness, user freedom and sovereignty. We can explain how free software creates an environment that spurs innovation and creation, helping people solve complex problems by building on each other's ideas. It's wonderful and powerful, but then comes perhaps the most interesting question, _"but if its open and people can build on each others ideas, then should you charge people to use it? How do the people get paid and how is this whole thing sustainable?"_

A main challenge the FOSS community has been [grappling with for years](https://www.fordfoundation.org/learning/library/research-reports/roads-and-bridges-the-unseen-labor-behind-our-digital-infrastructure/) is how to keep projects sustainable. Luckily the FOSS community is incredibly generous and passionate, with members contributing countless hours of their time voluntarily. Many FOSS projects start out because one developer encountered a problem, tried to solve it, then realized other people experienced the same problem and wanted to join in to try and solve it together. However, [the developer's dilemma](https://futo.tech/blog/shifting-perspectives-on-open-source) is whether this approach [is sustainable](https://www.linuxfoundation.org/hubfs/LF Research/Open Source Maintainers 2023 - Report.pdf).

Projects that run entirely on volunteer support can be fragile or struggle to scale because developer burn out and contributor turnover lead to unmaintained and underdeveloped projects, with less than stellar user support. In some cases it can even have [significant upstream consequences](https://heartbleed.com/ "https://heartbleed.com/") or result in [developers throwing their hands up in the air](https://devtechinsights.com/open-source-maintainer-burnout/). So what can we do?

Donations, grants, sponsorships, foundations and for-profit business models emerge as a way to tackle the issue. In some cases proprietary software companies hire and compensate developers to actively contribute to and maintain FOSS projects they use in their tech stack to ensure they remain stable and continue to develop. Some projects opt to use advertizing as a way to generate income, while others opt for free and enterprise versions to sustain themselves, because at the end of the day, if the developers don't have a way to receive monetary compensation, their volunteer time resources will always be in direct competition with their day jobs.

### So what about F-Droid?

Like many open source projects, F-Droid relies heavily on volunteer contributions, grants and donations to support new feature and infrastructure development as well as maintain the project. However, challenges such as unclear value communication, lack of transparency, and friction in donation flows continue to limit the effectiveness of funding efforts.

So we asked the question, how can FOSS projects design donation management systems and governance that are both effective and aligned with community values?

Over the past year, F-Droid has been researching this question as part of the **Open Technology Fund (OTF) FOSS Sustainability Grant**. This work allowed us to focus on understanding how FOSS projects manage donations, how users perceive funding requests, and what practices contribute to successful and sustainable donation management.

Our research combined both quantitative and qualitative methods. We conducted a community survey with 84 responses and carried out a series of interviews with organizations, developers and users across the open source ecosystem. Then we shared the results of this work during a workshop at **FOSDEM 2026** titled ["The Funding Gap in FOSS: What We Learned and How to Close It"](https://fosdem.org/2026/schedule/event/YRVGCK-the_funding_gap_in_foss_what_we_learned_and_how_to_close_it/).

Now it's time to share our findings here with our community as well.

### Survey Says...

Before we dive into results or the analysis, who took the survey? Of the 84 people that participated in the survey, 53 had contributed to FOSS projects, 27 were currently or had been FOSS project maintainers and 6 had been involved in running or conducting donation campaigns for FOSS projects. 19 out of the 84 had organized or participated in a donation campaign and reported their core challenges were organizing the campaign itself, including technical set up. They struggled with how to transparently report on the campaign and said they did not fully understand donor behavior and awareness, or the ethical aspects of receiving donations. Now what did they think about donations in FOSS?

First of all, almost all said they believe it is acceptable for FOSS projects to ask for donations, indicating there was a shared understanding that donations were necessary in order to sustain and grow FOSS projects. More than half of respondents said asking for donations is extremely important.

We were also interested in exploring which donation communication methods felt pushy and off-putting. The majority of the respondents reported that pop up notifications with a click to exit were their least favorite way of receiving information about donation campaigns. The key takeaway was that while donation campaigns are necessary, they should not be the first thing a user sees.

Another key aspect of our research focused on what makes campaigns trustworthy, which strongly pointed back to how funds are managed. Respondents said transparency, honest and respectful communication are key, and that there needs to be clear project and donation goals. Community validation was important as well as consistent team members working on the project. They also said having easy, established and anonymous payment methods was important in how they perceived the campaigns.

We also asked what kind of information donors would like FOSS projects to publicly communicate. Survey participants said the cost breakdown, funding goals, donation impact, how funds are allocated, annual reporting and legal organization and core number of contributors were important to them, which closely mapped back to factors that influenced a campaign's trustworthiness.

Notably users consistently acknowledged that FOSS apps/projects put in a lot of good work and deserve to get donations. However, there is an assumption that the "free" in FOSS means "gratis", so users should not be pressured to donate. Indeed many FOSS projects do not ask for donations at all. Finally users reported that they are generally speaking alright with being asked to donate, so long as it is done properly and not in a way that spams, coerces or blocks usage of the apps. Alright, so what did the interviews tell us?

### Interviews

We also conducted a series of interviews with organizations from the FOSS ecosystem to understand their best practices for donation management, including how to structure and communicate campaigns, and how to receive funds transparently.

The interviews closely aligned with survey results, with participants highlighting specific campaign and project goals, impact communication, transparency surrounding the campaign, reporting on who is handling the funds, and consistency in messaging and team members, as key strategies for organizing and managing donation funds. Notably having clear policies, consistency and governance were key recommendations as well.

### Recommendations for F-Droid

Based on the survey and interviews we identified several areas where F-Droid could improve its donations management, communications and campaigns, including the following:

* Improve donation allocation transparency via consistent reporting and updating our donations allocation policies (started, new donation travel policy implemented with more to come)
* Improve our website copy and design to communicate impact (completed in Feb 2026, donation page to be updated soon)
* Launch our first campaign in 2026 using research best practices
* Create donation campaign widgets and share with app devs to support them launching their own campaigns
* Communicate with past donors, thanking them and sharing impact
* Create clear donation tiers with impact description (completed in Feb 2026)
* Exploring partnership opportunities
* Communicate our values, mission, and vision for F-Droid (completed in Feb 2026)
* Include testimonials from past contributors and improve storytelling

### Making FOSS financially sustainable

As with most research projects, the end is only the beginning. There is more to explore, more to expand on and definitely more work to be done. Making FOSS financially sustainable requires participation, experimentation, and collaboration; things the FOSS community does really, really well. There isn't a lack of support when it comes to open source, but we do need better systems, governance and clearer communication between project contributors and their communities. Our research and the actions listed above are only the starting point to a much larger exploration into how we can make F-Droid and other FOSS projects more financially sustainable.

In the spirit of free software, we would invite developers, maintainers, users and funders to continue engaging with us on this, share your experiences, successes and best practices as we help shape approaches to funding that are sustainable, transparent and true to the values of free software.
