import SwiftUI

struct HousesDetailView: View {
    var houses: Houses
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("Name: \(houses.name)")
            Text("House Colors: \(houses.houseColours)")
            Text("Animal: \(houses.animal)")
            
            VStack{
                Text("House Traits: ")
                ForEach(houses.traits) {
                    trait in Text(trait.name)
                }
            }
            
            Text("Element: \(houses.element)")
            Text("Founder: \(houses.founder)")
            Text("Ghost: \(houses.ghost)")
            Text("Common Room: \(houses.commonRoom)")
            
            VStack {
                Text("House Heads:")
                ForEach(houses.heads) {
                    head in Text("\(head.firstName) \(head.lastName)")
                }
            }
        }
    }
}

/*struct HousesDetailView_Previews: PreviewProvider {
 static var previews: some View {
 HousesDetailView()
 }
 }*/
