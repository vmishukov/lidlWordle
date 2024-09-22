//
//  GameCollectionViewCell.swift
//  lidlWordle
//
//  Created by Vladislav Mishukov on 22.09.2024.
//

import Foundation
import UIKit

final class GameCollectionViewCell: UICollectionViewCell {
    // MARK: - PROPERTIES
    static let identifier = String(describing: GameCollectionViewCell.self)
    // MARK: - UI
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension GameCollectionViewCell {
    func setupCell() {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 4
        clipsToBounds = true
    }
    
    func setupConstraints() {
        
    }
}
