//
//  User.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

/// # User should be immutable
/// so we add the interests and isLoggedIn, etc to the UserManager
/// even if we have a single user
/// this way we are respecting model immutability
struct User {
    let name: String
    let email: String
    let password: String
}
