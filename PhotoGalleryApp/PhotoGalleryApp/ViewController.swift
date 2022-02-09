//
//  ViewController.swift
//  PhotoGalleryApp
//
//  Created by dev jin on 2022/02/09.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {

    var fetchResults: PHFetchResult<PHAsset>?
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "Photo Gallery App"
        
        makeNavigationItem()
     
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 1) / 2 , height: 200)
        
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        
        photoCollectionView.collectionViewLayout = layout
        
        photoCollectionView.dataSource = self
     
    }
    
    func makeNavigationItem() {
        let photoItem = UIBarButtonItem(image: UIImage(systemName: "photo.on.rectangle"), style: .done, target: self, action: #selector(checkPermission))
        
        photoItem.tintColor = .black.withAlphaComponent(0.7)
        
        self.navigationItem.rightBarButtonItem = photoItem
        
        let refreshItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .done, target: self, action: #selector(refresh))
        
        refreshItem.tintColor = .black.withAlphaComponent(0.7)
        
        self.navigationItem.leftBarButtonItem = refreshItem
    }
    
    // 심사 통과를 위해서는 권한체크가 꼭 필요하다 !!!!!!
    @objc func checkPermission() {
        if PHPhotoLibrary.authorizationStatus() == .authorized || PHPhotoLibrary.authorizationStatus() == .limited {
            
            // 메인쓰레드에서
            DispatchQueue.main.async {
                self.showGallery()
            }
        } else if PHPhotoLibrary.authorizationStatus() == .denied {
           
            DispatchQueue.main.async {
                self.showAuthorizationDeniedAlert()
            }
            // 안물어봤을때
        } else if PHPhotoLibrary.authorizationStatus() == .notDetermined {
            PHPhotoLibrary.requestAuthorization { status in
            
                self.checkPermission()
               
            }
        }
    }
    
    func showAuthorizationDeniedAlert() {
        let alert = UIAlertController(title: "포토라이브러리 접근 권한을 활성화해주세요.", message: nil, preferredStyle: .alert)
        
        // 알림창 띄우기
        alert.addAction(UIAlertAction(title: "닫기", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "설정으로 가기", style: .default, handler: {
                action in
            
            guard let url = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            // 내 앱에대한 설정으로 가기
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showGallery() {
        let library = PHPhotoLibrary.shared()
        
        // 설정 .
        var configuration = PHPickerConfiguration(photoLibrary: library)
        configuration.selectionLimit = 10 // 0은 무제한
        
        // 시스템에서 제공해주는 포토라이브러리 ( PHPicker )
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        
        present(picker, animated: true)
 
        
    }

    @objc func refresh() {
        self.photoCollectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.fetchResults?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        if let asset = self.fetchResults?[indexPath.row] {
            cell.loadImage(asset: asset)
        }
        
        return cell
    }
    
}

extension ViewController: PHPickerViewControllerDelegate {
  
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        //results.map( \.assetIdentifier)
        let identifiers = results.map {
            $0.assetIdentifier ?? ""
        }
        
        self.fetchResults = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
    
        self.photoCollectionView.reloadData()
    
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
