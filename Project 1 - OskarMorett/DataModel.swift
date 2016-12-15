//
//  DataModel.swift
//  Project 1 - OskarMorett
//
//  Created by oskar morett on 11/15/16.
//  Copyright © 2016 oskar morett. All rights reserved.
//

import Foundation
import UIKit

class DataModel {
   static let shared = DataModel() //singleton
   private init() {}
   let key = "toDolistKey"
   
   
   var toDolists = [ItemsList]()
   
  // MARck fucyions to save data 
   
   func persistToDefaults() {
      
      let data = NSKeyedArchiver.archivedData(withRootObject: toDolists)
      UserDefaults.standard.set(data, forKey: key)
   }
   
   func loadPersistedFromDefaults() {
      
      if let data = UserDefaults.standard.object(forKey: key) as? Data {
         toDolists = NSKeyedUnarchiver.unarchiveObject(with: data) as! [ItemsList]
      }
   }

   
   // MARK    fist class
   
   
   class ItemsList: NSObject, NSCoding {
      
      private struct Keys {
         static let title = "title"
         static let items = "items"
         
      }
      
      var title: String
      var items = [Item]()
      
      init (title: String) {
         self.title = title
         
      }
      
      required init?(coder aDecoder: NSCoder) {
            title = aDecoder.decodeObject(forKey: Keys.title) as! String
            items = aDecoder.decodeObject(forKey: Keys.items) as! [Item]
      }
      
      func encode(with aCoder: NSCoder) {
         
         aCoder.encode(title, forKey: Keys.title)
         aCoder.encode(items, forKey: Keys.items)
         
      }
      
   }
   
   
   //MARCK   2 class
   
   
   class Item: NSObject, NSCoding {
      
      
      private struct Keys {
         static let title = "title"
         static let descriptions = "descriptions"
      }

      var title: String
      var descriptions: String
      
      init (title: String, descriptions: String  ){
         self.title = title
         self.descriptions = descriptions
      }
      
      required init?(coder aDecoder: NSCoder) {
         title = aDecoder.decodeObject(forKey: Keys.title) as! String
         descriptions = aDecoder.decodeObject(forKey: Keys.descriptions) as! String
      }
      
      func encode(with aCoder: NSCoder) {
         
         aCoder.encode(title, forKey: Keys.title)
         aCoder.encode(descriptions, forKey: Keys.descriptions)
         
      }

      
      
      
      
   }
   
   
   
   
   
   
   
} //end of singleton Classs
