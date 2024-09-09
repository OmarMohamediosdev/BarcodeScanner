//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Omar Mohamed on 18/08/2024.
//

import SwiftUI
import VisionKit

struct BarcodeScannerView: View {
    @State private var scannedCode = ""
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    ScannerView(scannedCode: $scannedCode)
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
            }
            
        }
    }
}

#Preview {
    BarcodeScannerView()
        
}
