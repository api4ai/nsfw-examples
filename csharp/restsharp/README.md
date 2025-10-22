# API4AI NSFW image classification sample

This directory contains a minimalistic sample that sends requests to the API4AI NSFW Image Classification API.
The sample is implemented in `C#` using [.NET 6](https://dotnet.microsoft.com/en-us/download/dotnet/6.0).


## Overview

This API processes images and detects sexual content in them, marking the images as Safe For Work (SFW) or Not Safe For Work (NSFW).


## Getting started (Visual Studio)

Open `sample.sln` solution file in Visual Studio as usual and click "Run". 


## Getting started (Command line)

Try sample with default args:

```bash
dotnet run
```

Try sample with your local image:

```bash
dotnet run -- image.jpg
```


## About API keys

⚠️ This demo by default sends requests to free endpoint at `demo.api4ai.cloud`.
Demo endpoint is rate limited and must not be used in real projects.

✅ The primary entry point for accessing API is the **[API4AI Developer Portal](https://portal.api4.ai?utm_source=example-repo&utm_medium=referral&utm_campaign=nsfw-csharp-restsharp)**. Here, you can obtain your own API key to send requests, set up billing, and monitor usage. API is available on a **pay-as-you-go** model. Simply top up your balance and consume any API at any time you want.

🐙 An alternative way to access APIs is through **Rapid API Hub** (also known as Nokia API Hub), a well-known public API hub and marketplace where you can find solutions developed by the API4AI team, as well as from other vendors if you wish. To get started, register at RapidAPI, obtain an API key, and [subscribe to the API](https://rapidapi.com/api4ai-api4ai-default/api/nsfw3/details). API at RapidAPI is available via a **subscription-based** model, with free plans also offered. Subscriptions are fully managed by RapidAPI.

[Contact us](https://api4.ai/contacts?utm_source=example-repo&utm_medium=referral&utm_campaign=nsfw-csharp-restsharp) in case of any questions or to request a custom pricing plan
that better meets your business requirements.


## Links

* 📩 Email: [hello@api4.ai](mailto:hello@api4.ai)
* 🔗 Website: [https://api4.ai](https://api4.ai?utm_source=example-repo&utm_medium=referral&utm_campaign=nsfw-csharp-restsharp)
* 🤖 Telegram demo bot: [@a4a_nsfw_checker_bot](https://t.me/a4a_nsfw_checker_bot)
* 🟡 API4AI Developer Portal: [https://portal.api4.ai](https://portal.api4.ai?utm_source=example-repo&utm_medium=referral&utm_campaign=nsfw-csharp-restsharp)
* 🔵 Our API at RapidAPI marketplace: https://rapidapi.com/api/nsfw3/details
