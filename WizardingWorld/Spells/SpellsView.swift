import SwiftUI

struct SpellsView: View {
    @StateObject var spellModel = SpellModel()
    var body: some View {
        NavigationView{
        List {
            ForEach(spellModel.spells, id: \.id) {
                spell in NavigationLink {
                    SpellsDetailView(spell: spell)
                } label: {
                    Text(spell.name)
                }
            }
        }
        .onAppear{
            spellModel.fetch()
        }
    }
    }
}

struct SpellsView_Previews: PreviewProvider {
    static var previews: some View {
        SpellsView()
    }
}
