//
//  Extensions + String.swift
//  GottaDoIt
//
//  Created by Stanislav on 29.06.2023.
//

import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
    
    func firstCharOnly() -> String {
        return prefix(1).uppercased() +
        self.dropFirst()
    }
}
