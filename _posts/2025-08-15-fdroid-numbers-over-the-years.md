---
title: F-Droid Numbers over the years
author: paulali
layout: post
---

In 2025 F-Droid turned 15. F-Droid has not only been the front-runner in the
distribution of free and open source Android apps through [F-Droid](https://f-droid.org),
but also as an open source project, has ensured that the people have the power
to distribute their own Android apps using the [tools](https://gitlab.com/fdroid)
created and maintained by the F-Droid contributors.

To mark this celebration, we - the F-Droid contributors - decided to look into
the data metrics that we collect to better gauge how we are doing as a
community. As a project that does not provide user accounts or collect
any data that can be used to identify individual users, this was a challenge,
and a fun one indeed.

**What did we do.**  

Before 2020, there wasn't any effort to collecting data in a privacy preserving
manner. Therefore, we can only speculate on the number of users who used
F-Droid services then.

In November of 2020, the [metrics project](https://gitlab.com/fdroid/metrics) was
launched. The [data collected](https://f-droid.org/2021/03/01/fdroid-metrics-and-clean-insights.html) contains no Personally Identifiable Information
(PII). The data is collected from the following F-Droid services and metrics (links to raw JSON data follow).

* [F-Droid Search](https://fdroid.gitlab.io/metrics/search.f-droid.org/index.json)
* F-Droid Fronter Hits
   * [http02.fdroid.net](https://fdroid.gitlab.io/metrics/http02.fdroid.net/index.json)
   * [http03.fdroid.net](https://fdroid.gitlab.io/metrics/http03.fdroid.net/index.json)
* [F-Droid onion link](https://fdroid.gitlab.io/metrics/fdroidorg6cooksyluodepej4erfctzk7rrjpjbbr6wx24jh3lqyfwyd.onion/index.json)
* F-Droid app download and upgrade numbers

Below is a further description of the data and what it means for each service
and metric.

## F-Droid Search Metrics

This metric shows the number of times users search for apps on f-droid.org
using the [search](https://search.f-droid.org/?q=jobs&lang=en) feature on
the [website](https://f-droid.org).

The numbers are presented in the table below.

| Month   | Hits      |
| ------- | --------- |
| 2020-11 | 265,996   |
| 2020-12 | 1,186,638 |
| 2021-01 | 1,320,210 |
| 2021-02 | 1,645,448 |
| 2021-03 | 1,858,700 |
| 2021-04 | 1,616,715 |
| 2021-05 | 1,867,975 |
| 2021-06 | 1,565,141 |
| 2021-07 | 1,781,318 |
| 2021-08 | 2,419,274 |
| 2021-09 | 2,047,334 |
| 2021-10 | 1,961,384 |
| 2021-11 | 2,680,043 |
| 2021-12 | 2,200,949 |
| 2022-01 | 2,613,898 |
| 2022-02 | 1,997,237 |
| 2022-03 | 1,863,906 |
| 2022-04 | 1,867,550 |
| 2022-05 | 2,251,206 |
| 2022-06 | 1,820,566 |
| 2022-07 | 1,936,238 |
| 2022-08 | 2,696,882 |
| 2022-09 | 2,290,475 |
| 2022-10 | 2,874,234 |
| 2022-11 | 2,258,575 |
| 2022-12 | 2,386,662 |
| 2023-01 | 3,160,112 |
| 2023-02 | 3,136,628 |
| 2023-03 | 3,148,918 |
| 2023-04 | 3,084,383 |
| 2023-05 | 3,154,236 |
| 2023-06 | 2,328,468 |
| 2023-07 | 2,662,603 |
| 2023-08 | 2,199,464 |
| 2023-09 | 2,108,825 |
| 2023-10 | 2,680,451 |
| 2023-11 | 2,149,480 |
| 2023-12 | 2,245,014 |
| 2024-01 | 3,076,485 |
| 2024-02 | 3,046,572 |
| 2024-03 | 3,203,081 |
| 2024-04 | 3,243,717 |
| 2024-05 | 2,554,405 |
| 2024-06 | 2,273,501 |
| 2024-07 | 3,125,023 |
| 2024-08 | 2,457,721 |
| 2024-09 | 3,027,826 |
| 2024-10 | 2,562,435 |
| 2024-11 | 2,516,645 |
| 2024-12 | 3,210,042 |
| 2025-01 | 2,990,231 |
| 2025-02 | 3,075,202 |
| 2025-03 | 3,766,815 |
| 2025-04 | 3,162,487 |
| 2025-05 | 3,156,053 |
| 2025-06 | 4,098,797 |
| 2025-07 | 3,330,615 |
| 2025-08 | 3,372,221 |
| 2025-09 | 4,154,186 |
| 2025-10 | 3,325,428 |
| 2025-11 | 3,656,648 |

The table above shows the number of connections that accessed F-Droid search
from November 2020 to November 2025.There is consistent growth month by
month over the 5 year period.

## F-Droid Fronter Hits

This metric shows the number of connections to the F-Droid website. Each
fronter will have the number of connection it received in the data collection
period as shown below.

### http02 fronter hits

| Month   | Hits          |
| ------- | ------------- |
| 2024-01 | 21,546,381    |
| 2024-02 | 85,089,689    |
| 2024-03 | 158,593,035   |
| 2024-04 | 109,912,321   |
| 2024-05 | 104,590,310   |
| 2024-06 | 135,725,158   |
| 2024-07 | 151,947,876   |
| 2024-08 | 101,168,723   |
| 2024-09 | 137,161,762   |
| 2024-10 | 127,143,117   |
| 2024-11 | 200,410,805   |
| 2024-12 | 1,047,236,637 |
| 2025-01 | 1,491,310,176 |
| 2025-02 | 1,760,707,968 |
| 2025-03 | 1,945,453,192 |
| 2025-04 | 1,025,689,938 |
| 2025-05 | 953,816,373   |
| 2025-06 | 1,132,439,739 |
| 2025-07 | 862,084,794   |
| 2025-08 | 870,386,289   |
| 2025-09 | 848,930,866   |
| 2025-10 | 452,893,186   |
| 2025-11 | 551,874,640   |

### http03 fronter hits

| Months  | Hits          |
| ------- | ------------- |
| 2024-02 | 2,835,510     |
| 2024-03 | 12,715        |
| 2024-04 | 46,238,229    |
| 2024-05 | 105,560,545   |
| 2024-06 | 135,224,122   |
| 2024-07 | 153,495,748   |
| 2024-08 | 100,004,482   |
| 2024-09 | 129,286,687   |
| 2024-10 | 130,024,541   |
| 2024-11 | 195,438,452   |
| 2024-12 | 956,559,070   |
| 2025-01 | 829,822,187   |
| 2025-02 | 1,460,794,885 |
| 2025-03 | 1,978,080,504 |
| 2025-04 | 994,181,547   |
| 2025-05 | 1,035,093,450 |
| 2025-06 | 47,490,215    |

(_http03 was replaced by http04 then shutdown, http04 metrics coming soon!_)

## F-Droid link hits

This table shows the number of connections that have connected to the f-droid
link page.

| Month   | Hits    |
| ------- | ------- |
| 2024-01 | 82,368  |
| 2024-02 | 330,922 |
| 2024-03 | 275,087 |
| 2024-04 | 316,553 |
| 2024-05 | 277,902 |
| 2024-06 | 338,396 |
| 2024-07 | 360,029 |
| 2024-08 | 288,321 |
| 2024-09 | 406,761 |
| 2024-10 | 430,963 |
| 2024-11 | 357,742 |
| 2024-12 | 560,095 |
| 2025-01 | 490,452 |
| 2025-02 | 426,704 |
| 2025-03 | 623,554 |
| 2025-04 | 389,331 |
| 2025-05 | 342,379 |
| 2025-06 | 537,703 |
| 2025-07 | 436,976 |
| 2025-08 | 517,419 |
| 2025-09 | 542,166 |
| 2025-10 | 413,071 |
| 2025-11 | 229,179 |

## F-Droid Onion Link hits

This table shows the number of connections that connected to the F-Droid Onion
link that can be accessed via Tor.

| Month   | Hits      |
| ------- | --------- |
| 2024-01 | 125,798   |
| 2024-02 | 469,100   |
| 2024-03 | 374,359   |
| 2024-04 | 383,620   |
| 2024-05 | 228,972   |
| 2024-06 | 289,633   |
| 2024-07 | 511,438   |
| 2024-08 | 573,976   |
| 2024-09 | 1,261,001 |
| 2024-10 | 1,189,623 |
| 2024-11 | 629,630   |
| 2024-12 | 687,883   |
| 2025-01 | 532,203   |
| 2025-02 | 544,615   |
| 2025-03 | 144,912   |
| 2025-04 | 447,398   |
| 2025-05 | 562,671   |
| 2025-06 | 485,385   |
| 2025-07 | 451,724   |
| 2025-08 | 798,294   |
| 2025-09 | 711,292   |
| 2025-10 | 269,173   |
| 2025-11 | 288,840   |

## F-Droid app download numbers

The table below shows the number of app downloaded from
[f-droid.org](fdroid.org).
The number of apps downloaded and updated in 2025 - December 1st 2025 -
as of the time of writing this blog is almost surpassing the number of
apps downloaded and updated in 2024.

| Year                         | Number of Downloaded Apps |
| -----------------------------| ------------------------- |
| 2024                         | 4,341,930,948             |
| January to December 1st 2025 | 18,246,286,456            |

## Conclusion

The number above do show that over the years, F-Droid has become a service
that users trust and keep using on a daily basis.
We do hope that you can support us by making a [donation](https://f-droid.org/en/donate/)
so that we can keep doing this for another 15 more years.

Thank you very much for using F-Droid.
