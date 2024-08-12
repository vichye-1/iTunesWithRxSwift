//
//  ViewModelProtocol.swift
//  iTunesWithRxSwift
//
//  Created by 양승혜 on 8/12/24.
//

import Foundation
import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
