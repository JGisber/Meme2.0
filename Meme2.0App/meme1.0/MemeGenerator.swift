//
//  MemeGenerator.swift
//  Meme2.0App
//
//  Created by Josue Gisber on 1/29/19.
//  Copyright © 2019 Mpixel Design & Development. All rights reserved.
//

import Foundation
import UIKit

extension MemeEditorViewController {
	
	
	// MARK: - Create Meme
	func createMemeImage() -> UIImage {
		
		// Hidvarhe toolbar
		topToolBar.isHidden = true
		bottomToolBar.isHidden = true
		
		UIGraphicsBeginImageContext(self.view.frame.size)
		view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
		
		let memedImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
		// show toolbar
		topToolBar.isHidden = false
		bottomToolBar.isHidden = false
		
		return memedImage!
	}
	
	func saveMeme() {
		let memeImage = MemeStructure(topText: topTextField.text!, bottomText: bottomTextField.text!, image: imageView.image!, memedImage: createMemeImage())
		savedMemes.append(memeImage)
		
	}
}
