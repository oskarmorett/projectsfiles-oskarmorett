//
//  MainViewController.swift
//  Project 1 - OskarMorett
//
//  Created by oskar morett on 11/15/16.
//  Copyright © 2016 oskar morett. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
   
   var myList: ItemsList!
   
   @IBOutlet weak var mainTableView: UITableView!
   
   @IBOutlet weak var newListTextFiels: UITextField!
   
   @IBAction func addListButtonTapped(_ sender: Any) {
      
      
      guard let text = newListTextFiels.text, text.characters.count > 0 else {
         
         let alert = UIAlertController(title: "Oops!", message: "Type New Todo List", preferredStyle: UIAlertControllerStyle.alert)
         alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
         self.present(alert, animated: true, completion: nil)
         return
         
      }
      
      newListTextFiels.text = ""
      
      let newList = ItemsList.init(title: text)
           /// add text field text  to the list array
      toDolists.append(newList)
      print(newList)
      
     mainTableView.reloadData()
      
      
      
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return toDolists.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainTableViewCell
      
      
      cell.titleNameLabel.text = toDolists[indexPath.row].title
      
      
      return cell
   }
   
   
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
         if segue.identifier == "main2list" {
            let listViewController = segue.destination as! ListsViewController
            listViewController.itemList = toDolists[mainTableView.indexPathForSelectedRow!.row]
         }
         }
   
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        toDolists.remove(at: indexPath.item)
         mainTableView.reloadData()
   }
   }


   override func viewDidLoad() {
         
      super.viewDidLoad()
      
      title = "To Do List"
         
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
   }
    

    // MARKL  DELAGATE STUFF
   
   override func viewWillAppear(_ animated: Bool) {
      mainTableView.reloadData()
   }

   
   
}













