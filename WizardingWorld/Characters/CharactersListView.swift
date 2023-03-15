import SwiftUI

struct CharactersListView: View {
    @StateObject var charactersModel = CharacterModel()
    var body: some View {
            List {
                ForEach(charactersModel.characters, id: \.id) {
                    character in NavigationLink {
                        CharactersDetailView(character: character)
                    } label: {
                        Text(character.name)
                    }
                }
            }
            .onAppear{
                charactersModel.fetch()
            }
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView()
    }
}
