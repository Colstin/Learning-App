//
//  ContentModel.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/7/23.
//

import Foundation
import SwiftUI

class ContentModel: ObservableObject{
    // List of Modules
    @Published var modules = [Module]()
    
    @Published var path = NavigationPath()

    //Current lesson explanation
    @Published var lessonDescription = NSAttributedString()
    var styleData:Data?
    
    // Current Module
  //  @Published var currentModule: Module?
   // var currentModuleIndex = 0
    
    // Current Lesson
   // @Published var currentLesson:Lesson?
    //var currentLessonIndex = 0
    
   // @Published var currentContentSelected:Int?
    
    
    init() {
        getLocalData()
    }
    
    
    // MARK: Data Methods
    func getLocalData(){
        //1. Get a URL/ file path to json file .. Bundle.main.url(forResource: "Data", withExtension: "json")
        //2. Read file into a data object...  Data(contentsOf: url)
        //3. Create a JSONDecoder()
        //4. Try to Decode json into an array or whatever... jsonDecoder.decode([Module].self, from: jsonData)
        //5. assign parsed data into your published variables
        //6. OPIONAL: set unique ID's for each instance ( IF NEEDED)
        
        let jsonUrl = Bundle.main.url(forResource: "Data", withExtension: "json") // solves the nil part
        
        do{
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData) //decode it into an array of [Module]
            
            self.modules = modules
            
        } catch{
            print(error)
        }
        // parse the css file
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do{
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
            
        } catch{
            print(error)
        }
    }
    
    
    // MARK: Navigation Path methods
    func gotoHomePage() {
           path.removeLast(path.count)
       }
    func gotoNextItem(_ navItem:Int){
        path.append(modules[navItem])
    }
    
    
    /*
    
    func beginModule(_ moduleid:Int){
        // Find the  index for this module id
        for i in 0..<modules.count{
            if modules[i].id == moduleid {
                // found the matching module
                currentModuleIndex = i
                break
            }
        }
        
        // Set the current module
        currentModule = modules[currentModuleIndex]
    }
    
    func beginLesson(_ lessonIndex:Int){
        // Check that the lesson index is within range of module lessons
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        } else{
            currentLessonIndex = 0
        }
        
        // set the current lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        lessonDescription = addStyling(currentLesson!.explanation)
    }
    
    func nextLesson() {
        
        currentLessonIndex += 1
        if currentLessonIndex < currentModule!.content.lessons.count{
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            lessonDescription = addStyling(currentLesson!.explanation)
            
        } else{
            currentLesson = nil
            currentLessonIndex = 0
        }
    }
    
    func hasNextLesson() -> Bool {
        return (currentLessonIndex + 1 < currentModule?.content.lessons.count ?? 0)
    }
     */
    
    //MARK: Code Styling
    private func addStyling(_ htmlString:String) -> NSAttributedString {
        var resultsString = NSAttributedString()
        var data = Data()
        //add styling data
        if styleData != nil{
            data.append(self.styleData!)
            
        }
        //Add the html data
        data.append(Data(htmlString.utf8))
        
        //Convert the attributed string
        do{
            let attributedString = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
                
               resultsString = attributedString
            
        } catch{
            print("couldn't turn html into a attributed string")
        }
        
        
        return resultsString
    }
}
