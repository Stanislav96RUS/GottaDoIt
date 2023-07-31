//
//  User.swift
//  GottaDoItApp
//
//  Created by Stanislav on 26.06.2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
