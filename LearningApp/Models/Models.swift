//
//  Models.swift
//  LearningApp
//
//  Created by Colstin Donaldson on 4/7/23.
//

import Foundation

struct Module: Decodable, Identifiable, Hashable{
    
    var id:Int
    var category:String
    var content:Content
    var test:Test
}

struct Content: Decodable, Identifiable, Hashable{
    
    var id:Int
    var image:String
    var time:String
    var description:String
    var lessons:[Lesson]
}


struct Lesson: Decodable, Identifiable, Hashable{
    
    var id:Int
    var title:String
    var video:String
    var duration:String
    var explanation:String
}

struct Test: Decodable, Identifiable, Hashable{
    
    var id:Int
    var image:String
    var time:String
    var description:String
    var questions:[Question]
}

struct Question: Decodable, Identifiable, Hashable{
    
    var id:Int
    var content:String
    var correctIndex:Int
    var answers:[String]
}


/*
 1. we use this [Question]  and not [String] because its an array of an object which is shown by the [] with {} inside of it plus it has an ID so we know it is gonna be its own thing. Basically its not just strings.
 
 2. On the very first one we use test:Test because test is not an array we are holding an entire object of a test shown by just using {}
 
 */
