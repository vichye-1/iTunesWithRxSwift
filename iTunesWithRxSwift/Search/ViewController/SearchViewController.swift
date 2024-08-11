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

final class SearchViewController: UIViewController {
    
    private let searchLabel = UILabel()
    private let searchBar = UISearchBar()
    private lazy var tableView = UITableView()
    private let viewModel = SearchViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        bind()
    }
    
    private func bind() {
        let input = SearchViewModel.Input(
            searchButtonTap: searchBar.rx.searchButtonClicked.asObservable(),
            searchText: searchBar.rx.text.orEmpty.asObservable()
        )
        let output = viewModel.transform(input: input)
        
        output.iTunesList
            .drive(tableView.rx.items(cellIdentifier: SearchTableViewCell.identifier, cellType: SearchTableViewCell.self)) { index, item, cell in
                cell.configure(item: item)
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(iTunesResult.self)
            .subscribe { [weak self] selectedItem in
                self?.navigateToDetail(item: selectedItem)
            }
            .disposed(by: disposeBag)
    }
    
    private func navigateToDetail(item: iTunesResult) {
        let detailVC = DetailViewController()
        detailVC.iconImage = item.artworkUrl60
        detailVC.appTitle = item.trackName
        detailVC.companyName = item.sellerName
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension SearchViewController: BaseProtocol {
    func configureHierarchy() {
        [searchLabel, searchBar, tableView].forEach { view.addSubview($0) }
    }
    
    func configureLayout() {
        searchLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(48)
        }
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(searchLabel.snp.bottom)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        searchLabel.textColor = .black
        searchLabel.font = .boldSystemFont(ofSize: 32)
        searchLabel.text = "검색"
        
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        tableView.backgroundColor = .systemGray
        tableView.rowHeight = view.frame.height / 3
        tableView.separatorColor = .clear
    }
}
