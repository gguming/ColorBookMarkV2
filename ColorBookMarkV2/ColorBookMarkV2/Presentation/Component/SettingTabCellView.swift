//
//  SettingTabCellView.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/20/24.
//

import UIKit
import SnapKit

final class SettingTabCellView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .txtPrimary
        return label
    }()
    
    private let title: String
    
    init(title: String) {
        self.title = title
        super.init(frame: .init())
        
        configuration()
        setupLayout()

       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuration() {
        titleLabel.text = title
    }
    
    private func setupLayout() {
        self.backgroundColor = .backgroundElevated
        self.layer.cornerRadius = 8.0
        
        [titleLabel]
            .forEach({ addSubview($0) })
        
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16.0)
        }
        titleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
    }
}
