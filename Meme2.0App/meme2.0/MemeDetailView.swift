//
//  MemeDetailView.swift
//  Meme2.0App
//
//  Created by Josue Gisber on 1/29/19.
//  Copyright © 2019 Mpixel Design & Development. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
	var image: UIImage!
	@IBOutlet weak var detailImage: UIImageView!
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.detailImage!.image = self.image
		self.tabBarController?.tabBar.isHidden = true
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.tabBarController?.tabBar.isHidden = false
	}
}
