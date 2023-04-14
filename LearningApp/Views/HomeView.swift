//
//  ContentView.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/7/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    @State var navPath = NavigationPath()
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading) {
                Text("What do you want to do today?")
                    .padding(.leading)
                
                ScrollView{
                    LazyVStack{ 
                        ForEach(model.modules){ module in
                            //learning card
                            VStack(spacing: 20) {
                                //MARK: LEARN SWIFT
                                NavigationLink{
                                    ContentView(module: module)
                                        .onAppear(){
                                            print(module.id)
                                        }
                                 
                                } label: {
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) lessons", time: module.content.time)
                                }
                                .foregroundColor(.black)
                                
                                NavigationLink {
                                    ContentView(module: module)
                                 
                                } label: {
                                    // test card
                                    HomeViewRow(image: module.test.image, title: "Learn \(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) lessons", time: module.test.time)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Get Started")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())

    }
}

