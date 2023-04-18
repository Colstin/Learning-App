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
                LazyVStack{
                    ForEach(model.content.lessons){ lesson in
                        NavigationLink(value: lesson) {
                            ContentViewRow(model: lesson)
                        }
                        .navigationDestination(for: Lesson.self) { lesson in
                            ContentDetailView(model: lesson)
                        }
                    }
                }
                .padding()
            }
            .foregroundColor(.black)
            .navigationTitle("Learn swift")
       }
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
