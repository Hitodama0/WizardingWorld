import SwiftUI

struct CharactersDetailView: View {
    var character: Character
    var body: some View {
        VStack(spacing: 20){
            AsyncImage(url: URL(string: character.image)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Text("There was an error loading the image.")
                } else {
                    Text("No photo available")
                }
            }
            .frame(width: 200, height: 200)
            
            Group {
                Text("Name: \(character.name)")
                Text("Gender: \(character.gender)")
                Text("Specie: \(character.species)")
                Text("Date of Birth: \(character.dateOfBirth ?? "N/A")")
                Text("Hair Color: \(character.hairColour)")
                Text("Eye Color: \(character.eyeColour)")
                Text("Ancestry: \(character.ancestry)")
            }
            
            Group {
                if character.wizard {
                    Text("Wizard 🪄")
                } else {
                    Text("Muggle")
                }
                
                Text("Patronus: \(character.patronus)")
                
                if character.alive {
                    Text("Alive!")
                } else {
                    Text("Dead 🧟")
                }
                
                Text("Actor: \(character.actor)")
            }
        }
    }
}

/*struct CharactersDetailView_Previews: PreviewProvider {
 static var previews: some View {
 CharactersDetailView()
 }
 }*/
