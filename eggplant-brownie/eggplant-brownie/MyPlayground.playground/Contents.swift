import UIKit

var str:String = "Hello, playground";

// Comentário de 1 linha
var name2 = "Mauro";
print("\(name2) Augusto");

/* Comentário de várias linhas */

let name:String = "Eggplant"
let calories:Double = 50.25;
let happiness:Int = 5;

let eggplantIsAVegetable = false;

func HelloCalories(){
    print("Hello Calories!")
}


// Criando uma função com argumentos
func Add(name:String, calories:Double){
    print("Adding \(name) with \(calories)");
}

Add(name: "Brownie", calories: 459.80);

// Criação de um array simples
let calories2 = [12.5, 20, 190, 90, 5]


for i in 0...4{ // laço com escopo fixo
    print(calories2[i])
}
for i in 0...calories2.count-1 { // laço até o fim do array
    print(calories2[i])
}
for cal in calories2{ // forma mais limpa de percorrer um array
    print(cal)
}

func allCalories(calories:Array<Double>) -> Double{
    var total:Double = 0
    for c in calories{
        total += c
    }
    return total
}
allCalories(calories: [10.45,200,342,412,23])

func calculaSoma(valores:Array<Double>) -> Double {
    var soma:Double = 0
    for valor in valores {
        soma += valor
    }
    return soma
}

class Meal{
    var happiness:Int = 5;
    var name:String = "Eggplant brownie";
}

let brownie = Meal();

// Classe com opcionais
class Meal2{
    var happiness2:Int?
    var name2:String?
}
var biscoito = Meal2()
    biscoito.name2 = "Biscoito de chocolate"

// Para não correr risco de acessar uma varivel nula e a aplicação crashar, podemos usar um if let
if let nome = biscoito.name2{
    print(nome.uppercased())
}

// classe com construtor
class Meal3{
    var happiness:Int
    var name:String
    var items = Array<Item>()
    
    init(name:String, happiness:Int) {
        self.name = name
        self.happiness = happiness
    }
    
    func allCalories() -> Double{
        var total = 0.0
        for i in items{
            total += i.calories
        }
        
        return total
    }
}

class Item{
    var name:String
    var calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
}
let item1 = Item(name: "brownie", calories: 250)
let item2 = Item(name: "vegan cream", calories: 45)

let refeicao = Meal3(name: "eggplant brownie", happiness: 5)

refeicao.items.append(item1)
refeicao.items.append(item2)

print(refeicao.allCalories())
