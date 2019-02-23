//
//  Dao.swift
//  eggplant-brownie
//
//  Created by Mauro Augusto Diniz on 23/02/19.
//  Copyright © 2019 Mauro Augusto Diniz. All rights reserved.
//

import Foundation

class Dao {
    
    let mealsArchive: String
    let itemsArchive: String
    
    init(){
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0]
        
        mealsArchive = "\(dir)/eggplant-brownie-meals.dados"
        itemsArchive = "\(dir)/eggplant-brownie-items.dados"
    }
    
    func save(_ meals: Array<Meal>){
        NSKeyedArchiver.archiveRootObject(meals, toFile: mealsArchive)
    }
    
    func load() -> Array<Meal>{
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: mealsArchive){
            let meals = loaded as! Array<Meal>
            
            return meals
        }
        
        return Array<Meal>()
    }
    
    func save(_ items: Array<Item>){
        NSKeyedArchiver.archiveRootObject(items, toFile: itemsArchive)
    }
    
    func load() -> Array<Item>{
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: itemsArchive){
            let items = loaded as! Array<Item>
            
            return items
        }
        
        return Array<Item>()
    }
    
    
}
