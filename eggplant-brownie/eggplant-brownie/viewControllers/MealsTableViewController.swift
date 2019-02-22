import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate{
    
    var meals = [Meal(name: "Eggaplant Brownie", happiness: 5),
                 Meal(name: "Zucchini Muffin", happiness: 3),
                 Meal(name: "Daniela´s cheesecake", happiness: 5)]
    
    // Adiciona uma meal recebida por parametro no array meals. Com o underline antes do 1o parametro,
    // Eu especifico que seu nome não deve ser escrito na chamada do método, bastando o programador mandar o parametro direto
    func add(_ meal:Meal) {
        meals.append(meal)
        tableView.reloadData()
    }
    
    // Ação realizada logo antes de pular de uma tela para outra
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addMeal"){
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        
        cell.textLabel!.text = meal.name
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(showDetails))
        cell.addGestureRecognizer(longPressRecognizer)
        
        return cell
    }
    
    @objc func showDetails(recognizer: UILongPressGestureRecognizer){
        // Se for um Gesto que está no inicio, ele inicia o código
        if(recognizer.state == UIGestureRecognizer.State.began){
            // Fazendo um Cast de UIView para UITableViewCell, para que possamos acessar qual a refeição que está na linha pressionada
            let cell = recognizer.view as! UITableViewCell
            
            // Descobrindo qual a refeição que está na linha pressionada
            if let indexPath = tableView.indexPath(for: cell){
                let row = indexPath.row
                let meal = meals[row]
                // print("Long press \(meal.name)")
                
                RemoveMealController(controller: self).show(meal, handler: {action in self.meals.remove(at: row)
                    self.tableView.reloadData()
                })
                
                
            }
            
            
            
        }
        
    }
    
    
}
