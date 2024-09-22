//
//  MainMenuViewController.swift
//  lidlWordle
//
//  Created by Vladislav Mishukov on 21.09.2024.
//

import Foundation
import UIKit

protocol MainMenuViewProtocol: AnyObject {
    func showGameScreen()
}

final class MainMenuViewController: UIViewController {
    // MARK: - PROPERTIES
    private let contentView = MainMenuView()
    private let presenter: MainMenuPresenterProtocol = MainMenuPresenter()
    // MARK: - LIFECYCLE
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
        setupContentView()
    }
}

// MARK: - PRIVATE METHODS
private extension MainMenuViewController {
    func setupContentView() {
        contentView.setMenuStartNewGameButtonAction(action: #selector(menuStartNewGameButtonDidTapped),
                                                    for: self)
    }
    
    @objc
    func menuStartNewGameButtonDidTapped() {
        presenter.menuStartNewGameButtonDidTapped()
    }
}

// MARK: - MainMenuViewProtocol
extension MainMenuViewController: MainMenuViewProtocol {
    func showGameScreen() {
        let viewController = GameViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
