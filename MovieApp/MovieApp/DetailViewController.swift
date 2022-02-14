//
//  DetailViewController.swift
//  MovieApp
//
//  Created by dev jin on 2022/02/10.
//

import UIKit
import AVKit

class DetailViewController: UIViewController {

    var movieResult: MovieResult?
    
    var player: AVPlayer?
    
    @IBOutlet weak var movieContainer: UIView!
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movieResult?.trackName
        descriptionLabel.text = movieResult?.longDescription
        
        // 디바이스크기까지는 확인을 못함.
//        if let hasUrl = movieResult?.previewUrl {
//            makePlayerAndPlay(urlString: hasUrl)
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let hasUrl = movieResult?.previewUrl {
            makePlayerAndPlay(urlString: hasUrl)
        }
    }
    
    
    func makePlayerAndPlay(urlString: String) {
        
        if let hasUrl = URL(string: urlString) {
            self.player = AVPlayer(url: hasUrl)
            let playerLayer = AVPlayerLayer(player: player)
            
            // playerLayer. > layer
            movieContainer.layer.addSublayer(playerLayer)
            
            playerLayer.frame = movieContainer.bounds
            
            // 재생
            self.player?.play()
            
        }
       
    }
    @IBAction func play(_ sender: Any) {
        self.player?.play()
    }
    
    @IBAction func stop(_ sender: Any) {
        self.player?.pause()
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
