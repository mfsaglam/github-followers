//
//  Date+Ext.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 30.05.2022.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
