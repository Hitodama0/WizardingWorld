import SwiftUI

struct ElixirDetailView: View {
    let elixir: Elixir
    var body: some View {
        VStack(spacing: 20){
            Text("Name: \(elixir.name)")
            Text("Effect: \(elixir.effect ?? "N/A")")
            Text("Side effects: \(elixir.sideEffects ?? "N/A")")
            Text("Characteristics: \(elixir.characteristics ?? "N/A")")
            Text("Time: \(elixir.time ?? "N/A")")
            Text("Difficulty: \(elixir.difficulty)")
            
            VStack(alignment: .leading) {
                Text("Ingredients:")
                ForEach(elixir.ingredients) { ingredient in Text(ingredient.name)}
            }
            VStack {
                Text("Inventors:")
                ForEach(elixir.inventors) { inventor in Text("\(inventor.firstName ?? "Unknown") \(inventor.lastName)")
                }
            }
            Text("Manufacturer: \(elixir.manufacturer ?? "Unknown")")
        }
        .padding()
    }
}

/*struct ElixirDetailView_Previews: PreviewProvider {
 static var previews: some View {
 ElixirDetailView(elixir: Elixir)
 }
 }*/
