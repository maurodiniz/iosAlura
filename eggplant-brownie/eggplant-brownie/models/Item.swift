import Foundation

// Implementei o protocolo Equatable para poder comparar 2 objetos do tipo Item. Esse protocolo obriga o programador a implementar a função 'func =='
class Item: Equatable {
    let name:String
    let calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
    
    
}

func ==(first:Item, second:Item) -> Bool{
    return first.name == second.name && first.calories == second.calories
}


