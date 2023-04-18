//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/7/23.
//
// This is a blank ViewRow rather than assigning it to a model because if we assine to a model we would have to create multiple view rows for each model so this is the least redundant of the options.
import SwiftUI

struct HomeViewRow: View {
    
    var image:String
    var category:String
    var description:String
    var lesson:Int
    var time:String
    
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
                    Text(category)
                        .bold()
                    Text(description)
                        .font(.caption)
                        .padding(.bottom, 20)
     
                    HStack{
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(String(lesson))
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
        .foregroundColor(.black)
    }
}

/*
struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
    
        let model = ContentModel()
        HomeViewRow(model: model.modules[0])
         
    }
}

*/
