import SwiftUI

struct SpellsDetailView: View {
    var spell: Spell
    var body: some View {
        VStack(spacing: 20){
        Text("Name: \(spell.name)")
        Text("Incantation: \(spell.incantation ?? "N/A")")
        Text("Effect: \(spell.effect)")
        Text("Type: \(spell.type)")
        Text("Light: \(spell.light)")
        Text("Creator: \(spell.creator ?? "N/A")")
        }
        .padding()
    }
}

/*struct SpellsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SpellsDetailView()
    }
}*/
