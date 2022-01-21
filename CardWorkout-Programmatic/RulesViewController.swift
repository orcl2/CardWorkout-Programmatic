//
//  RulesViewController.swift
//  CardWorkout-Programmatic
//
//  Created by William Daniel da Silva Kuhs on 08/01/22.
//

import UIKit

class RulesViewController: UIViewController {

    let titleLabel = UILabel()
    let rulesLabel = UILabel()
    let excerciseLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureTitleLabel()
        configureRulesLabel()
        configureExcerciseLabel()
    }

    func configureTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Rules"
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func configureRulesLabel() {
        view.addSubview(rulesLabel)
        
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.text = """
            The value of each card represents the number of excercise you do.
            
            
            J = 11, Q = 12, K = 13, A = 14
            """
        rulesLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        rulesLabel.lineBreakMode = .byWordWrapping
        rulesLabel.numberOfLines = 0// Or you can use rulesLabel.numberOfLines = 2
        rulesLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            rulesLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 30),
            rulesLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -30)
        ])
    }
    
    func configureExcerciseLabel() {
        view.addSubview(excerciseLabel)
        
        excerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        excerciseLabel.text = """
            ♠️ = Push-ups

            ❤️ = Sit-ups
        
            ♦️ = Jumping Jacks
        
            ♣️ = Burpees
        """
        excerciseLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        excerciseLabel.numberOfLines = 0
        excerciseLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            excerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 60),
            excerciseLabel.widthAnchor.constraint(equalToConstant: 200),
            excerciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
}
