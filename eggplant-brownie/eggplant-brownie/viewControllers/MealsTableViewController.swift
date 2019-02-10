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
        
        return cell
    }
}
