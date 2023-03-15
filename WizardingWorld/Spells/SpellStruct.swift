import SwiftUI

struct Spell: Codable, Comparable {
    let id: UUID
    let name: String
    let incantation: String?
    let effect: String
    let canBeVerbal: Bool?
    let type: String
    let light: String
    let creator: String?
    
    static func <(lhs: Spell, rhs: Spell) -> Bool {
        return lhs.name < rhs.name
    }
}

class SpellModel: ObservableObject {
    @Published var spells: [Spell] = []
    func fetch() {
        guard let url = URL(string: "https://wizard-world-api.herokuapp.com/Spells") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let spells = try JSONDecoder().decode([Spell].self, from: data).sorted()
                DispatchQueue.main.async {
                    self.spells = spells
                }
            } catch {
                print(error)
            }
        } 
        task.resume()
    }
}
