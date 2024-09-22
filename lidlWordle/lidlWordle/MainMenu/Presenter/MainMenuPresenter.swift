//
//  MainMenuPresenter.swift
//  lidlWordle
//
//  Created by Vladislav Mishukov on 21.09.2024.
//

import Foundation

protocol MainMenuPresenterProtocol {
    func viewDidLoad(view: MainMenuViewProtocol)
    func menuStartNewGameButtonDidTapped()
}

final class MainMenuPresenter {
    // MARK: - PROPERTIES
    private weak var view: MainMenuViewProtocol?
    // MARK: - INIT
}

// MARK: - MainMenuPresenterProtocol
extension MainMenuPresenter: MainMenuPresenterProtocol {
    func menuStartNewGameButtonDidTapped() {
        view?.showGameScreen()
    }
    
    func viewDidLoad(view: MainMenuViewProtocol) {
        self.view = view
    }
}
