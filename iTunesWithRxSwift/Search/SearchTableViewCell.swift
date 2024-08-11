//
//  SearchTableViewCell.swift
//  iTunesWithRxSwift
//
//  Created by 양승혜 on 8/9/24.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa
import SnapKit

class SearchTableViewCell: UITableViewCell {
    lazy var iconImageView = UIImageView()
    let titleLabel = UILabel()
    let downLoadButton = UIButton()
    let starLabel = UILabel()
    let companyLabel = UILabel()
    let genreLabel = UILabel()
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [starLabel, companyLabel, genreLabel])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 4
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(item: iTunesResult) {
        iconImageView.kf.setImage(with: URL(string: item.artworkUrl60))
        titleLabel.text = item.trackName
        companyLabel.text = item.sellerName
        genreLabel.text = item.genres[0]
        if let rating = item.averageUserRating {
            starLabel.text = String(format: "★ %.1f", rating)
        } else {
            starLabel.text = "별점 없음"
        }
    }
}

extension SearchTableViewCell: BaseProtocol {
    func configureHierarchy() {
        [iconImageView, titleLabel, downLoadButton, stackView].forEach { contentView.addSubview($0) }
    }
    
    func configureLayout() {
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(16)
            make.size.equalTo(50)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView)
            make.leading.equalTo(iconImageView.snp.trailing).offset(8)
            make.trailing.equalTo(downLoadButton.snp.leading).inset(8)
        }
        downLoadButton.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView)
            make.trailing.equalToSuperview().inset(8)
            make.width.equalTo(60)
            make.height.equalTo(32)
        }
        starLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(4)
            make.leading.equalTo(iconImageView)
            make.height.equalTo(24)
            make.width.equalTo(contentView.frame.width).multipliedBy(1/3)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(4)
            make.leading.equalTo(iconImageView)
            make.trailing.equalTo(downLoadButton)
            make.height.equalTo(24)
        }
    }
    
    func configureUI() {
        iconImageView.backgroundColor = .systemYellow
        iconImageView.layer.cornerRadius = 14
        iconImageView.layer.masksToBounds = true
        
        titleLabel.font = .boldSystemFont(ofSize: 17)
        
        downLoadButton.configuration = .download

        starLabel.textAlignment = .left
        starLabel.textColor = .lightGray
        starLabel.font = .systemFont(ofSize: 13)
        
        companyLabel.textAlignment = .center
        companyLabel.textColor = .lightGray
        companyLabel.font = .systemFont(ofSize: 13)
        
        genreLabel.textAlignment = .right
        genreLabel.textColor = .lightGray
        genreLabel.font = .systemFont(ofSize: 13)
    }
    
    
}
