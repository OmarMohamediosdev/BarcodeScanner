//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Omar Mohamed on 09/09/2024.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
}

final class Coordinator: NSObject, ScannerDelegate {
    func didFind(barcode: String) {
        print(barcode)
    }
    
    func didSurface(error: CameraError) {
        print(error.rawValue)
    }
}

#Preview {
    ScannerView()
}
