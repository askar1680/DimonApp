//
//  ViewController.swift
//  DimanApp
//
//  Created by Аскар on 5/15/20.
//  Copyright © 2020 askar.ulubayev. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    private let playButton = UIButton(type: .system)
    private var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setViewConstraints()
        stylizeViews()
    }
    
    @objc private func playButtonTapped() {
        playSound()
    }
    
    func playSound() {
        player?.stop()
        let url = Bundle.main.url(forResource: "bumer_dimon", withExtension: "mp3")!
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
}

extension ViewController {
    private func addSubviews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(playButton)
    }
    
    private func setViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 64
        ).isActive = true
        stackView.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor,
            constant: 32
        ).isActive = true
        stackView.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -32
        ).isActive = true
        
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func stylizeViews() {
        view.backgroundColor = .white
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 16
        
        titleLabel.text = "Посвящается Димону..."
        titleLabel.textAlignment = .center
        
        imageView.image = UIImage(named: "bumer")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        
        playButton.setTitle("Play", for: .normal)
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
    }
}
