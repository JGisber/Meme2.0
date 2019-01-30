//
//  MemeTableView.swift
//  Meme2.0App
//
//  Created by Josue Gisber on 1/29/19.
//  Copyright © 2019 Mpixel Design & Development. All rights reserved.
//

import Foundation
import UIKit

class MemeTableViewController: UITableViewController {
	
	var memes: [MemeStructure]!
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		memes = appDelegate.memes
		self.tableView.reloadData()
	}
	
	@IBAction func newMeme(_ sender: Any) {
		let editMeme = self.storyboard!.instantiateViewController(withIdentifier: "MemeEditorView")
		self.navigationController!.pushViewController(editMeme, animated: true)
	}
	
	// MARK: - Table view data source
	
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.memes.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! MemeTableViewCell
		let meme = self.memes[(indexPath as NSIndexPath).row]
		cell.setUpCell(meme)
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let detailController = self.storyboard?.instantiateViewController(withIdentifier: "detailMemeViewController") as! MemeDetailViewController
		let meme = self.memes[(indexPath as NSIndexPath).row]
		detailController.image = meme.memedImage
		self.navigationController!.pushViewController(detailController, animated: true)
	}
	
	
}
