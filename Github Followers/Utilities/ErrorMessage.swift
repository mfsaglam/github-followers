//
//  ErrorMessage.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 10.05.2022.
//

import Foundation

enum ErrorMessage: String {
    case invalidUsername = "You've entered an invalid username. Please check it and try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
