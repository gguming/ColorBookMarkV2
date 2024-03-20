//
//  SettingTabViewController.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/20/24.
//

import UIKit

final class SettingTabViewController: UIViewController {
    private let topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = StringConstant.setting
        label.textColor = .txtPrimary
        return label
    }()
    
    private let scrollView: UIScrollView = UIScrollView()
    
    private let contentView: UIView = UIView()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16.0
        return stackView
    }()
    
    private let myInformationSectionView: UserNameCellView
     = UserNameCellView(title: "내이름")
    
    private let alertSettingCellView: SettingTabCellWithSwitchView = SettingTabCellWithSwitchView(title: "ggddiofjiwejfoiewjiofjoiajfojewoifjweoifjoiawejfiojweifjoiaewjfoiawejfaioewj", subTitle: "Gg", isOn: false)
    
    private let darkModeSettingCellView: SettingTabCellWithSwitchView = SettingTabCellWithSwitchView(title: "ggddiofjiwejfoiewjiofjoiajfojewoifjweoifjoiawejfiojweifjoiaewjfoiawejfaioewj", subTitle: "Gg", isOn: false)
    
    private let backupInformationCellView: SettingTabCellView = SettingTabCellView(title: "gg")
    
    private let introduceInformationCellView: SettingTabCellView = SettingTabCellView(title: "gg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        [topTitleLabel,
         scrollView]
            .forEach({ view.addSubview($0) })
        
        [alertSettingCellView,
         darkModeSettingCellView,
         backupInformationCellView,
         introduceInformationCellView]
            .forEach({ verticalStackView.addArrangedSubview($0) })
        
        topTitleLabel.snp.makeConstraints({
            $0.centerX.top.equalTo(view.safeAreaLayoutGuide)
        })
        
        scrollView.snp.makeConstraints({
            $0.top.equalTo(topTitleLabel.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        })
        
        scrollView.addSubview(contentView)
        
        contentView.snp.makeConstraints({
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        })
        contentView.addSubview(myInformationSectionView)
        contentView.addSubview(verticalStackView)
        
        myInformationSectionView.snp.makeConstraints({
            $0.top.horizontalEdges.equalToSuperview()
                .inset(16.0)
        })
        
        verticalStackView.snp.makeConstraints({
            $0.top.equalTo(myInformationSectionView.snp.bottom)
                .offset(32.0)
            $0.horizontalEdges.equalToSuperview().inset(16.0)
        })
    }
}
