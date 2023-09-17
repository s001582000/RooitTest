//
//  ViewController.swift
//  RooitTest
//
//  Created by YASYUAN LINANG on 2023/9/17.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        tableView.rowHeight = 80
        return tableView
    }()
    
    let disposeBag = DisposeBag()
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.rx.modelSelected(NewsItem.self).subscribe(onNext: { item in
            if let url = URL(string: item.url) {
                UIApplication.shared.open(url)
            }
        }).disposed(by: disposeBag)
        
        let tasksObservable = viewModel.getTasks()
        tasksObservable.bind(to: tableView.rx.items(cellIdentifier: "NewsCell")) { index, model, cell in
            if let newsCell = cell as? NewsCell {
                newsCell.viewModel = model
            }
        }.disposed(by: disposeBag)
        
        viewModel.fetchData()
    }
}

