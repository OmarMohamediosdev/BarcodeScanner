//
//  BarcodeOverlay.swift
//  BarcodeScanner
//
//  Created by Omar Mohamed on 18/08/2024.
//

import SwiftUI
import AVFoundation

struct BarcodeOverlay: View {
    @Binding var captureSession: AVCaptureSession?
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 300)
                .overlay(
                    Text("Scan Barcode Here")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                )
                .background(Color.black.opacity(0.5))
                .cornerRadius(20)
                .onTapGesture {
                    DispatchQueue.global(qos: .background).async {
                        self.captureSession?.startRunning()
                    }
                }
                .onAppear {
                    self.captureSession?.stopRunning()
                }
        }
    }
}

//#Preview {
//    BarcodeOverlay()
//}
