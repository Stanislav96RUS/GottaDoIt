//
//  LoginViewViewModel.swift
//  GottaDoItApp
//
//  Created by Stanislav on 26.06.2023.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMassage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMassage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMassage = "Please fill in all fields.".localized()
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMassage = "Please enter valid email.".localized()
            return false
        }
        
        return true
    }
}
