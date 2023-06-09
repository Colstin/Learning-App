//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/10/23.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    //var model: Lesson
   
    func makeUIView(context: Context) -> UITextView{
        let textView = UITextView()
        textView.isEditable = false
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = model.codeText
        
        uiView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
    
}
/*
struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
            //.environmentObject(ContentModel())

    }
}
*/
