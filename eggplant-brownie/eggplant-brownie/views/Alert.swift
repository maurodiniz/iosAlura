//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Mauro Augusto Diniz on 19/02/19.
//  Copyright © 2019 Mauro Augusto Diniz. All rights reserved.
//

import Foundation
import UIKit

class Alert{
    
    let controller: UIViewController
    
    init(controller:UIViewController){
        self.controller = controller
    }
    
    func show(_ title: String = "Desculpe", message: String = "Unexpected Error"){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(ok)
        
        controller.present(alert, animated: true, completion: nil)
    }
}
