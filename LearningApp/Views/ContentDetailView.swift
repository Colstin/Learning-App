//
//  TestDetailView.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/14/23.

// MARK: This is the Video screen Showing details on lesson and a next button
// note the last slide will include a complete button to take the user back home. 

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var contentModel:ContentModel
    var model:Lesson
    
    var body: some View {
        let url = URL(string: Constants.videoHostUrl + model.video)
        
        VStack {
            if url != nil{
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(20)
            }
            
            ScrollView {
                Text(model.explanation)
            }
            .padding(.top)
            
            
           
        }
        .navigationTitle(model.title)
        .padding()
    }
}




/*
struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let previewModel = ContentModel()
    ContentDetailView_Previews(model:)
   
    }
}

*/
