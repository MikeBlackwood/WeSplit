//
//  ContentView.swift
//  WeSplit
//
//  Created by Mike Budei on 12/15/20.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    var perPerson: Double {
        let people = Double(numberOfPeople) ?? 1
        let percentage = Double(tipPercentages[tipPercentage])
        let amount = Double(checkAmount) ?? 0
        
        let totalAmount  = amount + ( amount * percentage / 100)
        
        let perPersona = totalAmount / people
        
        return perPersona
    }
    var total : Double {
        let amount = Double(checkAmount) ?? 0
        let tips = Double(tipPercentages[tipPercentage])
        let final = amount + (amount * tips / 100)
        return final
    }
    var body: some View {
        NavigationView{
            Form {
                
                Section {
                    TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                   
//                    Picker("Number of people", selection: $numberOfPeople)
//                    {
//                        ForEach(2 ..< 15){
//                            Text("\($0) people")
//                        }
//                    }
                    TextField("People in party", text : $numberOfPeople).keyboardType(.numberPad)
                }
                
                Section(header:  Text("Tip Percentage")){
                    Picker("Tip Percentage", selection: $tipPercentage, content: {
                        ForEach(0 ..< tipPercentages.count)
                        {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }).pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Total Amount for the diner")){
                    if(tipPercentages[tipPercentage] == 0)
                    {
                        Text("$\(total , specifier: "%.2f")")
                            .foregroundColor(Color.red)
                    }
                    else
                    {
                    Text("$\(total , specifier: "%.2f")")
                    }
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(perPerson, specifier: "%.2f")")
                }
                
            }
            .navigationBarTitle("WeSplit")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
