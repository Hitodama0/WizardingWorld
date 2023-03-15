//
//  ContentView.swift
//  WizardingWorld
//
//  Created by Biagio Ricci on 15/03/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            TabView{
                CharactersView()
                    .tabItem {
                        Label("Characters", systemImage: "person")
                        Text("Characters")
                    }
                ElixirsView()
                    .tabItem {
                        Label("Elixir", systemImage: "sun.min.fill")
                        Text("Elixir")
                    }
                SpellsView()
                    .tabItem {
                        Label("Spells", systemImage: "book.circle.fill")
                        Text("Spells")
                    }
                HousesView()
                    .tabItem {
                        Label("Houses", systemImage: "house")
                        Text("Houses")
                    }
            }
            .navigationTitle("Wizarding World")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
