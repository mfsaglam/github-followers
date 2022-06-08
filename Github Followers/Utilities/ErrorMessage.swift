//
//  ErrorMessage.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 10.05.2022.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "You've entered an invalid username. Please check it and try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case unableToFavorite = "There was an error while favoriting this user, please try again."
    case alreadyInFavorites = "This user is already in your favorites list."
}
