//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Vong Nyuksoon on 05/01/2023.
//

import Foundation
import UIKit

class AccountSummaryViewController: UIViewController {
    
    var accounts = [AccountSummaryCell.ViewModel]()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Summary"
        style()
        layout()
        setupTableHeaderView()
        setupTableView()
        fetchData()
    }
}

extension AccountSummaryViewController {
    private func style() {
        
    }
    
    private func layout() {
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
        
        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseID)
        tableView.rowHeight = CGFloat(AccountSummaryCell.rowHeight)
    }
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !accounts.isEmpty else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
        let account = accounts[indexPath.row]
        cell.configure(with: account)
        return cell
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AccountSummaryViewController {
    private func fetchData() {
        let savings = AccountSummaryCell.ViewModel(accountType: .Banking, accountName: "Saving account")
        let visa = AccountSummaryCell.ViewModel(accountType: .CreditCard, accountName: "Visa card")
        let investment = AccountSummaryCell.ViewModel(accountType: .Investment, accountName: "Investment account")
        
        accounts.append(contentsOf: [savings, visa, investment])
    }
}
