//
//  main.swift
//  sample
//
//  Created by API4AI Team on 05/05/2022.
//

import Foundation
extension NSMutableData {
  func appendString(_ string: String) {
    if let data = string.data(using: .utf8) {
      self.append(data)
    }
  }
}


// Use "demo" mode just to try api4ai for free. ⚠️ Free demo is rate limited and must not be used in real projects.
//
// Use 'normal' mode if you have an API Key from the API4AI Developer Portal. This is the method that users should normally prefer.
//
// Use "rapidapi" if you want to try api4ai via RapidAPI marketplace.
// For more details visit:
//   https://rapidapi.com/api4ai-api4ai-default/api/nsfw3/details
let MODE = "demo"


// Your RapidAPI key. Fill this variable with the proper value if you have one.
let API4AI_KEY = ""


// Your RapidAPI key. Fill this variable with the proper value if you want
// to try api4ai via RapidAPI marketplace.
let RAPIDAPI_KEY = ""


let OPTIONS = [
    "demo": [
        "url": "https://demo.api4ai.cloud/nsfw/v1/results",
        "headers": [:] as NSMutableDictionary
    ],
    "normal": [
        "url": "https://api4ai.cloud/nsfw/v1/results",
        "headers": ["X-API-KEY": API4AI_KEY] as NSMutableDictionary
    ],
    "rapidapi": [
        "url": "https://nsfw3.p.rapidapi.com/v1/results",
        "headers": ["X-RapidAPI-Key": RAPIDAPI_KEY] as NSMutableDictionary
    ]
]


// Prepare http body with image or url.
let image = CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : "https://static.api4.ai/samples/nsfw-1.jpg"
var httpBody: Data;
if (image.contains("://")) {
    // POST image via URL.
    httpBody = NSData(data: "url=\(image)".data(using: String.Encoding.utf8)!) as Data
}
else {
    // POST image as file.
    let boundary = (UUID().uuidString) // multipart boundary
    let fileLocalURL = URL(fileURLWithPath: image) // path to image file as URL object
    let mutableData = NSMutableData()
    mutableData.appendString("--\(boundary)\r\n")
    mutableData.appendString("Content-Disposition: form-data; name=\"image\"; filename=\"\(fileLocalURL.lastPathComponent)\"\r\n\r\n")
    mutableData.append(try! Data(contentsOf: fileLocalURL))
    mutableData.appendString("\r\n")
    mutableData.appendString("--\(boundary)--")
    (OPTIONS[MODE]!["headers"] as! NSMutableDictionary)["Content-Type"] = "multipart/form-data; boundary=\(boundary)"  // add content type with boundary to headers
    httpBody = mutableData as Data
}

// Prepare request.
var request = URLRequest(url: URL(string: OPTIONS[MODE]!["url"] as! String)!)
request.httpMethod = "POST"
request.allHTTPHeaderFields = OPTIONS[MODE]!["headers"] as? [String:String]
request.httpBody = httpBody

// Semaphore to wait until request is done.
let sem = DispatchSemaphore(value: 0)

// Perform request.
let session = URLSession.shared
let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
    if (error != nil) {
        print(error!)
    } else {
        do {
            let raw = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("💬 Raw response:\n\(raw ?? "")\n")

            // Try to parse result from response data as JSON.
            let json = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
            let result = (json["results"] as! [[String:Any]])[0]

            // Parse and pring status.
            let status = result["status"] as! [String:String]
            if (status["code"] == "ok") {
                // Parse data.
                print("💬 Probabilities:")
                let entity = (result["entities"] as! [[String:Any]])[0]
                let classes = entity["classes"] as! [String:NSNumber]
                print(classes ?? "")
            }
        } catch {
            print(error)
        }
    }
    sem.signal()
})
dataTask.resume()

// Wait for request is done.
sem.wait()
