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
                        } label:  {
                            HomeViewRow(image: module.content.image, category: "Learn \(module.category)", description: module.content.description, lesson: module.content.lessons.count, time: module.content.time)
                        }
                        .padding(.top)
                        
                        
                        NavigationLink {
                            SwiftTestView()
                                .onAppear(){
                                    contentModel.beginTest(module.id)
                                }
                        } label: {
                            HomeViewRow(image: module.test.image, category: "\(module.category) Test", description: module.test.description, lesson: module.test.questions.count, time: module.test.time)
                        }
                    }
                }
            }
            .navigationTitle("Choose Your Course!")
            .navigationBarTitleDisplayMode(.inline)
           
       }
       .navigationBarBackButtonHidden()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}


// MARK: Conclusion
/*
 1. Main thing I would Like to have done is to have had a NavigationStack from the very beginning. This would've made navigating different views eaiser but it would make navigating the lesson content more difficult I would argue a lot more difficult. Tests category use this approach it is cleaner to do.
 
    I would probably reccommend in the future to simply start w/ the navigationStack approach and make the code inside the button tabViews more complicated. I would rather focus my attention on that part rather than just navigate a simple screen which the Navpath easily fixes.
 
 Finally, both solutions do work and nothing at the time of writing this is deprecated. NavigationStack tho is the current update to the navigationView. The Test way is the more supior option due to the fact we can simply use ContentModel which is the view model and then access everything from a @Environment Object This is simply my prefered way as its simple.
 
 */


/* MARK: Design tips
 When Designing start w/ hardcoded structure get everything set
 then start makeing it dynamic.
 
 */

/* markdown photo
 <div align="center">
 <img width="220" src="" alt="" title="">
 &nbsp;
 &nbsp;
 &nbsp;
 <img width="205" src="" alt="" title="">
 &nbsp;
 &nbsp;
 &nbsp;
 <img width="192" src="" alt="" title="">
 </div>
 */
