//
//  ViewController.swift
//  SwiftExample
//
//  Created by Belal Khan on 18/11/17.
//  Copyright © 2017 Belal Khan. All rights reserved.
//

import UIKit
import SQLite3

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var categories = [Category]()
    
    @IBOutlet weak var tableViewHajjCategories: UITableView!
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CategoryListItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryListItemTableViewCell
        cell.categorylabel?.text = categories[indexPath.row].cname
        cell.categoryImage?.image = UIImage(named: categories[indexPath.row].image)
        print("Row: \(indexPath.row)")
        return cell
    }
    
    
    func readValues(){
        categories.removeAll()
        let dbmngr  = DBManager()
        
        if ( dbmngr.openDatabase() == true ){
            categories = dbmngr.loadCategories(type: "Hajj")
        }
        self.tableViewHajjCategories.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewHajjCategories.delegate = self
        self.tableViewHajjCategories.dataSource = self
        readValues()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //  tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        let row = indexPath.row
        print("Row: \(row)")
        
        print(categories[indexPath.row].cname)
        self.performSegue(withIdentifier: "ContentViewSegue", sender:nil)
        
    }
}
