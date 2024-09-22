//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Omar Mohamed on 18/08/2024.
//

import SwiftUI
import VisionKit

struct AlertItem :Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let DismissButton: Alert.Button
}

struct AlertContexts {
    static let invalidDeviceInput = AlertItem(title: "Invalid device input",
                                       message: "Something is wrong with the camera",
                                       DismissButton: .default(Text("Ok")))
    
    static let invalidScanType = AlertItem(title: "Invalid scan type",
                                       message: "Barcode is invalid",
                                       DismissButton: .default(Text("Ok")))
}

struct BarcodeScannerView: View {
    @State private var scannedCode = ""
    @State private var alertItem: AlertItem?
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    ScannerView(scannedCode: $scannedCode, alertItem: $alertItem)
                        .frame(width: nil, height: 300) // .infinity returns error
                    
                    Spacer()
                        .frame(height: 60)
                    
                    Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                        .fontWeight(.bold)
                        .padding()
                    
                    Text(scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(scannedCode.isEmpty ? .red : .green)
                        .padding()
                }
                .navigationTitle("Barcode Scanner")
                .alert(item: $alertItem) { alertItem in
                    Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.DismissButton)
                }
            }
            
        }
    }
}

#Preview {
    BarcodeScannerView()
        
}
