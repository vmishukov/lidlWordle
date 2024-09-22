//
//  GameCollectionView.swift
//  lidlWordle
//
//  Created by Vladislav Mishukov on 22.09.2024.
//

import Foundation
import UIKit

protocol GameCollectionViewDelegate: AnyObject {
    func gameCollectionView(_ gameCollectionView: GameCollectionView, didSelectItemAt indexPath: IndexPath)
}

protocol GameCollectionViewDataSource: AnyObject {
    func numberOfSections(in gameCollectionView: GameCollectionView) -> Int
        
    func collectionView(_ gameCollectionView: GameCollectionView, numberOfItemsInSection section: Int) -> Int
    
    func collectionView(_ gameCollectionView: GameCollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

final class GameCollectionView: UICollectionView {
    weak var gameCollectionViewDelegate: GameCollectionViewDelegate?
    weak var gameDataSource: GameCollectionViewDataSource?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDelegate
extension GameCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        gameCollectionViewDelegate?.gameCollectionView(self, didSelectItemAt: indexPath)
    }
}

// MARK: - UICollectionViewDataSource
extension GameCollectionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        gameDataSource?.numberOfSections(in: self) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        gameDataSource?.collectionView(self, numberOfItemsInSection: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let gameReusableCell = gameDataSource?.collectionView(self, cellForItemAt: indexPath) ?? UICollectionViewCell()
        return gameReusableCell
        //        let reusableCell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionViewCell.identifier,
        //                                                      for: indexPath)
        //        guard let gameReusableCell = reusableCell as? GameCollectionViewCell else { return reusableCell }
        //        return gameReusableCell
    }
}
