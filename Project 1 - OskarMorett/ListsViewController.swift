//
//  ListsViewController.swift
//  Project 1 - OskarMorett
//
//  Created by oskar morett on 11/15/16.
//  Copyright © 2016 oskar morett. All rights reserved.
//

import UIKit

class ListsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
   var itemList: ItemsList!
   var currentItem = 0
   
   @IBOutlet weak var listTableView: UITableView!
   
   
   @IBOutlet weak var newItemTextField: UITextField!
   
   
   @IBAction func addITemButtonTapped(_ sender: Any) {
      

      let newItem = Item(title: newItemTextField.text!, description: "")
      itemList.items.append(newItem)
      
   
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
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
      if segue.identifier == "list2Item" {
      let detailViewController = segue.destination as! DetailViewController
      detailViewController.item = itemList!.items[listTableView.indexPathForSelectedRow!.row]
      }
   }
   
   
   
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
         itemList!.items.remove(at: indexPath.item)
         listTableView.reloadData()
      }
   }

   
   
   
   
     override func viewWillAppear(_ animated: Bool) {
       listTableView.reloadData()
      }
   
   

    override func viewDidLoad() {
      
   //   guard let donde = currentList else{
    //     return
      //}

      
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
   
    
}
