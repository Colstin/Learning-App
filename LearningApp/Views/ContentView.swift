//
//  ContentView.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/8/23.
//MARK: This will show the list of lessons or test after you click on one of the HomeView options

import SwiftUI

struct ContentView: View {
    
    var model: Module
    
    var body: some View {
        
        NavigationStack {
            ScrollView{
                LazyVStack{
                    ForEach(model.content.lessons){ lesson in
                        NavigationLink {
                            TestDetailView(model: lesson)
                        } label: {
                            ContentViewRow(model: lesson)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let previewModel = ContentModel()
        ContentView(model: previewModel.modules[0])
    }
}
