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
    var appTitle: String?
    var companyName: String?
    
    private lazy var iconImageView = UIImageView()
    private let appTitleLabel = UILabel()
    private let companyLabel = UILabel()
    private let downLoadButton = UIButton()
    
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
        [iconImageView, appTitleLabel, companyLabel, downLoadButton].forEach { view.addSubview($0) }
    }
    
    func configureLayout() {
        iconImageView.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.size.equalTo(100)
        }
        appTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.top).offset(8)
            make.leading.equalTo(iconImageView.snp.trailing).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(32)
        }
        companyLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(appTitleLabel)
            make.bottom.equalTo(downLoadButton.snp.top)
            make.height.equalTo(24)
        }
        downLoadButton.snp.makeConstraints { make in
            make.leading.equalTo(appTitleLabel)
            make.bottom.equalTo(iconImageView)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        iconImageView.backgroundColor = .systemYellow
        iconImageView.layer.cornerRadius = 8
        iconImageView.clipsToBounds = true
        
        appTitleLabel.font = .boldSystemFont(ofSize: 17)
        appTitleLabel.textColor = .black
        appTitleLabel.textAlignment = .left
        
        companyLabel.font = .systemFont(ofSize: 13)
        companyLabel.textColor = .lightGray
        companyLabel.textAlignment = .left
        
        downLoadButton.configuration = .download
    }
    
    private func putOnData() {
        if let iconURLStr = iconImage, let iconURL = URL(string: iconURLStr) {
            iconImageView.kf.setImage(with: iconURL)
        }
        appTitleLabel.text = appTitle
        companyLabel.text = companyName
    }
    
    
}
