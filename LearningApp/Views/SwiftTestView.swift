//
//  TestView.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/15/23.
//

import SwiftUI

struct SwiftTestView: View {
    
    @EnvironmentObject var contentModel: ContentModel
    @State var selectedAnswerIndex:Int?
    @State var numCorrect = 0
    @State var submitted = false
    @State var correctAnswer = false
    
    var body: some View {
     
      
        if contentModel.currentQuestion != nil {
            VStack(alignment: .leading){
                // Q Number
                Text("Question \(contentModel.currentQuestionIndex + 1) of \(contentModel.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
                
                // Q
                CodeTextView()
                    .padding(.horizontal)
                
                // MARK: Answers
                ScrollView{
                    VStack{
                        ForEach(0..<contentModel.currentQuestion!.answers.count, id: \.self){ index in
                                
                            Button {
                                selectedAnswerIndex = index
                                
                            } label: {
                                
                                ZStack {
                                    
                                    if correctAnswer == false {
                                        RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                            
                                    } else {
                                        RectangleCard(color: index == selectedAnswerIndex ? .green: .red)
                                            
                                    }
                                      
                                    Text(contentModel.currentQuestion!.answers[index])
                                }

                            }
                            .disabled(submitted)
                        }
                    }
                    .padding()
                    .foregroundColor(.black)
                }
                
                // MARK: Submit
                Button {
                    //Disable submit button when clicked
                    submitted = true
                    
                    // increment numCorrect if correct
                    if selectedAnswerIndex == contentModel.currentQuestion!.correctIndex{
                        numCorrect += 1
                        correctAnswer = true
                    }
                    print(numCorrect)
        
                } label: {
                    ZStack{
                        RectangleCard(color: selectedAnswerIndex == nil ? .gray: .green)
                        
                        Text("Submit")
                           
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding()
                }
                .disabled(selectedAnswerIndex == nil)
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
