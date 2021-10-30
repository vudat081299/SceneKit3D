//
//  UIView.swift
//  SceneKitTest
//
//  Created by Dat vu on 30/10/2021.
//  Copyright © 2021 Lito Arias. All rights reserved.
//

import UIKit

extension UIView {
    func roundedBorder() {
        clipsToBounds = true
        layer.cornerRadius = self.frame.size.height / 2
    }
    func border(_ radius: CGFloat = 8) {
        clipsToBounds = true
        layer.cornerRadius = radius
    }
    func minEdgeBorder() {
        clipsToBounds = true
        layer.cornerRadius = frame.size.height > frame.size.width ? frame.size.width / 2 : frame.size.height / 2
    }
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        if #available(iOS 13.0, *) {
            layer.shadowColor = UIColor.systemGray2.cgColor
        } else {
            // Fallback on earlier versions
            layer.shadowColor = UIColor.darkGray.cgColor
        }
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowRadius = 3.0
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
