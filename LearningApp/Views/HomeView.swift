//
//  ContentView.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/7/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var contentModel:ContentModel
    
    var body: some View {
        
       NavigationView {
            ScrollView{
                ForEach(contentModel.modules){ module in
                    VStack(spacing: 20) {
                        NavigationLink{
                            ContentView(model: module)
                        } label: {
                            HomeViewRow(image: module.content.image, category: "Learn \(module.category)", description: module.content.description, lesson: module.content.lessons.count, time: module.content.time)
                        }
                        
                        
                        NavigationLink {
                            SwiftTestView()
                        } label: {
                            HomeViewRow(image: module.test.image, category: "\(module.category) Test", description: module.test.description, lesson: module.test.questions.count, time: module.test.time)
                             
                        }
                        
                    }
                }
            }
            .navigationTitle("Choose Your Course!")
       }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}


