//
//  PullCardViewController.swift
//  Weteo
//
//  Created by Andrei Panishev on 25.11.2020.
//

import UIKit

class PullCardViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let pullCardView = PullCardView()
    
    var initialPosValue : CGFloat = 560
    
    var panGesture = UIPanGestureRecognizer()
    
    var initalTouchValue : CGFloat!
    
    var isBig = false
    
    var isSmall : Bool {
        get {
            if initialPosValue == 120 {
                return true
            }
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = pullCardView
        
        panGesture.maximumNumberOfTouches = 1
        panGesture.delegate = self
        panGesture.addTarget(self, action: #selector(handlePanGesture(_ :)))
        pullCardView.frontView.addGestureRecognizer(panGesture)
        
        pullCardView.sizeChangeButton.addTarget(self, action: #selector(changeViewSize(sender:)), for: .touchDown)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.pullCardView.settingUpConstraints(using: initialPosValue)
    }
    
    @objc func changeViewSize(sender: Any) {
        
       // isBig = !isBig
        
        if isSmall {
            configureSize(value: 560, duration: 0.3)
        } else {
            configureSize(value: 120, duration: 0.3)
        }
    }
        
    
    func configureSize(value: CGFloat, duration: Double) {
        self.pullCardView.resizeingTopAnchor.isActive = false
        UIView.animate(withDuration: duration,
                       delay: 0, usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: .curveEaseInOut) {
            self.pullCardView.settingUpConstraints(using: value)
            self.view.layoutIfNeeded()
        }
    }
    
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .began:
            initalTouchValue = gesture.location(in: pullCardView.backView).y
        case .changed:
            let currentLoc = gesture.location(in: pullCardView.backView).y
            let displaceValue = currentLoc - initalTouchValue
            configureSize(value: self.initialPosValue+displaceValue, duration: 0.03)
        case .ended:
            let currentLoc = gesture.location(in: pullCardView.backView).y
            let displaceValue = currentLoc - initalTouchValue
            
            if displaceValue > 100 {
                configureSize(value: 560, duration: 0.3)
                initialPosValue = 560
            } else if displaceValue < -100 {
                configureSize(value: 120, duration: 0.3)
                initialPosValue = 120
            }
            if (self.initialPosValue+displaceValue) >= self.view.frame.size.height / 2 {
                configureSize(value: 560, duration: 0.3)
                initialPosValue = 560
            } else {
                configureSize(value: 120, duration: 0.3)
                initialPosValue = 120
            }
        default: break
        }
    }
    
    
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.darkContent
    }
    
}


