# API4AI NSFW image classification sample

This directory contains a minimalistic sample that sends requests to the API4AI NSFW Image Classification API.
The sample is implemented in `Swift` using [URLSession](https://developer.apple.com/documentation/foundation/urlsession) class.


## Overview

This API processes images and detects sexual content in them, marking the images as Safe For Work (SFW) or Not Safe For Work (NSFW).


## Getting started (XCode)

Open `sample.xcodeproj` project in XCode as usual and click "Run".

Optionally you may specify image URL or path to image file as application argument via "Product -> Scheme -> Edit scheme...".


## Getting started (Command line)

Build in Release configuration:
```bash
xcodebuild -scheme sample build -configuration Release SYMROOT=$(PWD)/build
```

Try sample with default args:

```bash
./build/Release/sample
```

Try sample with your local image:

```bash
./build/Release/sample image.jpg
```


## About API keys

This demo by default sends requests to free endpoint at `demo.api4ai.cloud`.
Demo endpoint is rate limited and should not be used in real projects.

Use [RapidAPI marketplace](https://rapidapi.com/api4ai-api4ai-default/api/nsfw3/details) to get the API key. The marketplace offers both
free and paid subscriptions.

[Contact us](https://api4.ai/contacts?utm_source=nsfw_example_repo&utm_medium=readme&utm_campaign=examples) in case of any questions or to request a custom pricing plan
that better meets your business requirements.


## Links

* 📩 Email: hello@api4.ai
* 🔗 Website: [http://api4.ai](https://api4.ai?utm_source=nsfw_example_repo&utm_medium=readme&utm_campaign=examples)
* 🤖 Telegram demo bot: https://t.me/a4a_nsfw_checker_bot
* 🔵 Our API at RapidAPI marketplace: https://rapidapi.com/api4ai-api4ai-default/api/nsfw3/details
