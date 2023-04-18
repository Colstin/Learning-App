//
//  ContentView.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/8/23.
//MARK: This is generating a list of Lessons from the Module Model 

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var contentModel:ContentModel
    var model: Module
    
    var body: some View {
        
       NavigationStack(path: $contentModel.path ){
            ScrollView{
                VStack{
                    ForEach(model.content.lessons){ lesson in
                        NavigationLink(value: lesson) {
                            ContentViewRow(model: lesson)
                            
                        }
                        .navigationDestination(for: Lesson.self) { lesson in
                            //hides back bar on detail View
                            VStack {
                                ContentDetailView(model: lesson)//.navigationBarBackButtonHidden()
                                
                                if lesson.id < (model.content.lessons.count - 1){
                                    Button("Go Home"){
                                        contentModel.gotoHomePage()
                                    }
                                    
                                    //MARK: NEXT-LESSON BUTTON
                                    Button{
                                        //print(lesson.id)
                                        let lessonPath = model.content.lessons[(lesson.id + 1)]
                                        contentModel.path.append(lessonPath)
                                        
                                    } label: {
                                        ZStack {
                                            Rectangle()
                                                .frame(height: 48)
                                                .foregroundColor(.green)
                                                .cornerRadius(10)
                                                .shadow(radius: 5)
                                            
                                            Text("Next Lesson")
                                                .foregroundColor(.white)
                                                .bold()
                                        }
                                    }
                                    
                                    
                                } else {
                                    //MARK: Complete Button
                                    Button{
                                        contentModel.gotoHomePage()
                                    } label: {
                                        ZStack {
                                            Rectangle()
                                                .frame(height: 48)
                                                .foregroundColor(.green)
                                                .cornerRadius(10)
                                                .shadow(radius: 5)
                                            
                                            Text("Complete")
                                                .foregroundColor(.white)
                                                .bold()
                                        }

                                    }
                                }
                               
                                
                               
                            }
                        }
                    }
                }
                .padding()
            }
            .foregroundColor(.black)
            .navigationTitle("Learn swift")
            
       }
        // hides Main Menu back bar on contentView (the List view)
        .navigationBarBackButtonHidden()
        
      
    }
    
    
    
}
/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let previewModel = ContentModel()
        ContentView(model: previewModel.modules[0])
    }
}
*/
