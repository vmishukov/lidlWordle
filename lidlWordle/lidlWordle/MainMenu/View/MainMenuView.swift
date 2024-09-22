//
//  MainMenuView.swift
//  lidlWordle
//
//  Created by Vladislav Mishukov on 21.09.2024.
//

import Foundation
import UIKit



final class MainMenuView: UIView {
    // MARK: - UI
    private lazy var menuStartNewGameButton = makeMenuButton(with: "Начать новую игру")
    private lazy var menuLoadCurrentGameButton = makeMenuButton(with: "Продолжить текущую игру")
    
    private lazy var menuButtonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [menuLoadCurrentGameButton, menuStartNewGameButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
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
    func setMenuStartNewGameButtonAction(action: Selector, for targer: Any) {
        menuStartNewGameButton.addTarget(targer, action: action, for: .touchUpInside)
    }
}

// MARK: - PRIVATE METHODS
private extension MainMenuView {
    func setupView() {
        backgroundColor = .black
        addSubview(menuButtonsStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            menuButtonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            menuButtonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            menuButtonsStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            menuStartNewGameButton.heightAnchor.constraint(equalToConstant: 56),
            menuLoadCurrentGameButton.heightAnchor.constraint(equalToConstant: 56)
            
        ])
    }
}

// MARK: - FACTORY METHODS
private extension MainMenuView {
    func makeMenuButton(with title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 16
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        button.tintColor = .black
        return button
    }
    
}
