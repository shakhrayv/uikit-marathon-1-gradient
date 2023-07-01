//
//  ViewController.swift
//  uikit-marathon-1-gradient
//
//  Created by Vladislav Shakhray on 01/07/2023.
//

import UIKit

// Inspired by:
// https://stackoverflow.com/questions/39572990/applying-gradient-background-for-uiview-using-auto-layout

class GradientView: UIView {
    private let gradient = CAGradientLayer()
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradient.frame = self.bounds
    }
    
    override public func draw(_ rect: CGRect) {
        gradient.frame = self.bounds
        gradient.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1)
        if gradient.superlayer == nil {
            layer.insertSublayer(gradient, at: 0)
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Can we not use container here? But just have one view?
        let containerView = UIView()
        view.addSubview(containerView)
        
        let gradientView = GradientView()
        gradientView.backgroundColor = .red
        containerView.addSubview(gradientView)
        
        // Corner radius
        gradientView.layer.cornerRadius = 24.0
        gradientView.clipsToBounds = true
        
        // Shadow
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowRadius = 15.0
        containerView.layer.shadowOpacity = 0.8
        containerView.layer.shadowOffset = .zero
        
        // Constraints
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalToConstant: 120.0),
            containerView.heightAnchor.constraint(equalTo: gradientView.widthAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100.0),
    
            gradientView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            gradientView.topAnchor.constraint(equalTo: containerView.topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
        ])
    }


}

