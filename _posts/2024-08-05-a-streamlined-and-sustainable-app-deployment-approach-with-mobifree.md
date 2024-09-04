---
title: A streamlined and sustainable app deployment approach with Mobifree
author: HStill
layout: post
---

Imagine you created your very first app. You developed the concept, worked tirelessly on the key features, design, tested it and fixed the bugs. The moment has finally arrived and you are ready to share your creation with the world. But how? App stores are a great tool for sharing apps with end users, but each store has its own unique requirements, upload and approval process and for some, such as the Google Play Store, you need to pay a developer registration fee and create an account including a physical address to even get started.

If you are a new developer, trying to bring your first app to market, the learning curve can feel a little steep. Once you have done it the first time, one could argue that the process feels somewhat familiar. However with each new release, each new update for your app, comes additional manual steps to follow. 

So, if you were faced with the choice of navigating the app deployment and upload process with one app store, or doing it several times over with different app stores, with unique requirements and deployment processes, what would you choose? 

For most new Android developers, the answer is simple, just get the app on Google Play and call it a day. And the reality is that the conversation often stops there for many mainstream Android app developers, feeding the monopoly and strengthening the hold Big Tech has on the market. 

F-Droid is of course an excellent FOSS based alternative for those looking for a privacy-focused, community-led app store. But we are not the only app store solution developers could choose from. So what if there was a way to open up the market for new and existing developers by creating some fair and healthy competition? What if we could streamline the app deployment process, making it easier for developers to upload their APK to multiple stores at the push of a button? Well, this is exactly what F-Droid will be focusing on creating, for our initial contribution to the [Mobifree](https://f-droid.org/2024/05/24/mobifree.html) project.

## User Research to Discover Pain Points and Potential Solutions

To get started we began with a series of user research interviews to gain a deeper perspective on the current challenges developers and alternative app stores have, when it comes to app deployment. We paid particular attention to various compensation models favored by the developers and explored how to incorporate easy payment options into our solution.

The results of the study were clear, developers are interested in listing their app on alternative app stores, but the app deployment and upload process to multiple stores is not straightforward. This results in a centralized market, with the majority of mainstream apps simply ending up on one app store. If we want to decentralize the market, and create more choice for developers and end users, then we need to make it easier for developers to list their app on multiple stores, streamline the update process, and consider developer compensation in our solution as well.

After successfully identifying the pain points, some market research participants pointed out a FOSS-based solution on the market that solves some of them - [Fastlane](https://fastlane.tools/). Fastlane is an open-source platform aimed at simplifying Android and iOS deployment, by helping developers automate their development and release workflow. We had already been exploring how we could potentially use a Fastlane framework for our idea, so when some of our study participants mentioned they were already implementing Fastlane tools to automate their Google Play launches and updates, we took that as a good sign.

However we noticed some limitations within the Fastlane framework. Their main focus is automating the app deployment, upload and review process for the two biggest players - Google Play and the Apple App Store. Our goal is to create a workflow that automatically deploys and uploads to multiple stores simultaneously, helping diversify the market.

In addition to Fastlane´s app upload feature, the Fastlane core team and community have created a nice list of additional [plug-ins](https://docs.fastlane.tools/actions/) for developers to further automate various aspects of the app development, screenshot generation, testing, uploading and the updating process.

Once we begin the development process, we will have a clearer idea of how we can lean on Fastlane´s existing framework, for our own solution. 

## Accounting for Financial Sustainability

Our aim is to create a solution that is streamlined and straightforward, encouraging a decentralization of the app market in general. But in order to create a solution that will be mainstream enough to make in-roads into the hold Big Tech has on the market, we need to consider how to streamline the payment processes as well, making it easy for developers receive financial compensation. Therefore, we included compensation model preferences in our interviews with developers to gain insight into their values and preferences.

When it came to preferred compensation models such as pay-to-download, in-app payments, donations or subscription-based models, it became clear that the preferred model was highly dependent on the type of app and user base. 

Some developers we interviewed noted a preference towards the old school pay-to-download approach. With this compensation model, users pay a one-time fee to download the app from an app store. The transaction occurs before the users has access to the app.

For app stores like Google Play, this is straightforward as they have their own built in licensing service where distributing and verifying license keys is handled internally and the tool is of course proprietary. 

If we want to create a solution that includes a pay-to-download option for developers who are uploading their apps to multiple app stores simultaneously, integrating with payment gateways like PayPal or Stripe can provide a straightforward approach to handle transactions externally. Users can purchase the app through these gateways and receive a download link or licensing key upon successful payment. Furthermore, to streamline the payment and licensing key distribution process, developers can leverage providers that offer unified APIs. These unified APIs simplify the integration by providing a single point of access to manage payments and distribute licensing keys across various platforms, ensuring a more efficient and cohesive user experience.

After pay-to-download, several developers pointed towards a subscription-based model preference. In this case, they cited regular maintenance and storage expenses they carry as a company, as the reason for their decision. Subscription based compensation models often include a free trial period, then after that time limit has been reached, a payment occurs. We also heard the “freemium” model being used frequently, where some features are free, while others come at a cost. Subscription based models are considered a type of in-app payment, since the transaction is usually repetitive and occurs after the app has been downloaded and installed.

Within the FOSS community, donation-based models are regularly adopted to improve access to technology, while securing financial sustainability of FOSS-based projects. [Liberapay](https://en.liberapay.com/) is a great FOSS-based example, providing a way to help facilitate regular, reoccurring donation payments, in a similar way to subscription model.

[Open Collective](https://opencollective.com/) offers similar services and is also FOSS-based. However, Open Collective offers more advanced financial management tools for its users, and is geared towards larger projects with more complex needs. Additionally, they are more focused on individually occurring payments, rather than recurring ones. However, this is also an option.
Several developers and app stores told us that prefer in-app payment models, because it gives them more freedom and flexibility for developers and end users alike. In many cases in-app payments include an SDK which is built into the APK file. This enables in-app payments to occur. The SDK typically integrates with a payment gateway such as Stripe or PayPal or a service provider. The SDK also includes UI components for payments, supports various payment methods such as credit cards and digital wallets, and also handles the transaction management. Finally we discussed in-app advertising as a potential revenue source. There are of course inherent privacy issues with advertising models that allow user tracking, so the general consensus was that if in-app advertising models are used, they should be done so with caution. Not only are privacy and data protection founding principles for both Mobifree and F-Droid, the use of tracking-based in-app advertising poses a moral dilemma as well. If someone wants to gain access to an app, but does not have the financial means to purchase it, they can use it at a different kind of price - their user data. It should be mentioned that it is possible to include in-app advertising without user tracking. However the lead conversion ratio drops dramatically, so the efficacy of this approach is not nearly as high. 

## Making sense of it all

At the end of the day, finding a streamlined approach for app distribution that considers diverse compensation model options for developers and users is a tall order. However motivation and support for the concept is high, from both Mobifree partners, F-Droid contributors and the FOSS community in general.

We are looking forward to taking you on the journey with us as we break ground on this project in the coming months. Stay tuned to our blog for future updates and if you would like to contribute to our project, feel free to reach out at mailto:team@f-droid.org.
