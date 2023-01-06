//
//  MyView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/6.
//

import SwiftUI


struct MyView: View {
  //  @State private var results = [Result]()
    @StateObject var order = Order()
    var body: some View {
        /*
//        List(results, id: \.trackId) { result in
//            VStack(alignment: .leading) {
//                Text(result.trackName)
//                    .font(.headline)
//                Text(result.collectionName)
//            }
//        }
//        .task {
//             await loadData()
//        }
//        VStack {
//            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
//                if let image = phase.image {
//                    image
//                        .resizable()
//                        .scaledToFit()
//                }else if phase.error != nil {
//                    Text("an error occurred, retry later")
//                        .multilineTextAlignment(.center)
//                } else {
//                    ProgressView()
//                }
//            }
//            .frame(width: 200, height: 200)
//
//        }
        */
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type",selection: $order.type) {
                        ForEach(Order.types, id: \.self) { type in
                            Text(type)
                        }
                    }
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
    
//    func loadData() async {
//        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
//            print("Invalid URL")
//            return
//        }
//        do {
//            let (data, _) = try await URLSession.shared
//                .data(from: url)
//            if let decodedResponse = try? JSONDecoder()
//                .decode(Response.self, from: data) {
//                results = decodedResponse.results
//            }
//        } catch {
//            print("Invalid data")
//        }
//    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
