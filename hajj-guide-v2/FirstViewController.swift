//
//  FirstViewController.swift
//  hajj-guide-v2
//
//  Created by Project  on 13/07/2018.
//  Copyright © 2018 Kindred Spirits. All rights reserved.
//

import UIKit
import SQLite3

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var umrahview: UITableView!
    let dbmngr  = DBManager()
   
    var umrahCategoryList = [Category]()
    
    func readValues(){
        umrahCategoryList.removeAll()
        
        
        if ( dbmngr.openDatabase() == true ){
            umrahCategoryList = dbmngr.loadCategories(type: "Umrah")
        }
        self.umrahview.reloadData()
    }
    
   
    var utility = Utility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tabBarItem.image = utility.makeThumbnailFromText(text: utility.firstTabTitle)
        tabBarController?.tabBar.items![1].image = utility.makeThumbnailFromText(text: utility.secondTabTitle)
        self.umrahview.delegate = self
        self.umrahview.dataSource = self
          readValues()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return umrahCategoryList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell: CategoryListItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryListItemTableViewCell
        cell.categorylabel?.text = umrahCategoryList[indexPath.row].cname
        cell.categoryImage?.image = UIImage(named: umrahCategoryList[indexPath.row].image)
         print("Row: \(indexPath.row)")
         return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      //  tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        let row = indexPath.row
        print("Row: \(row)")
        
        print(umrahCategoryList[indexPath.row].cname)
        selectedRow = indexPath.row
        self.performSegue(withIdentifier: "ContentViewSegue", sender:nil)
        
    }
    
    var selectedRow:Int = 0
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ViewController
        {
            let vc = segue.destination as? ViewController
            vc?.categorySelected = umrahCategoryList[selectedRow]
           // vc?.username = "Arthur Dent"
        }
    }

    
    
}

