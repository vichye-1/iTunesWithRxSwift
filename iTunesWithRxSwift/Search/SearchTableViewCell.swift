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
    }
}

extension SearchTableViewCell: BaseProtocol {
    func configureHierarchy() {
        [iconImageView, titleLabel, downLoadButton].forEach { contentView.addSubview($0) }
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
    }
    
    func configureUI() {
        iconImageView.backgroundColor = .systemYellow
        iconImageView.layer.cornerRadius = 14
        iconImageView.layer.masksToBounds = true
        
        titleLabel.font = .boldSystemFont(ofSize: 17)
        
        downLoadButton.configuration = .download


    }
    
    
}
