//
//  AccountSummaryHeaderView.swift
//  Bankey
//
//  Created by Vong Nyuksoon on 05/01/2023.
//

import UIKit

class AccountSummaryHeaderView: UIView {
    @IBOutlet var contentView: UIView!
    var shakeyBellView = ShakeyBellView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initNib()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 144)
    }
    
    private func initNib() {
        let bundle = Bundle(for: AccountSummaryHeaderView.self)
        bundle.loadNibNamed("AccountSummaryHeaderView", owner: self)
        
        addSubview(contentView)
        
        contentView.backgroundColor = .systemTeal
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(shakeyBellView)
        shakeyBellView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        // Shakey Bell
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalToSystemSpacingAfter: shakeyBellView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: shakeyBellView.bottomAnchor, multiplier: 0.5)
        ])
    }
}
