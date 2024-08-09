//
//  StartSearchViewController.swift
//  iTunesWithRxSwift
//
//  Created by 양승혜 on 8/9/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class StartSearchViewController: UIViewController {
    
    private let searchLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
}

extension StartSearchViewController: BaseProtocol {
    func configureHierarchy() {
        [searchLabel].forEach { view.addSubview($0) }
    }
    
    func configureLayout() {
        searchLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(48)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        searchLabel.textColor = .black
        searchLabel.font = .boldSystemFont(ofSize: 17)
        searchLabel.text = "검색"
    }
    
}
