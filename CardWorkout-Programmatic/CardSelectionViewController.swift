//
//  CardSelectionViewController.swift
//  CardWorkout-Programmatic
//
//  Created by William Daniel da Silva Kuhs on 06/01/22.
//

import UIKit

class CardSelectionViewController: UIViewController {

    let cardImageView = UIImageView()
    let stopButton = CardWorkwoutButton(backgroundColor: .systemRed, title: "Stop!")
    let resetButton = CardWorkwoutButton(backgroundColor: .systemGreen, title: "Reset")
    let rulesButton = CardWorkwoutButton(backgroundColor: .systemBlue, title: "Rules")
    
    var timer: Timer!
    
    var cards = [UIImage()]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureUI()
        configureDataSource()
        startTimer()
    }
    
    
    func configureDataSource() {
        cards = Cards.dataSource
    }
    
    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton() {
        view.addSubview(stopButton)
        
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        
        ])
    }
    
    func configureResetButton() {
        view.addSubview(resetButton)
        
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    func configureRulesButton() {
        view.addSubview(rulesButton)
        
        rulesButton.addTarget(self, action: #selector(presentRulesViewController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func presentRulesViewController() {
        let rulesViewController = RulesViewController()
        
        present(rulesViewController, animated: true)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.15, target: self, selector: #selector(changeCard), userInfo: nil, repeats: true)
    }
    
    @objc func resetTimer() {
        timer.invalidate()
        startTimer()
    }
    
    @objc func stopTimer() {
        timer.invalidate()
    }
    
    @objc func changeCard() {
        cardImageView.image = cards.randomElement()
    }
}
