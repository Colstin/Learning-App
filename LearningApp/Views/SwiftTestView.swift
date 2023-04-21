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
    @State var correctText:String?
    
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
                                    
                                    if submitted == false {
                                        RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                            
                                    } else { // When submit button is clicked
                                        
                                        // RIGHT ANSWER
                                        if index == selectedAnswerIndex && index == contentModel.currentQuestion?.correctIndex{
                                            
                                            RectangleCard()
                                        // Wrong Answer
                                        } else if index == selectedAnswerIndex && index != contentModel.currentQuestion?.correctIndex{
                                            
                                            RectangleCard(color: .red)
                                            
                                        } else if index == contentModel.currentQuestion?.correctIndex{
                                            
                                            RectangleCard(color: .green)
                                            Image(systemName: "star.fill")
                                                .padding(.leading, 300)
                                                .foregroundColor(.yellow)
                                            
                                        } else {
                                            RectangleCard(color: .white)
                                        }
                                    }
                                      
                                    Text(contentModel.currentQuestion!.answers[index] )
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
                    
                    // Check if answer has been submitted
                    if submitted == true{
                        
                        // if answer has been submitted, move to next question
                        contentModel.nextQuestion()
                        
                        // reset properties.
                        submitted = false
                        selectedAnswerIndex = nil
                        
                        
                    } else { // Submit answer
                        
                        //Disable submit button when clicked
                        submitted = true
                        
                        // increment numCorrect if correct
                        if selectedAnswerIndex == contentModel.currentQuestion!.correctIndex{
                            numCorrect += 1
                        }
                    }
        
                } label: {
                    ZStack{
                        RectangleCard(color: selectedAnswerIndex == nil ? .gray: .green)
                       
                        Text(submitButtonText)
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
    
    // MARK: Submit Button Text: Computed Property
    var submitButtonText:String {
        if submitted == true{
            if contentModel.currentQuestionIndex + 1 == contentModel.currentModule!.test.questions.count {
                return "Finish"
            } else {
                return "Next"
            }
        } else {
            return "Submit"
        }
    }
}

struct SwiftTestView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftTestView()
            .environmentObject(ContentModel())
    }
}
