//
//  ContentView.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/7/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        NavigationStack(path: $model.path ) {
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
                                    ContentView(model: module)
                                        .onAppear(){
                                           // print(module.id)
                                        }
                                 
                                } label: {
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) lessons", time: module.content.time)
                                }
                               
                                
                                NavigationLink {
                                     SwiftTestView()
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
            .foregroundColor(.black)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}

/* to do:
 1. finish parsing CodeTextView() onto our DetailView
 2. Start with navigation path
 */
