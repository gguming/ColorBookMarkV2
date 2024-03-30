//
//  SignInViewController.swift
//  ColorBookMarkV2
//
//  Created by SUN on 2/25/24.
//

import UIKit
import RxSwift
import RxCocoa
import ReactorKit

final class SignInViewController: UIViewController, View {

    var disposeBag = DisposeBag()
    
    private var logoImageView: UIImageView = {
        let image = UIImage(named: "logoImage")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = StringConstant.letsStartColorBookMark
        label.textColor = .txtPrimary
        label.textAlignment = .center
        return label
    }()
    private let stackView: UIStackView = UIStackView()
    private let signInKakaoButton: SignInButton = SignInButton(signInType: .kakao)
    private let signInAppleButton: SignInButton = SignInButton(signInType: .apple)
    private let signInEmailButton: SignInButton = SignInButton(signInType: .email)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        stackView.axis = .vertical
        stackView.spacing = 12.0
        stackView.distribution = .equalSpacing
        [logoImageView,
         welcomeLabel,
         stackView]
            .forEach({ view.addSubview($0) })
        
        [signInKakaoButton,
         signInAppleButton,
         signInEmailButton]
            .forEach({ stackView.addArrangedSubview($0) })
        
        
        logoImageView.snp.makeConstraints({
            $0.width.equalTo(172.0)
            $0.height.equalTo(144.0)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(170.0)
            
        })
        
        welcomeLabel.snp.makeConstraints({
            $0.top.equalTo(logoImageView.snp.bottom).offset(24.0)
            $0.horizontalEdges.equalToSuperview()
        })
        
        stackView.snp.makeConstraints({
            $0.horizontalEdges.equalToSuperview().inset(16.0)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(24.0)
        })
        
        signInEmailButton.snp.makeConstraints({
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(48.0)
        })

        signInAppleButton.snp.makeConstraints({
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(48.0)
        })

        signInKakaoButton.snp.makeConstraints({
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(48.0)
        })
    }
    
    func bind(reactor: SignInReactor) {
        // MARK: Action
        signInKakaoButton.rx.tap
            .map({ SignInReactor.Action.didTappedKakaoButton })
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        signInAppleButton.rx.tap
            .map({ SignInReactor.Action.didTappedAppleButton })
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
    }
}
