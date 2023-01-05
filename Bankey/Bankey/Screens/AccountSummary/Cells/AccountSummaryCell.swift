//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Vong Nyuksoon on 05/01/2023.
//

import UIKit

class AccountSummaryCell: UITableViewCell {
    
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
        typeLabel.text = "Banking"
        typeLabel.font = .preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        
        underlineView.backgroundColor = .systemTeal
        
        nameLabel.text = "No-Fee"
        nameLabel.font = .preferredFont(forTextStyle: .title3)
        nameLabel.adjustsFontForContentSizeCategory = true
        
        billViewMoreImageView.image = UIImage(systemName: "chevron.right")
        
        billInfoStackView.axis = .vertical
        billInfoStackView.spacing = 4
        
        billInfoTitleLabel.text = "Current bill"
        billInfoPriceLabel.text = "$10,000"
        billInfoPriceLabel.font = .preferredFont(forTextStyle: .title2)
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
            billViewMoreImageView.trailingAnchor.constraint(equalToSystemSpacingAfter: billInfoStackView.trailingAnchor, multiplier: 3),
            bottomAnchor.constraint(equalToSystemSpacingBelow: billInfoStackView.bottomAnchor, multiplier: 2)
        ])
    }
}
