//
//  GameView.swift
//  lidlWordle
//
//  Created by Vladislav Mishukov on 22.09.2024.
//

import Foundation
import UIKit

final class GameView: UIView {
    // MARK: - UI
    private(set) lazy var gameCollectionView: GameCollectionView = {
        let collectionView = GameCollectionView(frame: .zero,
                                                collectionViewLayout: setupGameCollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(GameCollectionViewCell.self,
                                forCellWithReuseIdentifier: GameCollectionViewCell.identifier)
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - PUBLIC METHODS
    func setupGameCollectionView(with source: GameCollectionViewDelegate & GameCollectionViewDataSource) {
        gameCollectionView.gameCollectionViewDelegate = source
        gameCollectionView.gameDataSource = source
    }
}

// MARK: - PRIVATE METHODS
private extension GameView {
    func setupView() {
        backgroundColor = .black
        addSubview(gameCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            gameCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            gameCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gameCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            gameCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    func setupGameCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let fractionWidth: CGFloat = 1 / 5
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(fractionWidth),
                                                   heightDimension: .fractionalHeight(1.0)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)
            
            
            let containerGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .fractionalWidth(fractionWidth)),
                subitems: [item])
            
            let section = NSCollectionLayoutSection(group: containerGroup)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
            return section
            
        }
        return layout
    }
}
