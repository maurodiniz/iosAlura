//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Alura on 19/09/16.
//  Copyright © 2016 Alura. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    
    @IBOutlet var nameField : UITextField?
    @IBOutlet var happinessField : UITextField?
    var delegate : AddAMealDelegate?
    var selected = Array<Item>()
    
   /* var items = [
        Item(name: "Eggplant", calories: 10),
        Item(name: "Brownie", calories: 10),
        Item(name: "Zucchini", calories: 10),
        Item(name: "Muffin", calories: 10),
        Item(name: "Coconut oil", calories: 500),
        Item(name: "Chocolate frosting", calories: 1000),
        Item(name: "Chocolate chip", calories: 1000),
        ] */
    
    var items = Array<Item>()
    
    @IBOutlet var tableview: UITableView?
    
    func add(_ item: Item) {
        items.append(item)
        
        Dao().save(items)
        
        
        if let table = tableview{
            table.reloadData()
        }else{
            Alert(controller: self).show(message:"Unable to refresh Items!")
        }
    }
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New", style: UIBarButtonItem.Style.plain, target: self, action: #selector(showNewItem))
        
        navigationItem.rightBarButtonItem = newItemButton
        
        items = Dao().load()
    }
    
    @objc func showNewItem(){
        let newItem = NewItemViewController(delegate:self)
        
        if let navigation = navigationController{
            navigation.pushViewController(newItem, animated: true)
        }else{
            Alert(controller: self).show()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            
            if(cell.accessoryType == UITableViewCell.AccessoryType.none){
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                
                let item = items[indexPath.row]
                selected.append(item)
            }else{
                cell.accessoryType = UITableViewCell.AccessoryType.none
                
                let item = items[indexPath.row]
                if let position = selected.index(of: item){
                    selected.remove(at: position)
                }
            }
            
        }else{
            Alert(controller: self).show()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = item.name
        return cell
    }
    
    func convertToInt(_ text: String?) -> Int?{
        if let number = text{
            return Int(number)
        }
        return nil
    }
    
    /* Se conseguir extrair o nome e a felicidade, cria a refeição e retorna. */
    func getMealFromForm() -> Meal?{
        
        if let name = nameField?.text{
            if let happiness  = convertToInt(happinessField?.text){
                let meal = Meal(name: name, happiness: happiness, items: selected)
                
                print("eaten \(meal.name) with happiness \(meal.happiness). Items: \(meal.items)!")
                
                return meal
            }
        }
        
        return nil
    }
    
    func getArchive() -> String{
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0]
        
        let archive = "\(dir)/eggplant-brownie-items.dados"
        
        return archive
    }
    
    /* Se tiver uma refeição retornada do getMealFromForm e tiver um delegate, adiciona e navega. */
    @IBAction func add() {

        if let meal = getMealFromForm(){
            if let meals = delegate{
                meals.add(meal)
                if let navigation = navigationController {
                    navigation.popViewController(animated: true)
                }else{
                    Alert(controller: self).show(message:"Unable to return, but the meal was added!")
                }
                return
            }
        }
        Alert(controller: self).show()
    }
    
    
}
