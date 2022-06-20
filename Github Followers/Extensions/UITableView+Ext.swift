//
//  UITableView+Ext.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 20.06.2022.
//

import UIKit

extension UITableView {
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
