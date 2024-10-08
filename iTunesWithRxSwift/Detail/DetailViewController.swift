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
    var version: String?
    var releaseNote: String?
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var iconImageView = UIImageView()
    private let appTitleLabel = UILabel()
    private let companyLabel = UILabel()
    private let downLoadButton = UIButton()
    private let newNewsLabel = UILabel()
    private let versionLabel = UILabel()
    private let releaseNoteLabel = UILabel()
    private let imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let itemWidth = UIScreen.main.bounds.width * 0.8
        layout.itemSize = CGSize(width: itemWidth, height: 200)
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    //private let viewModel: DetailViewModel
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        putOnData()
        bind()
    }
    
    private func bind() {
        
    }
}

extension DetailViewController: BaseProtocol {
    func configureHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [iconImageView, appTitleLabel, companyLabel, downLoadButton, newNewsLabel, versionLabel, releaseNoteLabel, imageCollectionView].forEach { contentView.addSubview($0) }
    }
    
    func configureLayout() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.frameLayoutGuide)
        }
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
        newNewsLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(20)
            make.leading.equalTo(iconImageView)
            make.height.equalTo(28)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(8)
        }
        versionLabel.snp.makeConstraints { make in
            make.top.equalTo(newNewsLabel.snp.bottom).offset(8)
            make.leading.equalTo(iconImageView)
            make.height.equalTo(24)
            make.trailing.equalTo(newNewsLabel)
        }
        releaseNoteLabel.snp.makeConstraints { make in
            make.top.equalTo(versionLabel.snp.bottom).offset(10)
            make.leading.equalTo(iconImageView)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(8)
            //make.bottom.equalToSuperview().inset(8)
        }
        imageCollectionView.snp.makeConstraints { make in
            make.top.equalTo(releaseNoteLabel.snp.bottom).offset(8)
            make.leading.equalTo(iconImageView)
            make.bottom.equalToSuperview().inset(8)
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
        
        newNewsLabel.text = "새로운 소식"
        newNewsLabel.font = .boldSystemFont(ofSize: 16)
        newNewsLabel.textAlignment = .left
        
        versionLabel.font = .systemFont(ofSize: 13)
        versionLabel.textColor = .lightGray
        versionLabel.textAlignment = .left
        
        releaseNoteLabel.numberOfLines = 0
        releaseNoteLabel.lineBreakMode = .byWordWrapping
        
        imageCollectionView.backgroundColor = .systemYellow
    }
    
    private func putOnData() {
        if let iconURLStr = iconImage, let iconURL = URL(string: iconURLStr) {
            iconImageView.kf.setImage(with: iconURL)
        }
        appTitleLabel.text = appTitle
        companyLabel.text = companyName
        versionLabel.text = "버전 \(version ?? "0")"
        releaseNoteLabel.text = releaseNote
    }
}
