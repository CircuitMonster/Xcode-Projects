//
//  ContentView.swift
//  Unit Converter
//
//  Created by Brian Ackley on 6/7/20.
//  Copyright © 2020 Petrol On Tap. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var unitAmount = ""
    @State private var inputLength = 2
    @State private var outputLength = 2
    
    let measurements = ["m", "km", "ft", "yd", "mi"]
    
    var outputAmount: Double {
        let startUnit = Double(unitAmount) ?? 0
        var finalValue = 0.0
        
        let meters = startUnit * 1000.0
        let kilometers = startUnit * 1.0
        let feet = startUnit * 3280.8
        let yard = startUnit * 1093.6
        let miles = startUnit * 0.6213
        
        while inputLength == 0 {
            if outputLength == 0 {
                finalValue = meters / 1000.0
            } else if outputLength == 1 {
                finalValue = kilometers / 1000.0
            } else if outputLength == 2 {
                finalValue = feet / 1000.0
            } else if outputLength == 3 {
                finalValue = yard / 1000.0
            } else if outputLength == 4 {
                finalValue = miles / 1000.0
            }
            break
        }
        while inputLength == 1 {
            if outputLength == 0 {
                finalValue = meters
            } else if outputLength == 1 {
                finalValue = kilometers
            } else if outputLength == 2 {
                finalValue = feet
            } else if outputLength == 3 {
                finalValue = yard
            } else if outputLength == 4 {
                finalValue = miles
            }
            break
        }
        while inputLength == 2 {
            if outputLength == 0 {
                finalValue = meters / 3280.8
            } else if outputLength == 1 {
                finalValue = kilometers / 3280.8
            } else if outputLength == 2 {
                finalValue = feet / 3280.8
            } else if outputLength == 3 {
                finalValue = yard / 3280.8
            } else if outputLength == 4 {
                finalValue = miles / 3280.8
            }
            break
        }
        while inputLength == 3 {
            if outputLength == 0 {
                finalValue = meters / 1093.6
            } else if outputLength == 1 {
                finalValue = kilometers / 1093.6
            } else if outputLength == 2 {
                finalValue = feet / 1093.6
            } else if outputLength == 3 {
                finalValue = yard / 1093.6
            } else if outputLength == 4 {
                finalValue = miles / 1093.6
            }
            break
        }
        while inputLength == 4 {
            if outputLength == 0 {
                finalValue = meters / 0.6213
            } else if outputLength == 1 {
                finalValue = kilometers / 0.6213
            } else if outputLength == 2 {
                finalValue = feet / 0.6213
            } else if outputLength == 3 {
                finalValue = yard / 0.6213
            } else if outputLength == 4 {
                finalValue = miles / 0.6213
            }
            break
        }
        
        return finalValue
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Unit Amount to Calculate", text: $unitAmount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Input Unit Type")) {
                    Picker("Input Unit Type", selection: $inputLength) {
                        ForEach(0 ..< measurements.count) {
                            Text("\(self.measurements[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output Unit Type")) {
                    Picker("Output Unit Type", selection: $outputLength) {
                        ForEach(0 ..< measurements.count) {
                            Text("\(self.measurements[$0])")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("\(outputAmount)")
                }
            }
            .navigationBarTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
