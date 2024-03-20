//
//  SettingTabCellWithSwitchView.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/20/24.
//

import UIKit
import SnapKit

final class SettingTabCellWithSwitchView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .txtPrimary
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .txtPrimary
        return label
    }()
    
    private let switchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.onTintColor = .subHighlight
        switchButton.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        return switchButton
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .componentPrimary
        return view
    }()
    
    private let title: String
    private let subTitle: String
    private var isOn: Bool
    private let toggleSwitchButton: ((Bool) -> Void)?
    
    init(title: String,
         subTitle: String,
         isOn: Bool,
         toggleSwitchButton: ((Bool) -> Void)? = nil) {
        self.title = title
        self.subTitle = subTitle
        self.isOn = isOn
        self.toggleSwitchButton = toggleSwitchButton
        super.init(frame: .init())
        
        configuration()
        setupLayout()

       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuration() {
        titleLabel.text = String(format: isOn == true ? "%@ ON" : "%@ OFF", title)
        
        subTitleLabel.text = subTitle
        
        switchButton.isOn = isOn
        
        switchButton.addTarget(self, action: #selector(didTappedSwitchButton), for: .valueChanged)
    }
    
    private func setupLayout() {
        self.backgroundColor = .backgroundElevated
        self.layer.cornerRadius = 8.0
        
        [titleLabel, subTitleLabel, switchButton, dividerView]
            .forEach({ addSubview($0) })
        
        titleLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview().inset(16.0)
//            $0.width.lessThanOrEqualToSuperview().inset(32.0)
        }
        
        switchButton.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing)
                .offset(16.0)
            $0.trailing.equalToSuperview().inset(16.0)
            $0.centerY.equalTo(titleLabel)
        }
        
        titleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        dividerView.snp.makeConstraints({
            $0.horizontalEdges.equalToSuperview().inset(16.0)
            $0.top.equalTo(titleLabel.snp.bottom).offset(10.0)
            $0.height.equalTo(1.0)
        })
        
        subTitleLabel.snp.makeConstraints({
            $0.horizontalEdges.bottom.equalToSuperview().inset(16.0)
            $0.top.equalTo(dividerView).offset(10.0)
        })
    }
    
    /// switch button 값 토글
    @objc
    private func didTappedSwitchButton() {
        switchButton.setOn(switchButton.isOn, animated: true)

        titleLabel.text = String(format: switchButton.isOn == true ? "%@ ON" : "%@ OFF", title)
        
        toggleSwitchButton?(switchButton.isOn)
    }
}
