//
//  NetworkManager.swift
//  iTunesWithRxSwift
//
//  Created by 양승혜 on 8/9/24.
//

import Foundation
import RxSwift

enum APIError: Error {
    case invalidURL
    case unknownResponse
    case statusError
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }
  
    func calliTunes(term: String) {
        let baseURL = "https://itunes.apple.com/search?term=\(term)&country=US&entity=software"
        
        
    }
    
    
}
