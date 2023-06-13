//
//  BardAPI.swift
//  GoogleBardWatchOS Watch App
//
//  Created by Chase Pham on 6/12/23.
//

import OpenAISwift
import Foundation



final class BardAPI: ObservableObject {
    let api_key = ""
    
    init(){}
    
    private var client: OpenAISwift?
    
    public func setup(){
        client = OpenAISwift(authToken: api_key)
    }
    
    public func gettingResponse(text: String, completion: @escaping (String) -> Void) {
        client?.sendCompletion(with: text, maxTokens: 500, completionHandler: {result in
            switch result {
            case .success (let model):
                // This line may produce an error
                let output = model.choices?.first?.text ?? ""
                completion(output)
            case .failure:
                break
            }
        })
    }
    
}
