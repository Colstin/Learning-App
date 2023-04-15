//
//  TestDetailView.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/14/23.
//

import SwiftUI
import AVKit

struct TestDetailView: View {
    
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
            
            
            Button {
                // Change to next Lesson
                
            } label: {
                ZStack {
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(.green)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                    Text("Next Lesson \(model.title)")
                        .foregroundColor(.white)
                        .bold()
                    
                }
            }
        }
        .navigationTitle(model.title)
        .padding()
    }
}




/*
struct TestDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let previewModel = ContentModel()
        TestDetailView_Previews(model:)
   
    }
}

*/
