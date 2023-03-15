import SwiftUI

import SwiftUI

struct Houses: Codable, Comparable, Identifiable {
    let id: UUID
    let name: String
    let houseColours: String
    let founder: String
    let animal: String
    let element: String
    let heads: [Head]
    let traits: [Trait]
    let ghost: String
    let commonRoom: String
    static func <(lhs: Houses, rhs: Houses) -> Bool {
        return lhs.name < rhs.name
    }
}

struct Head: Codable, Equatable, Identifiable {
    let id: UUID
    let firstName: String
    let lastName: String
}

struct Trait: Codable, Equatable, Identifiable {
    let id: UUID
    let name: String
}

class HousesModel: ObservableObject {
    @Published var houses: [Houses] = []
    func fetch() {
        guard let url = URL(string: "https://wizard-world-api.herokuapp.com/Houses") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let houses = try JSONDecoder().decode([Houses].self, from: data).sorted()
                DispatchQueue.main.async {
                    self.houses = houses
                }
            } catch {
                print(error)
            }
        } 
        task.resume()
    }
}

