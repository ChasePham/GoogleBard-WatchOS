//
//  BardAPI.swift
//  GoogleBardWatchOS Watch App
//
//  Created by Chase Pham on 6/12/23.
//

import OpenAISwift
import Foundation


class BardAPI{
    let shared = BardAPI()
    let api_key = ""
    
    private init(){}
    
    private var client: OpenAISwift?
    
    public func setup(){
        self.client = OpenAISwift(authToken: api_key)
    }
    
    public func gettingResponse(tex: String, completion: @escaping (Result<String,Error>) -> Void) {
        client?.sendCompletion(with: tex, completionHandler: {result in
            switch result {
            case .success (let model):
                // This line may produce an error
                let output = model.choices?.first?.text ?? ""
                completion(.success(output))
            case .failure (let error):
                completion(.failure(error))
            }
        })
    }
    
}
