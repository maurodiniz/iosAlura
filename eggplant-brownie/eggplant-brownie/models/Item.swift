import Foundation

// Implementei o protocolo Equatable para poder comparar 2 objetos do tipo Item. Esse protocolo obriga o programador a implementar a função 'func =='
// Protocolo NSObject e NSCoding usado para permitir a serialização dos objetos. E a partir do momento que eu implemento o NSObject, não é necessário implementar o Equatable, pois o NSObject tb é um Equatable
class Item: NSObject, /*Equatable,*/ NSCoding {
    let name:String
    let calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey:"name") as! String
        self.calories = aDecoder.decodeDouble(forKey: "calories")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(calories, forKey:"calories")
    }
}

func ==(first:Item, second:Item) -> Bool{
    return first.name == second.name && first.calories == second.calories
}


