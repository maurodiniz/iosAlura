//
//  RemoveMealController.swift
//  eggplant-brownie
//
//  Created by Mauro Augusto Diniz on 21/02/19.
//  Copyright © 2019 Mauro Augusto Diniz. All rights reserved.
//

import Foundation
import UIKit

class RemoveMealController{
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    // Adicionamos a anotação @escaping pois o mesmo deverá continuar existindo após o término da execução do método show, ou seja, irá escapar o ciclo de vida do método show.
    func show(_ meal: Meal, handler: @escaping (UIAlertAction) -> Void){
        
        // Comando para criar um Controller de Alerta, que será mostrado em um pop-up quando o usuario pressionar uma refeição da lista.
        let details = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertController.Style.alert)
        
        // Exemplo de Closure, ou seja, uma sequencia de código enviado em forma de parametro
        let remove = UIAlertAction(title: "Remove", style: UIAlertAction.Style.destructive, handler: handler)
        details.addAction(remove)
        
        // Criando o botão de ok que será mostrado no pop-up do AlertController, para que o usuario possa voltar para a lista de refeições.
        let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
        details.addAction(ok)
        
        // Com o Controller de alerta devidamente configurado, posso mostrar na tela através do comando 'self.present'
        controller.present(details, animated: true, completion: nil)
    }
}
