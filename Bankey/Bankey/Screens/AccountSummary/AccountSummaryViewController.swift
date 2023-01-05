//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Vong Nyuksoon on 05/01/2023.
//

import Foundation
import UIKit

class AccountSummaryViewController: UIViewController {
    let items = ["Table1", "Table2", "Table3"]
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        setupTableHeaderView()
        setupTableView()
    }
}

extension AccountSummaryViewController {
    private func style() {
        
    }
    
    private func layout() {
        view.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: tableView.topAnchor),
            view.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
        ])
    }
    
    private func setupTableHeaderView() {
        let header = AccountSummaryHeaderView(frame: .zero)
        let size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        header.frame.size = size
        tableView.tableHeaderView = header
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        configuration.text = items[indexPath.row]
        cell.contentConfiguration = configuration
        return cell
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    
}
