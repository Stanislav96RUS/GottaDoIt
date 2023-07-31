//
//  ProfileView.swift
//  GottaDoItApp
//
//  Created by Stanislav on 26.06.2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...".localized())
                }
            }
            .navigationTitle("PROFILE".localized())
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        VStack (alignment: .leading) {
            HStack {
                Text("Name:".localized())
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email:".localized())
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Registration date:".localized())
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .omitted))")
            }
            .padding()
        }
        .padding()
        
        TLButton(title: "Log Out".localized(), background: .red, textcolor: .white) {
            viewModel.logOut()
        }
        .padding()
        .frame(width: 250, height: 80)
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
