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
                    Rectangle()
                        .frame(width: .infinity, height: 300)
                    
                    
//                    if DataScannerViewController.isSupported && DataScannerViewController.isAvailable {
//                        ZStack(alignment: .bottom) {
//                            DataScannerRepresentable(
//                                shouldStartScanning: $isShowingScanner,
//                                scannedText: $scannedText,
//                                dataToScanFor: [.barcode()]
//                            )
//                            
//                            Text(scannedText)
//                                .padding()
//                                .background(Color.white)
//                                .foregroundColor(.black)
//                        }
//                    } else if !DataScannerViewController.isSupported {
//                        Text("It looks like this device doesn't support the DataScannerViewController")
//                    } else {
//                        Text("It appears your camera may not be available")
//                    }
                    
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
