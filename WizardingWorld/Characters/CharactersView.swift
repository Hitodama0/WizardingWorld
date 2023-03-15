import SwiftUI

struct CharactersView: View {
     @State private var showGrid = true
    var body: some View {
        NavigationView{
            Group {
                if showGrid {
                    CharactersGridView()
                        .tabItem { 
                            Label("Characters", systemImage: "person")
                            Text("Characters")
                        }
                        .transition(.scale)
                } else {
                    CharactersListView()
                        
                        .transition(.slide)
                }
            }
            .toolbar {
                Button {
                    showGrid.toggle()
                } label: {
                    if showGrid {
                        Image(systemName: "list.triangle")
                    }
                    else {
                        Image(systemName: "square.grid.2x2")
                    }
                }
            }
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
