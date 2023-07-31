//
//  LoginView.swift
//  GottaDoItApp
//
//  Created by Stanislav on 26.06.2023.
//

import SwiftUI

struct LoginView: View {
    
   @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "Gotta DO IT", angel: 15, background: .purple)
                
                Form {
                    if !viewModel.errorMassage.isEmpty {
                        Text(viewModel.errorMassage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address".localized(), text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password".localized(), text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log In".localized(), background: .green, textcolor: .white) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                VStack {
                    Text("Not registered yet?".localized())
                    NavigationLink("Registration".localized(), destination: RegisterView())
                }
//                .padding(.bottom, 50)
//                Spacer()
            }
//            .padding(.bottom, 50)
//            Spacer()
        }
        .padding(.bottom, 50)
        Spacer()
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

