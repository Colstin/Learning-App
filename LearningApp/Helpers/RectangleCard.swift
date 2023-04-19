//
//  RectangleCard.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/19/23.
//

import SwiftUI

struct RectangleCard: View {
    
    var color = Color.green
    
    var body: some View {
        Rectangle()
            .frame(height: 48)
            .foregroundColor(color)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard()
    }
}
