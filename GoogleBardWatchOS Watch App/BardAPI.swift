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
    
    
    public func setup(){
        let client = OpenAISwift(authToken: api_key)
    }
    
    public func gettingResponse(text: String, completion: @escaping (Result<String,Error>) -> Void) {
        
    }
    
}
