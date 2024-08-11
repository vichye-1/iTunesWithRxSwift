//
//  UIButton.Configuration+.swift
//  iTunesWithRxSwift
//
//  Created by 양승혜 on 8/11/24.
//

import UIKit

extension UIButton.Configuration {
    static var download: UIButton.Configuration {
        var button = UIButton.Configuration.gray()
        button.title = "받기"
        button.cornerStyle = .capsule
        return button
    }
}
