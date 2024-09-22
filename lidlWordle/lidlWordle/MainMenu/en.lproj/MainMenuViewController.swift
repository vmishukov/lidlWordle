//
//  MainMenuViewController.swift
//  lidlWordle
//
//  Created by Vladislav Mishukov on 21.09.2024.
//

import Foundation
import UIKit



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
    }
    
}

// MARK: - PRIVATE METHODS
private extension MainMenuViewController {
    
}

// MARK: - MainMenuViewProtocol
extension MainMenuViewController: MainMenuViewProtocol {
    
}
