//
//  BarcodeScanner.swift
//  BarcodeScanner
//
//  Created by Omar Mohamed on 18/08/2024.
//

import SwiftUI
import AVFoundation

struct BarcodeScanner: View {
    @State private var captureSession: AVCaptureSession?
    @State private var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    var body: some View {
        ZStack {
                VideoCaptureView(captureSession: $captureSession,
                                 videoPreviewLayer: $videoPreviewLayer)
                BarcodeOverlay(captureSession: $captureSession)
            }
            .onAppear(perform: startSession)
    }
    
    private func startSession() {
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer?.videoGravity = .resizeAspectFill
            videoPreviewLayer?.frame = UIScreen.main.bounds
            
            captureSession?.startRunning()
        } catch {
            print(error)
        }
    }
}

#Preview {
    BarcodeScanner()
}
