import SwiftUI

struct Elixir: Codable, Comparable, Equatable {
    let id: UUID
    let name: String
    let effect: String?
    let sideEffects: String?
    let characteristics: String?
    let time: String?
    let difficulty: String
    let ingredients: [Ingredients]
    let inventors: [Inventor]
    let manufacturer: String?
    
    static func <(lhs: Elixir, rhs: Elixir) -> Bool {
        return lhs.name < rhs.name
    }
}

struct Ingredients: Codable, Equatable, Identifiable {
    let id: UUID
    let name: String
}

struct Inventor: Codable, Equatable, Identifiable {
    let id: UUID
    let firstName: String?
    let lastName: String
}

class ElixirModel: ObservableObject {
    @Published var elixirs: [Elixir] = []
    func fetch() {
        guard let url = URL(string: "https://wizard-world-api.herokuapp.com/Elixirs") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let elixirs = try JSONDecoder().decode([Elixir].self, from: data).sorted()
                DispatchQueue.main.async {
                    self.elixirs = elixirs
                }
            } catch {
                print(error)
            }
        } 
        task.resume()
    }
}

