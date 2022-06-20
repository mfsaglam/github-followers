//
//  UIView+Ext.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 20.06.2022.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views { self.addSubview(view) }
    }
}
