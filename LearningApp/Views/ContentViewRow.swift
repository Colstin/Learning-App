//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/8/23.
//

import SwiftUI

struct ContentViewRow: View {
    
    var model: Lesson
    
    var body: some View {
       
        //MARK: lesson card
        ZStack(alignment: .leading){
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            HStack(spacing: 30){
                Text(String(model.id + 1))
                    .bold()
                
                VStack(alignment: .leading){
                    Text(model.title)
                        .font(.title3)
                        .bold()
                    Text(model.duration)
                }
            }
            .padding()
        }
    }
}
/*
struct ContentViewRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewRow()
    }
}
*/

