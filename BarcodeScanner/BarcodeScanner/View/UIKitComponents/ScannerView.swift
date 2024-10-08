//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Omar Mohamed on 09/09/2024.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
}

final class Coordinator: NSObject, ScannerDelegate {
    private let scannerView: ScannerView
    
    init(scannerView: ScannerView) {
        self.scannerView = scannerView
    }
    
    func didFind(barcode: String) {
        scannerView.scannedCode = barcode
    }
    
    func didSurface(error: CameraError) {
        switch error {
        case .invalidDeviceIput:
            scannerView.alertItem = AlertContexts.invalidDeviceInput
            
        case .invalidScannedValue:
            scannerView.alertItem = AlertContexts.invalidScanType
        }
    }
}
