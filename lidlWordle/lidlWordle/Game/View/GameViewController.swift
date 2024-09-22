//
//  GameViewController.swift
//  lidlWordle
//
//  Created by Vladislav Mishukov on 22.09.2024.
//

import Foundation
import UIKit

protocol GameViewProtocol: AnyObject {
    
}

final class GameViewController: UIViewController {
    // MARK: - NAVBAR UI
    private lazy var navBarTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.text = "5 букв"
        return label
    }()
    
    // MARK: - PROPERTIES
    private let contentView = GameView()
    private let presenter: GamePresenterProtocol = GamePresenter()
    // MARK: - LIFECYCLE
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
        contentView.gameCollectionView.gameCollectionViewDelegate = self
        setupContentView()
        setupNabBar()
    }
}

// MARK: - PRIVATE METHODS
private extension GameViewController {
    func setupContentView() {
        contentView.setupGameCollectionView(with: self)
    }
    
    func setupNabBar() {
        navigationItem.titleView = navBarTitle
    }
}

// MARK: - GameViewProtocol
extension GameViewController: GameViewProtocol {
    
}

// MARK: - GameCollectionViewDelegate
extension GameViewController: GameCollectionViewDelegate {
    func gameCollectionView(_ gameCollectionView: GameCollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

// MARK: - GameCollectionViewDataSource
extension GameViewController: GameCollectionViewDataSource {
    func numberOfSections(in gameCollectionView: GameCollectionView) -> Int {
        6
    }
    
    func collectionView(_ gameCollectionView: GameCollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ gameCollectionView: GameCollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reusableCell = gameCollectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionViewCell.identifier,
                                                              for: indexPath)
        guard let gameReusableCell = reusableCell as? GameCollectionViewCell else { return reusableCell }
        return gameReusableCell
    }
    
}
