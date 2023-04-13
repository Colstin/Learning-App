//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/9/23.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        //let mp4 = "Learn%20Swift%20for%20Beginners%20Lesson%201%20-%20Variables%20(Swift%205%20compatible)-2OZ07fklur8.mp4"
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        //let url = URL(string: Constants.videoHostUrl + mp4)
        VStack{
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(20)
            }
            
            // Description
            CodeTextView()
            
            
            //Next Lesson Button
            if model.hasNextLesson() {
                Button {
                    model.nextLesson()
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 48)
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        
                        Text("Next Lesson \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                        
                    }
                }
            } else {
                Button(){
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 48)
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        
                        Text("Complete")
                    }
                }
            }
        }
        .padding()
        .navigationTitle(lesson?.title ?? "")
        
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
            .environmentObject(ContentModel())

    }
}
