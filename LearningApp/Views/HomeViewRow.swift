//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/7/23.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image:String
    var title:String
    var description:String
    var count:String
    var time:String
    //var model:Content
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.white)
                .cornerRadius(30)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            HStack{
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                Spacer()
                
                VStack(alignment: .leading, spacing: 10){
                    Text(title)
                        .bold()
                    Text(description)
                        .font(.caption)
                        .padding(.bottom, 20)
     
                    HStack{
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(count)
                            .font(Font.system(size: 12))
                        
                        Spacer()
                        
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(Font.system(size: 12))
                    }
                }
                .padding(.leading)
            }
            .padding(.horizontal)
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
       HomeViewRow(image: "swift", title: "Learn swift", description: "description", count: "20 lesson", time: "20 hours")
        /*
        let model = ContentModel()
        HomeViewRow(model: model.modules[0])
         */
    }
}
