//
//  FoodListController.swift
//  Project 10
//
//  Created by SHiRoMe9 on 09/04/2017.
//  Copyright © 2017 SHiRoMe9. All rights reserved.
//

import UIKit

class FoodListController: UITableViewController {
    
    
    var list : [String:[String]] = [
        "M":
            ["Milk", "Mike Tea"],
        "A":
            ["Apples", ],
        
        "H":
            ["Ham"],
       
        "E":
            ["Eggs", "Eggplant"],
        
        "U":
            ["Undercover Brother", "Underworld", "Up In the Air"],
        
        "V":
            ["V for Vendetta", "Vanilla Sky", "Venus Boyz"],
        
        "W":
            ["Wall-E", "Wanted", "The Wild", "Willy Wonka and the Chocolate Factory", "The Wizard of Oz"],
     
        "X":
            ["The X-Files: Fight the Future", "X-Men", "xXx"],
        
        "Y":
            ["You Got Served", "You've Got Mail", "You Only Live Twice", "Young Frankenstein"],
        "Z":
            ["Zombieland", "Zookeeper", "Zoolander", "Zorro"],
        
    ]
    
    var listIndex : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        self.title = "Groceries"
        
        // Add action on the top of bar
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewFood))

        listIndex = Array(list.keys).sorted()

        
        
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
        return listIndex.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if let rows = list[listIndex[section]]?.count {
            
            return rows  //
        }
        
        return 0
    }


    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return listIndex[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        
        cell.textLabel?.text = list[listIndex[indexPath.section]]?[indexPath.row]
       //        cell.accessoryType = .disclosureIndicator
        
        return cell
    }

    
    func swipeRefresh(refreshControl : UIRefreshControl)
    {
        weak var weakSelf = self
        
        
        
        let time = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: time) {
            
            weakSelf?.tableView.reloadData()
            
            // End refreshing in a dummy two seconds delay for demo effect
            refreshControl.endRefreshing()
            
        }

    }
    
   
    
    // the meth to implementat section Indext Title very useful!
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return listIndex
    }
    
    
    
    
    func addNewFood () {
        performSegue(withIdentifier: "New Food", sender: nil)
    }
    
    func updateList (name: String) {
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            list[listIndex[indexPath.section]]?.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        var temp : String = ""
        
        if let newList = list[listIndex[fromIndexPath.section]] {
            temp =  newList[fromIndexPath.row]
        }
        
        
        list[listIndex[fromIndexPath.section]]?.remove(at: fromIndexPath.row)
        
        list[listIndex[to.section]]?.insert(temp, at: to.row)
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
