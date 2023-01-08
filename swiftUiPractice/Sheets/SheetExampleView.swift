//
//  SheetExampleView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/1.
//

import SwiftUI


struct SecondView : View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            Text("Select")
                .font(.title)
            HStack {
                Image(systemName: "star")
                    .padding()
                Image(systemName: "bell")
                    .padding()
                Image(systemName: "globe")
                    .padding()
                Image(systemName: "house")
                    .padding()
            }.padding()
            //            .toolbar {
            //                ToolbarItem(placement: .navigationBarTrailing) {
            //                    Image(systemName: "checkmark")
            //                        .renderingMode(.original)
            //                        .onTapGesture {
            //                            dismiss()
            //                        }
            //                }
            //                ToolbarItem(placement: .navigationBarLeading) {
            //                    Image(systemName: "xmark")
            //                        .renderingMode(.template)
            //                        .foregroundColor(.accentColor)
            //                        .onTapGesture {
            //                            dismiss()
            //                        }
            //                }
            //            }
        }
        
    }
}
struct SheetExampleView: View {
    @State var isSheetShowing = false
    
    
    var body: some View {
        NavigationStack {
            Button("Show Sheet ") {
                isSheetShowing.toggle()
            }
            .buttonStyle(.borderedProminent)
            .sheet(isPresented: $isSheetShowing,
                   onDismiss: {isSheetShowing = false}) {
                SecondView()
                    .presentationDetents([.fraction(0.2)])
            }
        }
        
    }
}


struct SheetExampleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SheetExampleView()
        }
    }
}

