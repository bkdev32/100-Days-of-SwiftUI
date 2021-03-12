//
//  ContentView.swift
//  WeSplit
//
//  Created by Burhan Kaynak on 23/02/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        return grandTotal
    }
    
    var totalPerPerson: Double {
        guard let peopleCount = Double(numberOfPeople) else { return 0 }
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                
                    TextField("Number of People", text: $numberOfPeople)
                        .keyboardType(.numberPad)
//                    Picker("Number of People", selection: $numberOfPeople) {
//                        ForEach(2 ..< 100 ) {
//                            Text("\($0) people")
//                        }
//                    }
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Text("Total amount: £\(grandTotal, specifier: "%.2f")")
                }
                Section(header: Text("Amount per person")) {
                    Text("£ \(totalPerPerson, specifier: "%.2f")")
                        .foregroundColor(tipPercentages[tipPercentage] == 0 ? .red : .black)
                    
                }
            }
            .navigationBarTitle("We Split")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
