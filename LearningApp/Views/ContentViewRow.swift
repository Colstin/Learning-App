//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/8/23.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model: ContentModel
    var index:Int
    
    var body: some View {
        let lesson = model.currentModule!.content.lessons[index]
       
        //lesson card
        ZStack(alignment: .leading){
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            HStack(spacing: 30){
                Text(String(index + 1))
                    .bold()
                
                VStack(alignment: .leading){
                    Text(lesson.title)
                    Text(lesson.duration)
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
