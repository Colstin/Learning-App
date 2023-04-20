//
//  TestView.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/15/23.
//

import SwiftUI

struct SwiftTestView: View {
    
    @EnvironmentObject var contentModel: ContentModel
    
    var body: some View {
     
      
        if contentModel.currentQuestion != nil {
            VStack{
                // Q Number
                Text("Question \(contentModel.currentQuestionIndex + 1) of \(contentModel.currentModule?.test.questions.count ?? 0)")
                
                // Q
                CodeTextView()
                
                // Answers
                
                
                // Button
                }
            .navigationTitle("Swift Test")
        } else{
            // Wierd glitch, add this so the Vstack pops up
            ProgressView()
        }

    }
}

struct SwiftTestView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftTestView()
            .environmentObject(ContentModel())
    }
}
