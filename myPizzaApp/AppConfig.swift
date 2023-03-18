import Foundation

struct AppConfig:Codable {
    let pizzaList: [PizzaModel]
    let rollList: [RollModel]
}
