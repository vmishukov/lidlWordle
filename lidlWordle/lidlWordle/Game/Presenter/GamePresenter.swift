//
//  GamePresenter.swift
//  lidlWordle
//
//  Created by Vladislav Mishukov on 22.09.2024.
//

import Foundation

protocol GamePresenterProtocol {
    func viewDidLoad(view: GameViewProtocol)
}

final class GamePresenter {
    // MARK: - PROPERTIES
    private weak var view: GameViewProtocol?
    // MARK: - INIT
}

// MARK: - GamePresenterProtocol
extension GamePresenter: GamePresenterProtocol {
    func viewDidLoad(view:  GameViewProtocol) {
        self.view = view
    }
}
