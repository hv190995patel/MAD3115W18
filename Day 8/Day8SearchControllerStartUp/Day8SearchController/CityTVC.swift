//
//  CityTVC.swift
//  Day8SearchController
//
//  Created by Jigisha Patel on 2018-02-23.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit

class CityTVC: UITableViewController,UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if mySearchController.searchBar.text! == ""
        {
            self.filterCityList = cityList
        }
        else {
            filterCityList = cityList.filter({$0.city.lowercased().contains(mySearchController.searchBar.text!.lowercased())})
        }
        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(searchBar:UISearchBar) {
        self.tableView.reloadData()
    }
    
    var filterCityList = cityList
    let mySearchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 90
        
        mySearchController.dimsBackgroundDuringPresentation = false
        mySearchController.searchResultsUpdater = self
        mySearchController.definesPresentationContext = true
        
        tableView.tableHeaderView = mySearchController.searchBar
    }
    
   // mySearchController.searchResultsUpdater = self
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filterCityList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell

        // Configure the cell...
        let row = indexPath.row
        
        cell.lblCity.text = filterCityList[row].city
        cell.lblProvince.text = filterCityList[row].province
  
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let location = "\(filterCityList[row].city), \(filterCityList[row].province)"
        print("location : \(location)")
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

