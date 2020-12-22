//
//  RootView.swift
//  Weteo
//
//  Created by Andrei Panishev on 26.11.2020.
//

import UIKit

class PullCardView: UIView {
    
    let backView = UIView()
    
    let frontView = UIView()
    
    var sizeChangeButton = UIButton()
    
    var resizeingTopAnchor : NSLayoutConstraint!
   
    convenience init() {
        self.init(frame: .zero)
        
        sizeChangeButton.backgroundColor = .darkGray
        sizeChangeButton.layer.cornerRadius = 5
        sizeChangeButton.setImage(createImage(), for: .normal)
        
        backView.backgroundColor = .systemGray
        frontView.backgroundColor = .systemBlue
        frontView.layer.cornerRadius = 10
        
        self.addSubview(backView)
        self.addSubview(frontView)
        self.bringSubviewToFront(frontView)
        self.addSubview(sizeChangeButton)
     
    }
    
    func settingUpConstraints(using topValue: CGFloat) {
        //Back View
        fillConstraintsFor(view: backView, inside: self)
        
        //Front View
        frontView.translatesAutoresizingMaskIntoConstraints = false
        frontView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        frontView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        frontView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        resizeingTopAnchor = self.frontView.topAnchor.constraint(equalTo: self.topAnchor, constant: topValue)
        resizeingTopAnchor.isActive = true
        
        //Size change button
        sizeChangeButton.translatesAutoresizingMaskIntoConstraints = false
        sizeChangeButton.topAnchor.constraint(equalTo: frontView.topAnchor, constant: -15).isActive = true
        sizeChangeButton.leadingAnchor.constraint(equalTo: frontView.leadingAnchor, constant: self.frame.width/2-50).isActive = true
        sizeChangeButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        sizeChangeButton.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
    }
    
    fileprivate func createImage() -> UIImage? {
        let size = CGSize(width: 300, height: 20)
        UIGraphicsBeginImageContext(size)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 20, y: 10))
        path.lineWidth = 4
        path.addLine(to: CGPoint(x: 280, y: 10))
        UIColor.systemBlue.setStroke()
        path.stroke()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
 
}
