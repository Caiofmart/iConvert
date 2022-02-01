//
//  ContentView.swift
//  iConvert
//
//  Created by Caio Feitoza Martins on 17/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var input = ""
    @State private var tempFrom = 0
    @State private var tempTo = 1
    let tempOptions = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var output: Double{
        let inputTemp = Double(input) ?? 0
        var inputConvert = 0.0
        var outputConvert = 0.0
        let from = tempOptions[tempFrom]
        let to = tempOptions[tempTo]
        
        if(from == tempOptions[1]) {
            inputConvert = (inputTemp - 32) * (5 / 9)
        }
        else if(from == tempOptions[2]) {
            inputConvert = inputTemp - 273.15
        }
        else{
            inputConvert = inputTemp
        }
        
        if(to == tempOptions[1]) {
            outputConvert = 1.8 * inputConvert + 32
        }
        
        else if(to == tempOptions[2]) {
            outputConvert = inputConvert + 273.15
        }
        
        else{
            outputConvert = inputConvert
        }
        
        return outputConvert
    }
    
        var body: some View {
                NavigationView{
                    Form {
                        Section {
                            TextField("Input", text: $input)
                                .keyboardType(.decimalPad)
                        }
                        
                    Section(header: Text("From")){
                        Picker("From", selection: $tempFrom){
                            ForEach(0 ..< tempOptions.count) {
                                Text("\(self.tempOptions[$0])")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("To")){
                        Picker("To", selection: $tempTo){
                            ForEach(0 ..< tempOptions.count) {
                                Text("\(self.tempOptions[$0])")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                        Section(header: Text("Output")) {
                            Text("\(output, specifier: "%.1f") degrees")
                }
            }
                .navigationTitle("iConvert")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
