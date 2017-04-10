//
//  FoodListController.swift
//  Project 10
//
//  Created by SHiRoMe9 on 09/04/2017.
//  Copyright © 2017 SHiRoMe9. All rights reserved.
//

import UIKit

class FoodListController: UITableViewController {
    
    
    var list = ["Milk", "Apples", "Ham", "Eggs"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        self.title = "Groceries"
        
        // Add action on the top of bar
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewFood))

        
        // Create a UIRefreshControl if needed
//        if self.refreshControl == nil {
//            self.refreshControl = UIRefreshControl()
//        }
//        
        
//        self.refreshControl?.addTarget(
//            self,
//            action: #selector(swipeRefresh(refreshControl: )),
//            for: .valueChanged
//        )
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        
        
        return list.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = list[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }

    
    func swipeRefresh(refreshControl : UIRefreshControl)
    {
        weak var weakSelf = self
        list = ["Fish", "Carrots", "Milk", "Apples", "Ham", "Eggs", "Bread", "Chicken", "Water"]
        
        
        let time = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: time) {
            
            weakSelf?.tableView.reloadData()
            
            // End refreshing in a dummy two seconds delay for demo effect
            refreshControl.endRefreshing()
            
        }

    }
    
    
    func addNewFood () {
        performSegue(withIdentifier: "New Food", sender: nil)
    }
    
    
    
    func updateList (name: String) {
        
        list.append(name)
        tableView.reloadData()
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let newList = list[fromIndexPath.row]
        list.remove(at: fromIndexPath.row)
        list.insert(newList, at: to.row)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "New Food" {
            if let newFood = segue.destination as? NewFoodController {
                newFood.delegate = self
            }
            
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
