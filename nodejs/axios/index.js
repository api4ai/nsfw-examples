#!/usr/bin/env node

// Example of using API4AI NSFW image classification.
const fs = require('fs')
const path = require('path')
const axios = require('axios').default
const FormData = require('form-data')

// Use 'demo' mode just to try api4ai for free. Free demo is rate limited.
// For more details visit:
//   https://api4.ai

// Use 'rapidapi' if you want to try api4ai via RapidAPI marketplace.
// For more details visit:
//   https://rapidapi.com/api4ai-api4ai-default/api/nsfw3/details
const MODE = 'demo'

// Your RapidAPI key. Fill this variable with the proper value if you want
// to try api4ai via RapidAPI marketplace.
const RAPIDAPI_KEY = ''

const OPTIONS = {
  demo: {
    url: 'https://demo.api4ai.cloud/nsfw/v1/results',
    headers: { 'A4A-CLIENT-APP-ID': 'sample' }
  },
  rapidapi: {
    url: 'https://nsfw3.p.rapidapi.com/v1/results',
    headers: { 'X-RapidAPI-Key': RAPIDAPI_KEY }
  }
}

// Parse args: path or URL to image.
const image = process.argv[2] || 'https://storage.googleapis.com/api4ai-static/samples/nsfw-1.jpg'

// Preapare request: form.
const form = new FormData()
if (image.includes('://')) {
  // Data from image URL.
  form.append('url', image)
} else {
  // Data from local image file.
  const fileName = path.basename(image)
  form.append('image', fs.readFileSync(image), fileName)
}

// Preapare request: headers.
const headers = {
  ...OPTIONS[MODE].headers,
  ...form.getHeaders(),
  'Content-Length': form.getLengthSync()
}

// Make request.
axios.post(OPTIONS[MODE].url, form, { headers })
  .then(function (response) {
    // Print raw response.
    console.log(`💬 Raw response:\n${JSON.stringify(response.data)}\n`)
    // Parse response and probabilities.
    const probs = response.data.results[0].entities[0].classes
    console.log(`💬 Probabilities:\n${JSON.stringify(probs)}`)
  })
