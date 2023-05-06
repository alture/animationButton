//
//  ViewController.swift
//  Buttons
//
//  Created by Alisher on 05.05.2023.
//

import UIKit

final class ViewController: UIViewController {
    private lazy var baseConfiguration: UIButton.Configuration = {
        var config = UIButton.Configuration.filled()
        config.image = UIImage(systemName: "arrow.right.circle.fill")
        config.imagePlacement = .trailing
        config.imagePadding = 8
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        return config
    }()
    
    private lazy var firstButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = baseConfiguration
        button.configuration?.title = "First Button"
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(buttonReleased(_:)), for: .touchUpOutside)
        button.addTarget(self, action: #selector(buttonReleased(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonReleased(_:)), for: .touchCancel)
        return button
    }()
    
    private lazy var secondButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = baseConfiguration
        button.configuration?.title = "Second Medium Button"
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(buttonReleased(_:)), for: .touchUpOutside)
        button.addTarget(self, action: #selector(buttonReleased(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonReleased(_:)), for: .touchCancel)
        return button
    }()

    private lazy var thirdButton: UIButton = {
        let button = UIButton(type: .system, primaryAction: UIAction(title: "Third", handler: { [weak self] _ in
            self?.present(EmptyViewController(), animated: true)
        }))
        let configuration = baseConfiguration
        button.configuration = configuration
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(buttonReleased(_:)), for: .touchUpOutside)
        button.addTarget(self, action: #selector(buttonReleased(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonReleased(_:)), for: .touchCancel)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstButton, secondButton, thirdButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        animateButton(scale: 0.92, sender: sender)
    }

    @objc func buttonReleased(_ sender: UIButton) {
        animateButton(scale: 1, sender: sender)
    }

    @objc func buttonPressed(_ sender: UIButton) {
        animateButton(scale: 1, sender: sender)
    }

    private func animateButton(scale: CGFloat, sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.beginFromCurrentState, .allowUserInteraction]) {
            sender.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
    
}


final class EmptyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
