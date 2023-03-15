import SwiftUI

struct Character: Codable, Comparable {
    let id: UUID
    let name: String
    let species: String
    let gender: String
    let house: String
    let dateOfBirth: String?
    let wizard: Bool
    let ancestry: String
    let eyeColour: String
    let hairColour: String
    let patronus: String
    let hogwartsStudent: Bool
    let actor: String
    let alive: Bool
    let image: String    
    
    static func <(lhs: Character, rhs: Character) -> Bool {
        return lhs.name < rhs.name
    }
}

class CharacterModel: ObservableObject {
    @Published var characters: [Character] = []
    func fetch() {
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let characters = try JSONDecoder().decode([Character].self, from: data).sorted()
                DispatchQueue.main.async {
                    self.characters = characters
                }
            } catch {
                print(error)
            }
        } 
        task.resume()
    }
}
