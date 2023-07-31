//
//  DoItItemView.swift
//  GottaDoItApp
//
//  Created by Stanislav on 26.06.2023.
//

import SwiftUI

struct DoItItemView: View {
    @StateObject var viewModel = DoItItemViewViewModel()
    let item: DoItItem
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text(item.title)
                    .font(.body)
                    .strikethrough(item.isDone, pattern: .solid, color: .primary)
                    .bold()
                
//                CustomDataTimeFormatter(timeInerval: item.dueDate, formatDate: .complete, formatTime: .omitted)
//                    .font(.footnote)
//                    .foregroundColor(Color(.secondaryLabel))
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .complete, time: .omitted).firstCharOnly())")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                    
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .omitted, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toogleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.green)
            }
        }
    }
}

struct DoItItemView_Previews: PreviewProvider {
    static var previews: some View {
        DoItItemView(item: .init(id: "123", title: "Go home", dueDate: Date().timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: true))
    }
}
