//
//  UIView+.swift
//  iTunesWithRxSwift
//
//  Created by 양승혜 on 8/9/24.
//

import UIKit

extension UIView: ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
