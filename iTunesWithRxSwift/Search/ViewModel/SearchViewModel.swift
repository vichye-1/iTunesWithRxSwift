//
//  SearchViewModel.swift
//  iTunesWithRxSwift
//
//  Created by 양승혜 on 8/9/24.
//

import Foundation
import RxSwift
import RxCocoa

final class SearchViewModel {
    private let disposeBag = DisposeBag()
    
    struct Input {
        let searchButtonTap: Observable<Void>
        let searchText: Observable<String>
    }
    
    struct Output {
        let iTunesList: Driver<[iTunesResult]>
    }
    
    func transform(input: Input) -> Output {
        let searchResults = input.searchButtonTap
            .throttle(.seconds(1), scheduler: MainScheduler.instance)
            .withLatestFrom(input.searchText)
            .distinctUntilChanged()
            .flatMapLatest { query in
                NetworkManager.shared.calliTunes(term: query)
            }
            .asDriver(onErrorJustReturn: [])
        
        input.searchButtonTap
            .withLatestFrom(input.searchText)
            .subscribe(with: self) { owner, value in
                print("뷰모델 서치바 엔터 인식")
            }
            .disposed(by: disposeBag)
        
        input.searchText
            .subscribe(with: self) { owner, value in
                print("뷰모델 서치바 사용자 텍스트 인식: \(value)")
            }
            .disposed(by: disposeBag)
        
        return Output(iTunesList: searchResults)
    }
}
