//
//  Scanner.swift
//  BarcodeScanner
//
//  Created by Omar Mohamed on 19/08/2024.
//

import UIKit
import AVFoundation

enum CameraError: String {
    case invalidDeviceIput = "Something is wrong with the camera"
    case invalidScannedValue = "Barcode is invalid"
}

protocol ScannerDelegate: AnyObject {
    func didFind(barcode: String)
    func didSurface(error: CameraError)
}

final class Scanner: UIViewController {
    let captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer?
    weak var scannerdelegate: ScannerDelegate?
    
    init(scannerdelegate: ScannerDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.scannerdelegate = scannerdelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCaptureSession()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let previewLayer = previewLayer else {
            scannerdelegate?.didSurface(error: .invalidDeviceIput)
            return
        }
        previewLayer.frame = view.layer.bounds
    }
    
    private func setupCaptureSession() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { 
            scannerdelegate?.didSurface(error: .invalidDeviceIput)
            return
        }
        let videoInput: AVCaptureDeviceInput
        
        do {
            try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            scannerdelegate?.didSurface(error: .invalidDeviceIput)
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            scannerdelegate?.didSurface(error: .invalidDeviceIput)
            return
        }
        
        let metaDataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metaDataOutput) {
            captureSession.addOutput(metaDataOutput)
            metaDataOutput.setMetadataObjectsDelegate(self, queue: .main)
            metaDataOutput.metadataObjectTypes = [.ean8, .ean13]
        } else {
            scannerdelegate?.didSurface(error: .invalidDeviceIput)
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer!.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer!)
        
        captureSession.startRunning()
    }
}

extension Scanner: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first else {
            scannerdelegate?.didSurface(error: .invalidScannedValue)
            return
        }
        guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else {
            scannerdelegate?.didSurface(error: .invalidScannedValue)
            return
        }
        guard let barcode = machineReadableObject.stringValue else {
            scannerdelegate?.didSurface(error: .invalidScannedValue)
            return
        }
        
        scannerdelegate?.didFind(barcode: barcode)
    }
}
