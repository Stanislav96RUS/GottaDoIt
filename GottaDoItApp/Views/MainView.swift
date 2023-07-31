//
//  MainView.swift
//  GottaDoItApp
//
//  Created by Stanislav on 26.06.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSingnedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            DoItView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Tasks".localized(), systemImage: "list.bullet.clipboard.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile".localized(), systemImage: "person.circle")
                }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
