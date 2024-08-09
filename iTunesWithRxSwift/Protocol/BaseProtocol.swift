//
//  BaseProtocol.swift
//  iTunesWithRxSwift
//
//  Created by 양승혜 on 8/9/24.
//

import Foundation

@objc
protocol BaseProtocol: AnyObject {
    func configureHierarchy()
    func configureLayout()
    @objc optional func configureUI()
}
