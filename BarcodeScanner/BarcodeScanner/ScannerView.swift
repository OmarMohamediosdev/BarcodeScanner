//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Omar Mohamed on 09/09/2024.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> Scanner {
        Scanner(scannerdelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: Scanner, context: Context) {
        
    }
}

#Preview {
    ScannerView()
}
