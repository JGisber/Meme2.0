//
//  MemeCollectionView.swift
//  Meme2.0App
//
//  Created by Josue Gisber on 1/29/19.
//  Copyright © 2019 Mpixel Design & Development. All rights reserved.
//

import UIKit
import Foundation

class MemeCollectionCollectionViewController: UICollectionViewController {
	
	@IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
	
	var memes: [MemeStructure]!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let space:CGFloat = 3.0
		let dimension = (view.frame.size.width - (2 * space)) / 3.0
		
		flowLayout.minimumInteritemSpacing = space
		flowLayout.minimumLineSpacing = space
		flowLayout.itemSize = CGSize(width: dimension, height: dimension)
	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		memes = appDelegate.memes
		self.collectionView?.reloadData()
	}
	
	@IBAction func addMeme(_ sender: Any) {
		let editMeme = self.storyboard!.instantiateViewController(withIdentifier: "MemeEditorViewController")
		self.navigationController!.pushViewController(editMeme, animated: true)
	}
	
	// MARK: UICollectionViewDataSource
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.memes.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
		let meme = self.memes[(indexPath as NSIndexPath).row]
		cell.imageView!.image = meme.memedImage
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let detailController = self.storyboard?.instantiateViewController(withIdentifier: "DetailMemeViewController") as! MemeDetailViewController
		let meme = self.memes[(indexPath as NSIndexPath).row]
		detailController.image = meme.memedImage
		self.navigationController!.pushViewController(detailController, animated: true)
	}
}
