//
//  DoItView.swift
//  GottaDoItApp
//
//  Created by Stanislav on 26.06.2023.
//

import FirebaseFirestoreSwift
import SwiftUI

struct DoItView: View {
    @StateObject var viewModel: DoItViewViewModel
    @FirestoreQuery var items: [DoItItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/doits")
        self._viewModel = StateObject(wrappedValue: DoItViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(items) { item in
                    DoItItemView(item: item)
                        .swipeActions {
                            Button("Delete".localized()) {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("DO IT".localized())
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct DoItView_Previews: PreviewProvider {
    static var previews: some View {
        DoItView(userId: "6sjYiA6QKQeeSAqReooyqygGzqf2")
    }
}
