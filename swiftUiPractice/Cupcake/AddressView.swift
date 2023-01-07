//
//  AddressView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/6.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $order.checkout.name)
                    TextField("Street Address", text: $order.checkout.streetAddress)
                    TextField("City", text: $order.checkout.city)
                    TextField("Zip", text: $order.checkout.zip)
                }
                Section {
                    NavigationLink {
                        CheckoutView(order: order)
                    } label: {
                        Text("Check out")
                    }
                }
                .disabled(!order.checkout.hasValidAddress())
            }
            .navigationTitle("Delivery")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
