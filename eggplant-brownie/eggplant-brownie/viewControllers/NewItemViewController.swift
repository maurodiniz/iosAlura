//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Mauro Augusto Diniz on 12/02/19.
//  Copyright © 2019 Mauro Augusto Diniz. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var caloriesField: UITextField?
    
    var delegate: AddAnItemDelegate?
    
    init(delegate: AddAnItemDelegate){
        super.init(nibName: "NewItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func addNewItem(){
        if(nameField == nil || caloriesField == nil || delegate == nil) {
            return
        }
        
        let name = nameField!.text
        let calories = Double(caloriesField!.text!)
        let item = Item(name: name!, calories: calories!)
        
        delegate!.add(item)
        
        print("Novo Item...")
        if let navigation = navigationController{
            navigation.popViewController(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
