//
//  CupcakeView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/6.
//

import SwiftUI
import Network

struct MyAlert {
    var message = ""
    var isShowing = false
    
    mutating func enableAlert(with msg: String){
        isShowing = true
        self.message = msg
    }
}
struct CheckoutView: View {
    @ObservedObject var order: Order
    @State private var myAlert: MyAlert = MyAlert()
    @State private var isLoading = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                        image.resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 233)
                    Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                        .font(.title)
                    if isLoading {
                        ProgressView()
                    }else {
                        Button("Place Order") {
                            Task {
                                await placeOrder()
                            }
                        }
                        .padding()
                    }
                }
            }
            .alert("Thank you", isPresented: $myAlert.isShowing) {
                Button("Ok"){}
            } message: {
                Text(myAlert.message)
            }
            .navigationTitle("Check out")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        isLoading = true
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            isLoading = false
            myAlert.enableAlert(with: "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!")
        } catch {
            isLoading = false
            let mError = error as? URLError
            if let mError = mError {
                var message = ""
                switch (mError.code) {
                case .notConnectedToInternet:
                    message = "you're not connected to internet"
                case .badServerResponse:
                    message = "hey, not your fault, please rety later"
                case .cannotFindHost, .badURL:
                    message = "an error occurred"
                default:
                    let key = mError.userInfo
                        .keys.first(where: {$0 == "NSLocalizedDescription"})!
                   message = mError.userInfo[key]! as! String
                }
                if(!message.isEmpty) {
                    myAlert.enableAlert(with: message)
                }
            }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
