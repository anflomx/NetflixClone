//
//  TitlePreviewViewController.swift
//  Netflix Clone
//
//  Created by Antonio Flores on 11/03/24.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
    private let webView: WKWebView = {
        let webview = WKWebView()
        return webview
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)
        view.addSubview(downloadButton)
        configureConstraints()
    }
    
    func configureConstraints() {
        webView.anchor(top: view.topAnchor, paddingTop: 50, left: view.leftAnchor, right: view.rightAnchor, height: 300)
        titleLabel.anchor(top: webView.bottomAnchor, paddingTop: 20, left: view.leftAnchor, paddingLeft: 20)
        overviewLabel.anchor(top: titleLabel.bottomAnchor, paddingTop: 15, left: view.leftAnchor, paddingLeft: 20, right: view.rightAnchor, paddingRight: 20)
        downloadButton.anchor(top: overviewLabel.bottomAnchor, paddingTop: 25, width: 140, height: 40, centerX: view.centerXAnchor)
    }
    
    func configure(with model: TitlePreviewViewModel) {
        titleLabel.text = model.title
        overviewLabel.text = model.titleOverview
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {
            return
        }
        webView.load(URLRequest(url: url))
    }
}
