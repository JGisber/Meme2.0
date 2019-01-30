//
//  TextFormatting.swift
//  Meme2.0App
//
//  Created by Josue Gisber on 1/29/19.
//  Copyright © 2019 Mpixel Design & Development. All rights reserved.
//

import UIKit

class TextFormatting: UIViewController, UITextFieldDelegate{
	
	let textAttributes: [NSAttributedString.Key: Any] = [
		.strokeWidth: -3.5,
		.strokeColor: UIColor.black,
		.foregroundColor: UIColor.white,
		.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!
	]
	
	let paragraphStyle = NSMutableParagraphStyle()
	
	// MARK: - Format Font text for the textfield
	
	func setUpText(_ text: UITextField, defaultValue: String) {
		text.defaultTextAttributes = textAttributes
		text.delegate = self
		text.text = defaultValue
		text.textAlignment = .center
		
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
	func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
		return true
	}
	
	// MARK: - Erase default text on tap
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		textField.text = nil
	}
	
	// MARK: - Allow editing textfield
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		return true
	}
	
	
}
