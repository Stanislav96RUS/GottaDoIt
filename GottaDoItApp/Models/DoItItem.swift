//
//  DoItItem.swift
//  GottaDoItApp
//
//  Created by Stanislav on 26.06.2023.
//

import Foundation

struct DoItItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
