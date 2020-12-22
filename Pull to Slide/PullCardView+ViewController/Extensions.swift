//
//  Extensions.swift
//  Weteo
//
//  Created by Andrei Panishev on 25.11.2020.
//

import UIKit

public func fillConstraintsFor(view: UIView, inside parentView: UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([ view.topAnchor.constraint(equalTo: parentView.topAnchor),
                                  view.leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: 0),
                                  view.rightAnchor.constraint(equalTo: parentView.rightAnchor, constant: 0),
                                  view.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: 0)])
}



