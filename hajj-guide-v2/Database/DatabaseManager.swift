//
//  DatabaseManager.swift
//  
//
//  Created by Project  on 30/07/2018.
//

import Foundation
import SQLite3

class DatabaseManager {
    
   
    
    
    private let dbFileName = "HajjAndUmrah.db"
    //private var database:FMDatabase!
    
    init() {
        openDatabase()
    }
    
    func openDatabase() {
        
        
        let filemgr = FileManager.default
        let dirPaths =
            NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                .userDomainMask, true)
        
        let docsDir = dirPaths[0]
        
        let databasePath = docsDir + "/" + dbFileName
        print ("db path is", databasePath)
        
        if !filemgr.fileExists(atPath: databasePath as String) {
            
            let hajjGuideDB = FMDatabase(path: databasePath as String)
            
            if hajjGuideDB == nil {
                print("Error: \(hajjGuideDB?.lastErrorMessage() ?? "error encounter")")
            }
            
            if (hajjGuideDB?.open())! {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT)"
                if !(hajjGuideDB?.executeStatements(sql_stmt))! {
                    print("Error: \(hajjGuideDB?.lastErrorMessage() ?? "could't execute statement")")
                }
                hajjGuideDB?.close()
            } else {
                print("Error: \(String(describing: hajjGuideDB?.lastErrorMessage()))")
            }
        }
        
        
       /* let resourcePath = Bundle.main.resourceURL!.absoluteString
        let dbPath = resourcePath + dbFileName
        let database = FMDatabase(path: dbPath)
        
        
        if (!database.openWithFlags(1)) {
            print("Could not open database at \(dbPath).")
        } else {
            self.database = database;
        }*/
    }
    
}
