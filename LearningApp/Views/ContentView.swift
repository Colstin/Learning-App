//
//  ContentView.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/8/23.
//MARK: This will show the list of lessons or test after you click on one of the HomeView options

import SwiftUI

struct ContentView: View {
    
   @EnvironmentObject var model: ContentModel
    
    var body: some View {
       
        ScrollView{
            LazyVStack{
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count, id: \.self){ index in
                        
                        NavigationLink {
                            ContentDetailView()
                                .onAppear(){
                                    model.beginLesson(index)
                                }
                        } label: {
                            ContentViewRow(index: index)
                        }

                     
                    }
                }
            }
            .foregroundColor(.black)
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
        
    }
}
/*

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}
*/
