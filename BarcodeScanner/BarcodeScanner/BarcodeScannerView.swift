//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Omar Mohamed on 18/08/2024.
//

import SwiftUI
import VisionKit

struct BarcodeScannerView: View {
//    @State var isShowingScanner = true
//    @State private var scannedText = ""
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    ScannerView()
                        .frame(width: .infinity, height: 300)
                    
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
