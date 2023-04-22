//
//  TestResultView.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/22/23.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var contentModel:ContentModel
    @State var goHome = false
    var numCorrect: Int
    
    var body: some View {
        let totalQuestions = contentModel.currentModule?.test.questions.count ?? 0
      
        if goHome == false{ 
            VStack {
                Spacer()
                Text(resultHeading)
                    .font(.title)
                Spacer()
                Text("You got \(numCorrect) out of \(totalQuestions) questions")
                Spacer()

                Button {
                    goHome = true
                    //contentModel.currentTestSelection = nil
                } label: {
                    ZStack {
                        RectangleCard()
                        
                        Text("Complete")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                Spacer()


            }
            .padding(.horizontal)
        } else {
            HomeView()
        }
    }
    
    //MARK: Computed Property
    var resultHeading:String {
        let totalQuestions = contentModel.currentModule?.test.questions.count ?? 0
        
        let pct = Double(numCorrect)/Double(totalQuestions)
        
        if pct > 0.5 {
            return "Awesome!"
        } else if pct > 0.2{
            return "Doing Great!"
        } else {
            return "Keep Learning"
        }
        
    }
    
}

struct TestResultView_Previews: PreviewProvider {
    static var previews: some View {
        TestResultView(numCorrect: 1)
            .environmentObject(ContentModel())
    }
}
