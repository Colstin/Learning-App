//
//  ContentModel.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/7/23.
//

import Foundation

class ContentModel: ObservableObject{
    
    @Published var modules = [Module]()
    
    var styleData:Data?
    
    
    init() {
        getLocalData()
    }
    
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
}
