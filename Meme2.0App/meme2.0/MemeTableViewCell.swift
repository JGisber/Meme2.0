//
//  MemeTableViewCell.swift
//  Meme2.0App
//
//  Created by Josue Gisber on 1/29/19.
//  Copyright © 2019 Mpixel Design & Development. All rights reserved.
//

import UIKit

class MemeTableViewCell: UITableViewCell {
	
	@IBOutlet weak var tableViewCellImage: UIImageView!
	
	@IBOutlet weak var tableViewCellText: UITextField!
	
	func setUpCell(_ meme: MemeStructure) {
		tableViewCellImage.image = meme.memedImage
		tableViewCellText.text = meme.topText + " " + meme.bottomText
		tableViewCellText.isEnabled = false
	}
}
