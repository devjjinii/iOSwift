//
//  PhotoCell.swift
//  PhotoGalleryApp
//
//  Created by dev jin on 2022/02/09.
//

import Foundation
import UIKit
import Photos

class PhotoCell: UICollectionViewCell {
    
    func loadImage(asset: PHAsset) {
        
        let imageManager = PHImageManager()
        let scale = UIScreen.main.scale
        let imageSize = CGSize(width: 150 * scale, height: 150 * scale)
        
        // 고화질로 사진 
        let options = PHImageRequestOptions()
        options.deliveryMode = .opportunistic
        
        self.photoImageView.image = nil
        
        imageManager.requestImage(for: asset, targetSize: imageSize, contentMode: .aspectFill, options: options) { image, info in
//            if (info?[PHImageResultIsDegradedKey]as? Bool) == true {
//                // 저화질
//                self.photoImageView.image = image
//            } else {
//                // 고화질
//            }
            
            // 저화질 1번 고화질 1번
            self.photoImageView.image = image
        }
    }
    @IBOutlet weak var photoImageView: UIImageView! {
        didSet {
            photoImageView.contentMode = .scaleAspectFill
        }
    }
    
    
    
}
