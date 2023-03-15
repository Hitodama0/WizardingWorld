import SwiftUI

struct ElixirsView: View {
    @StateObject var elixirModel = ElixirModel()
    var body: some View {
        NavigationView{
            List {
                ForEach(elixirModel.elixirs, id: \.id) { elixir in NavigationLink {
                    ElixirDetailView(elixir: elixir)
                } label: {
                    Text(elixir.name)
                }
                }
            }
            .onAppear {
                elixirModel.fetch()
            }
        }
    }
}

struct ElixirsView_Previews: PreviewProvider {
    static var previews: some View {
        ElixirsView()
    }
}
