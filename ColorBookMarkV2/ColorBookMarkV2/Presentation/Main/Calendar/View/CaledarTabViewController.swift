//
//  CaledarTabViewController.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/18/24.
//

import UIKit
import RxSwift
import SnapKit

final class CaledarTabViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    private var week: [String] = ["일", "월", "화", "수", "목", "금", "토"]
    private var daysInSelectedMonth: [String] = []
    
    private let monthButton: UIButton = {
        let button = UIButton()
        button.setTitle(Date().toString(format: "yyyy.MM"), for: .normal)
        button.setImage(UIImage(named: "arrow_drop_down_black_24"), for: .normal)
        button.titleLabel?.font = .Pretendard(.bold, size: 20.0)
        button.setTitleColor(.txtPrimary, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20.0
    
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    private let weekColumnStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = monthButton
        setupLayout()
        configuration()
    }
    

    private func setupLayout() {
        self.view.backgroundColor = .systemBackground
        [weekColumnStackView,
         collectionView]
            .forEach({ view.addSubview($0) })
        
        week.forEach({
            let label = UILabel()
            label.text = $0
            label.font = .Pretendard(.bold, size: 14.0)
            label.textColor = $0 == "일" ? .subError : .txtPrimary
            label.textAlignment = .center
            weekColumnStackView.addArrangedSubview(label)
        })
        
        weekColumnStackView.snp.makeConstraints({
            $0.horizontalEdges.equalToSuperview().inset(20.0)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(24.0)
//            $0.height.equalTo(30.0)
        })
        collectionView.snp.makeConstraints({
            $0.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide).inset(24.0)
            $0.top.equalTo(weekColumnStackView.snp.bottom).offset(32.0)
        })
        
    }
    
    private func configuration() {
        collectionView.dataSource = self
        collectionView.collectionViewLayout = self.createCompositionalLayout()
        self.collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
        
    }
}

extension CaledarTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysInSelectedMonth.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.identifier, for: indexPath) as? CalendarCollectionViewCell else { return UICollectionViewCell() }
        cell.setupLayout(date: daysInSelectedMonth[indexPath.item])
        return cell
    }
    
  
}

extension CaledarTabViewController {
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1 / 7.0),
                heightDimension: .fractionalHeight(1)
            )
        )
        item.contentInsets = .init(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(58.0)
            ),
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16.0
        return UICollectionViewCompositionalLayout(section: section)
    }
}
