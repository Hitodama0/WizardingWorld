import SwiftUI

import SwiftUI

struct CharactersGridView: View {
    @StateObject var charactersModel = CharacterModel()
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(charactersModel.characters, id: \.id) {
                        character in NavigationLink {
                            CharactersDetailView(character: character)
                        } label: {
                            VStack{
                                
                                AsyncImage(url: URL(string: character.image)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                    } else if phase.error != nil {
                                        Text("There was an error loading the image.")
                                    } else {
                                        Text("No photo available")
                                            .foregroundColor(.pink)
                                    }
                                }
                                .frame(width: 200, height: 200)
                                
                                Text(character.name)
                                    .foregroundColor(.white)
                            }
                        }
                }
            }
            .onAppear{
                charactersModel.fetch()
            }
        }
    }
}

struct CharactersGridView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersGridView()
    }
}
