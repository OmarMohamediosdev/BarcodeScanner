//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Omar Mohamed on 18/08/2024.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var scannerViewModel = BarcodeScannerViewModel()
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    ScannerView(scannedCode: $scannerViewModel.scannedCode, alertItem: $scannerViewModel.alertItem)
                        .frame(width: nil, height: 300) // .infinity returns error
                    
                    Spacer()
                        .frame(height: 60)
                    
                    Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                        .fontWeight(.bold)
                        .padding()
                    
                    Text(scannerViewModel.statusText)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(scannerViewModel.statusTextColor)
                        .padding()
                }
                .navigationTitle("Barcode Scanner")
                .alert(item: $scannerViewModel.alertItem) { alertItem in
                    Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.DismissButton)
                }
            }
            
        }
    }
}

#Preview {
    BarcodeScannerView()
        
}
