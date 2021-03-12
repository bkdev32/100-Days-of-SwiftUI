//
//  ContentView.swift
//  WeConvert
//
//  Created by Burhan Kaynak on 24/02/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput = ""
    @State private var inputValue = 2
    @State private var outputValue = 2
    let units = ["m", "km", "ft", "yd", "mi"]
    
    var output: String {
        let n = NumberFormatter()
        n.maximumFractionDigits = 2
        let m = MeasurementFormatter()
        m.unitOptions = .providedUnit
        m.unitStyle = .short
        m.numberFormatter = n
        
        guard let strToDouble = Double(userInput) else { return "0.00" }
        var input = Measurement(value: strToDouble, unit: UnitLength.meters)
        
        switch units[inputValue] {
        case "m":
            input = Measurement(value: strToDouble, unit: UnitLength.meters)
        case "km":
            input = Measurement(value: strToDouble, unit: UnitLength.kilometers)
        case "ft":
            input = Measurement(value: strToDouble, unit: UnitLength.feet)
        case "yd":
            input = Measurement(value: strToDouble, unit: UnitLength.yards)
        case "mi":
            input = Measurement(value: strToDouble, unit: UnitLength.miles)
        default:
            input = Measurement(value: strToDouble, unit: UnitLength.meters)
        }
        
        switch units[outputValue] {
        case "m":
            input.convert(to: .meters)
        case "km":
            input.convert(to: .kilometers)
        case "ft":
            input.convert(to: .feet)
        case "yd":
            input.convert(to: .yards)
        case "mi":
            input.convert(to: .miles)
        default:
            input.convert(to: .meters)
        }
        
        let result = m.string(from: input)
        return result
    }
  
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input Unit:")) {
                    TextField("Enter amount", text: $userInput)
                    
                    Picker("Picker", selection: $inputValue) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Output Unit")) {
                    Picker("Picker", selection: $outputValue) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    Text("\(output)")
                }
            }
            .navigationTitle("WeConvert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
