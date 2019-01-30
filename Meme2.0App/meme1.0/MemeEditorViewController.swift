//
//  ViewController.swift
//  Meme2.0App
//
//  Created by Josue Gisber on 1/29/19.
//  Copyright © 2019 Mpixel Design & Development. All rights reserved.
//

import UIKit

class MemeEditorViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	@IBOutlet weak var topToolBar: UIToolbar!
	@IBOutlet weak var bottomToolBar: UIToolbar!
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var cameraButton: UIBarButtonItem!
	@IBOutlet weak var topTextField: UITextField!
	@IBOutlet weak var bottomTextField: UITextField!
	
	var textFormatting = TextFormatting()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
		textFormatting.setUpText(topTextField, defaultValue: "TOP")
		textFormatting.setUpText(bottomTextField, defaultValue: "BOTTOM")
	}
	
	func pickAnImage(sourceType: UIImagePickerController.SourceType) {
		let imagePickerController = UIImagePickerController()
		imagePickerController.delegate = self
		imagePickerController.sourceType = sourceType
		present(imagePickerController, animated: true, completion: nil)
	}
	
	@IBAction func pickImageFromLibrary(_ sender: Any) {
		pickAnImage(sourceType: .photoLibrary)
	}
	
	
	@IBAction func pickImageFromCamera(_ sender: Any) {
		pickAnImage(sourceType: .camera)
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		guard let imageSelected = info[.originalImage] as? UIImage else {return}
		imageView.image = imageSelected
		dismiss(animated: true, completion: nil)
	}
	
	
	@IBAction func shareImage(_ sender: Any) {
		let shareMeme = createMemeImage()
		let activityController = UIActivityViewController(activityItems: [shareMeme], applicationActivities: nil)
		activityController.completionWithItemsHandler = {
			(activity, success, items, error) in if success {
				self.saveMeme()
				self.dismiss(animated: true, completion: nil)
			}
		}
		self.present(activityController, animated: true, completion: nil)
	}
	
	
	@IBAction func cancelTask(_ sender: Any) {
		
	}
}

