//
//  DoItViewViewModel.swift
//  GottaDoItApp
//
//  Created by Stanislav on 26.06.2023.
//

import FirebaseFirestore
import Foundation

class DoItViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("doits")
            .document(id)
            .delete()
    }
}
