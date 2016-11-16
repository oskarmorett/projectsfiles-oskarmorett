//
//  DataModel.swift
//  Project 1 - OskarMorett
//
//  Created by oskar morett on 11/15/16.
//  Copyright © 2016 oskar morett. All rights reserved.
//

import Foundation
import UIKit


var toDolists = [ItemsList]()


class ItemsList {
   var title: String
   var items = [Item]()
   
   init (title: String){
      self.title = title
   }
}


class Item {
   var title: String
   var description: String
   
   init (title: String, description: String  ){
      self.title = title
      self.description = description
      
   }
}


