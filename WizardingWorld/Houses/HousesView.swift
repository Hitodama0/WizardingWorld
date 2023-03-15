import SwiftUI

struct HousesView: View {
    @StateObject var housesModel = HousesModel()
    var body: some View {
        NavigationView{
            List {
                ForEach(housesModel.houses, id: \.id) {
                    house in NavigationLink {
                        HousesDetailView(houses: house)
                    } label: {
                        Text(house.name)
                    }
                }
            }
            .onAppear{
                housesModel.fetch()
            }
        }
    }
}

/*struct HousesView_Previews: PreviewProvider {
 static var previews: some View {
 HousesView()
 }
 }*/
