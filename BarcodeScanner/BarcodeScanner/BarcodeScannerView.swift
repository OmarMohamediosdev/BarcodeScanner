//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Omar Mohamed on 18/08/2024.
//

import SwiftUI

struct BarcodeScannerView: View {
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
//                    Rectangle()
//                        .frame(width: .infinity, height: 300)
                    
                    BarcodeScanner()
                    
                    Spacer()
                        .frame(height: 60)
                    
                    Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                        .fontWeight(.bold)
                        .padding()
                    
                    Text("Not Yet Scanned")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(.red))
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
