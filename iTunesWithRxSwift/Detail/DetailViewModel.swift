//
//  DetailViewModel.swift
//  iTunesWithRxSwift
//
//  Created by 양승혜 on 8/12/24.
//

import Foundation
import RxSwift
import RxCocoa

final class DetailViewModel: ViewModelType {
    
    private let selectedItem: iTunesResult = iTunesResult(trackId: 0, trackName: "", artworkUrl60: "", screenshotUrls: [], genres: [], sellerName: "", averageUserRating: nil, version: "", releaseNotes: "")
    
    struct Input { }
    
    struct Output {
        let appDetails: Driver<iTunesResult>
        let screenshots: Driver<[String]>
    }
    
    func transform(input: Input) -> Output {
        let appDetails = Observable.just(selectedItem)
            .asDriver(onErrorJustReturn: iTunesResult(trackId: 0, trackName: "", artworkUrl60: "", screenshotUrls: [], genres: [], sellerName: "", averageUserRating: nil, version: "", releaseNotes: ""))
        
        let screenshots = Observable.just(selectedItem.screenshotUrls)
            .asDriver(onErrorJustReturn: [])
        
        return Output(appDetails: appDetails, screenshots: screenshots)
    }
}
