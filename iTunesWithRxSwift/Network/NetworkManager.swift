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
  
    func calliTunes(term: String) -> Observable<[iTunesResult]> {
        let baseURL = "https://itunes.apple.com/search?term=\(term)&country=US&entity=software"
        
        let result = Observable<[iTunesResult]>.create { observer in
            guard let url = URL(string: baseURL) else {
                observer.onError(APIError.invalidURL)
                return Disposables.create()
            }
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    observer.onError(error)
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse else {
                    observer.onError(APIError.unknownResponse)
                    return
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    observer.onError(APIError.statusError)
                    return
                }
                
                guard let data = data else {
                    observer.onError(APIError.unknownResponse)
                    return
                }
                
                do {
                    let decodeResponse = try JSONDecoder().decode(SearchiTunes.self, from: data)
                    observer.onNext(decodeResponse.results)
                    observer.onCompleted()
                } catch {
                    observer.onError(APIError.decodingError)
                }
            }
            task.resume()
            return Disposables.create()
        }
        return result
    }
}
