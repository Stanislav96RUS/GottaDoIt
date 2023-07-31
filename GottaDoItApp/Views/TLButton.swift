//
//  TLButton.swift
//  GottaDoIt
//
//  Created by Stanislav on 26.06.2023.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let textcolor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(textcolor)
                    .bold()
            }
        }
    }
}
struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Value", background: .green, textcolor: .white) {
            
        }
    }
}
