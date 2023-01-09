//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Vong Nyuksoon on 05/01/2023.
//

import UIKit

class AccountSummaryCell: UITableViewCell {
    
    enum AccountType: String {
        case Banking
        case CreditCard
        case Investment
    }
    
    struct ViewModel {
        let accountType: AccountType
        let accountName: String
        let accountBalance: Decimal
        
        var balanceAsAttributedString: NSAttributedString {
            CurrencyFormatter().makeAttributedCurrency(accountBalance)
        }
    }
    
    let viewModel: ViewModel? = nil
    static let reuseID = "AccountSummaryCell"
    static let rowHeight = 100
    
    let typeLabel = UILabel()
    let underlineView = UIView()
    let nameLabel = UILabel()
    
    let billInfoStackView = UIStackView()
    let billInfoTitleLabel = UILabel()
    let billInfoPriceLabel = UILabel()
    let billViewMoreImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountSummaryCell {
    private func setup() {
        typeLabel.text = "Type label"
        typeLabel.font = .preferredFont(forTextStyle: .caption1)
        
        underlineView.backgroundColor = .systemTeal
        
        nameLabel.text = "Name label"
        nameLabel.font = .preferredFont(forTextStyle: .body)
        
        billViewMoreImageView.image = UIImage(systemName: "chevron.right")
        
        billInfoStackView.axis = .vertical
        billInfoStackView.spacing = 4
        
        billInfoTitleLabel.text = "Current bill"
        billInfoTitleLabel.textAlignment = .right
        
        billInfoPriceLabel.attributedText = formattedBalanceText(dollars: "XXX", cents: "XX")
        billInfoPriceLabel.textAlignment = .right
    }
    
    private func layout() {
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        billInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        billViewMoreImageView.translatesAutoresizingMaskIntoConstraints = false
        
        billInfoStackView.addArrangedSubview(billInfoTitleLabel)
        billInfoStackView.addArrangedSubview(billInfoPriceLabel)
        
        contentView.addSubview(typeLabel)
        contentView.addSubview(underlineView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(billViewMoreImageView)
        contentView.addSubview(billInfoStackView)
        
        // Type Label
        NSLayoutConstraint.activate([
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
        ])
        
        // Underline View
        NSLayoutConstraint.activate([
            underlineView.widthAnchor.constraint(equalToConstant: 60),
            underlineView.heightAnchor.constraint(equalToConstant: 4),
            underlineView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
            underlineView.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
        ])
        
        // Name Label
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 2)
        ])
        
        // View More
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalToSystemSpacingAfter: billViewMoreImageView.trailingAnchor, multiplier: 2),
            billViewMoreImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        // StackView
        NSLayoutConstraint.activate([
            billInfoStackView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
            billInfoStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: billInfoStackView.trailingAnchor, multiplier: 4)
        ])
    }
}

// MARK: - Formatting
extension AccountSummaryCell {
    private func formattedBalanceText(dollars: String, cents: String) -> NSAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .callout),
            .baselineOffset: 8
        ]
        let dollarAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .title1)
        ]
        let centsAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .footnote),
            .baselineOffset: 8
        ]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollars, attributes: dollarAttributes)
        let centString = NSAttributedString(string: cents, attributes: centsAttributes)
        
        rootString.append(dollarString)
        rootString.append(centString)
        
        return rootString
    }
}

extension AccountSummaryCell {
    func configure(with vm: ViewModel) {
        typeLabel.text = vm.accountType.rawValue
        nameLabel.text = vm.accountName
        billInfoPriceLabel.attributedText = vm.balanceAsAttributedString
        
        switch vm.accountType {
        case .Banking:
            underlineView.backgroundColor = .systemTeal
            billInfoTitleLabel.text = "Current balance"
        case .CreditCard:
            underlineView.backgroundColor = .systemOrange
            billInfoTitleLabel.text = "Current balance"
        case .Investment:
            underlineView.backgroundColor = .systemPurple
            billInfoTitleLabel.text = "Value"
        }
    }
}
