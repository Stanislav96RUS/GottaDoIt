//
//  DoItItemViewViewModel.swift
//  GottaDoItApp
//
//  Created by Stanislav on 26.06.2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class DoItItemViewViewModel: ObservableObject {
    init() {}
    
    func toogleIsDone(item: DoItItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("doits")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
    
}
