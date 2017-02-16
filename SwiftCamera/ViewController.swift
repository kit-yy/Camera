//
//  ViewController.swift
//  SwiftCamera
//
//  Created by Yasuaki K on 2017/02/16.
//  Copyright © 2017年 Yasuaki Kitaoka. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    @IBOutlet weak var backImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func camera(_ sender: Any) {
        
        let souceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.camera
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            let cameraPicker = UIImagePickerController()
            
            cameraPicker.sourceType = souceType
            cameraPicker.delegate = self
            
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
        
    }

    @IBAction func album(_ sender: Any) {
        
        let souceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            let cameraPicker = UIImagePickerController()
            
            cameraPicker.sourceType = souceType
            cameraPicker.delegate = self
            
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            backImageView.image = pickedImage
            
            UIImageWriteToSavedPhotosAlbum(pickedImage, self, nil, nil)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
}

