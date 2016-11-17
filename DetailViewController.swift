//
//  DetailViewController.swift
//  Project 1 - OskarMorett
//
//  Created by oskar morett on 11/15/16.
//  Copyright © 2016 oskar morett. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
   
   
   @IBOutlet weak var titleTextFild: UITextField! // for tittel of ToDoList
   
   @IBOutlet weak var contentTextController: UITextView! // to input content  of the list
   
   var item: Item!
   
   @IBAction func doneButtonTapped(_ sender: Any) { // Buton to add the new iteml to the list
   
      guard let text = titleTextFild.text, text.characters.count > 0, /// diplay notififation whe textfield is empty
            let text1 = contentTextController.text, text1.characters.count > 0 else {
         
         let alert = UIAlertController(title: "Ooops!", message: "Type a Title ", preferredStyle: UIAlertControllerStyle.alert)
         alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
         self.present(alert, animated: true, completion: nil)
         return
         
      }

      let newListTitle =  titleTextFild.text  
      let newItemDescription = contentTextController.text
      
      item.title = newListTitle!
      item.description = newItemDescription!
      
      _ = navigationController?.popViewController(animated: true)
   }
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
      title = "New Task"

      titleTextFild.text = item.title
      contentTextController.text = item.description
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   }
