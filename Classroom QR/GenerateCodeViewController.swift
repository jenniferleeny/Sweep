//
//  GenerateCodeViewController.swift
//  Classroom QR
//
//  Created by Josh Zhanson on 2/11/17.
//  Copyright © 2017 Josh Zhanson. All rights reserved.
//

import Foundation
import UIKit


class GenerateCodeViewController : UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func shareButton(sender: UIBarButtonItem) {
        
        displayShareSheet(shareContent: "Codes to email are attached!")
    }
    
    func displayShareSheet(shareContent:String) {
        
        let activityViewController = UIActivityViewController(activityItems: [shareContent], applicationActivities: nil)
        present(activityViewController, animated: true, completion: {})
    }
    
    func generateQRCode(from string : String) -> UIImage? {
    
        let data = string.data(using: String.Encoding.isoLatin1)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            
            // L-M-Q-H: how much of the code can be damaged and still read (low - high)
            filter.setValue("H", forKey: "inputCorrectionLevel")
            
            guard let qrCodeImage = filter.outputImage else { return nil }
            
            let scaleX = imageView.frame.size.width / qrCodeImage.extent.size.width
            let scaleY = imageView.frame.size.height / qrCodeImage.extent.size.height
            
            let transform = CGAffineTransform(scaleX: scaleX, y : scaleY)
            
            if let output = filter.outputImage?.applying(transform) {
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for student in persistData.classes[0].students {
//            let image = generateQRCode(from: student.name)
//            imageView.image = image
//        }
        let image = generateQRCode(from: "bart")
        imageView.image = image

        
    }
    
}
