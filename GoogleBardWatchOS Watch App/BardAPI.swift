//
//  BardAPI.swift
//  GoogleBardWatchOS Watch App
//
//  Created by Chase Pham on 6/12/23.
//

import Foundation


class BardAPI{
    private let apiKey: String
    // This allows us to communicate and make requests with the api
    private let shareSession: URLSession.shared
    
    private var headers:[String:String] {
        ["Content-Type": "application/json",
         "Authorization": "Bearer\(apiKey)"
         ]
    }
    
    private let jsonDecoder = JSONDecoder()
    
    private var urlRequest: URLRequest{
        let url = URL(string: "https://api.openai.com/v1/completions")!
        var urlRequest = URLRequest(url:url)
        urlRequest.httpMethod = "POST"
        headers.forEach {urlRequest.setValue($1, forHTTPHeaderField: $0)}
        return urlRequest
    }
    
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    private func jsonBody(text:String, stream: Bool = true) throws -> Data{
        let jsonBody:[String:Any] = [
            "model": "text-chat-davinci-002-20230126",
            "temperature":0.5,
            "max_tokens":1024,
            "prompt": text,
            "stop":[
                "\n\n\n",
                "<|im_end|>"
            ],
            "stream":stream
        ]
        return try JSONSerialization.data(withJSONObject: jsonBody)
    }
    
}
