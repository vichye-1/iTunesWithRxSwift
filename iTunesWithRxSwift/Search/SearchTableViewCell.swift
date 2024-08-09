//
//  SearchTableViewCell.swift
//  iTunesWithRxSwift
//
//  Created by 양승혜 on 8/9/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class SearchTableViewCell: UITableViewCell {
    let iconImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchTableViewCell: BaseProtocol {
    func configureHierarchy() {
        [iconImageView].forEach { contentView.addSubview($0) }
    }
    
    func configureLayout() {
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(16)
            make.size.equalTo(50)
        }
    }
    
    func configureUI() {
        iconImageView.backgroundColor = .systemYellow
        iconImageView.layer.cornerRadius = 14
    }
    
    
}
