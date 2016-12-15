//
//  ListsViewController.swift
//  Project 1 - OskarMorett
//
//  Created by oskar morett on 11/15/16.
//  Copyright © 2016 oskar morett. All rights reserved.
//

import UIKit

class ListsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
   var itemList: DataModel.ItemsList!
   var currentItem = 0
   
   @IBOutlet weak var listTableView: UITableView!
   
   
   @IBOutlet weak var newItemTextField: UITextField!
   
   
   @IBAction func addITemButtonTapped(_ sender: Any) {
      
      
      guard let text = newItemTextField.text, text.characters.count > 0 else {
         
         let alert = UIAlertController(title: "Oops!", message: "Enter a New To Do Task", preferredStyle: UIAlertControllerStyle.alert)
         alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
         self.present(alert, animated: true, completion: nil)
         return
         
      }

      let newItem = DataModel.Item(title: newItemTextField.text!, descriptions: "")
      itemList.items.append(newItem)
      
      newItemTextField.text = ""  /// cleans the textfield from previuse typo
      
      DataModel.shared.persistToDefaults()
      
      listTableView.reloadData()
   }
   
   
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return itemList!.items.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
      let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListTableViewCell

      cell.itemsListLabel.text = itemList.items[indexPath.row].title
   
      return cell
   }

   
   
   /// MArk   TABELVIEWDELEGATE STUFF
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      currentItem = indexPath.row
      

   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // send the infoto the nexty ViewControler
      
      if segue.identifier == "list2Item" {
      let detailViewController = segue.destination as! DetailViewController
      detailViewController.item = itemList!.items[listTableView.indexPathForSelectedRow!.row]
      }
   }
   
   
   // to delete the cell by siwping
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
         itemList!.items.remove(at: indexPath.item)
         
         DataModel.shared.persistToDefaults()

         listTableView.reloadData()
      }
   }


     override func viewWillAppear(_ animated: Bool) {
       listTableView.reloadData()
   }
   

    override func viewDidLoad() {
  
        super.viewDidLoad()
      title = "My Lists"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
   
   
    
}
