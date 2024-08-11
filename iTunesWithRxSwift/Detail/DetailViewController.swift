//
//  DetailViewController.swift
//  iTunesWithRxSwift
//
//  Created by 양승혜 on 8/12/24.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa
import SnapKit

final class DetailViewController: UIViewController {
    
    var iconImage: String?
    
    private lazy var iconImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        putOnData()
    }
}

extension DetailViewController: BaseProtocol {
    func configureHierarchy() {
        [iconImageView].forEach { view.addSubview($0) }
    }
    
    func configureLayout() {
        iconImageView.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.size.equalTo(100)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        iconImageView.backgroundColor = .systemYellow
        iconImageView.layer.cornerRadius = 8
        iconImageView.clipsToBounds = true
    }
    
    private func putOnData() {
        if let iconURLStr = iconImage, let iconURL = URL(string: iconURLStr) {
            iconImageView.kf.setImage(with: iconURL)
        }
        
    }
    
    
}
