//
//  ApiManager.swift
//  SpacecraftFlipCard
//
//  Created by Andres Cordón on 27/3/25.
//

import SwiftUI
import Foundation

enum HttpMethod: String {
    case post = "POST"
    case get = "GET"
}

enum ErrorType: Error {
    case invalidURL
    case noData
    
    var message: String {
        switch self {
        case .invalidURL:
            "Invalid URL"
        case .noData:
            "Oops no data"
        }
    }
}

struct ApiManager {
    static let shared = ApiManager()
    
    let url: String = "http://api.open-notify.org/astros.json"
    
    func request(body: Data?) throws -> URLRequest {
        guard let url = URL(string: url) else {
            print("Url inválida")
            throw ErrorType.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.get.rawValue
        request.httpBody = body
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        return request
    }
}
