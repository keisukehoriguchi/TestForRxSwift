//
//  RxWKWebViewController.swift
//  RxSwiftVersion2
//
//  Created by Keisuke Horiguchi on 2021/07/06.
//

import Foundation
import WebKit
import RxSwift
import RxCocoa
import RxOptional

class RxWKWebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var progressView: UIProgressView!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }
    
    private func setupWebView() {
        let loadingObserbavle = webView.rx.observe(Bool.self, "loading")
            .filterNil()
            .share()
        
        loadingObserbavle
            .map { return !$0 }
            .bind(to: progressView.rx.isHidden)
            .disposed(by: disposeBag)
        
        loadingObserbavle
            .bind(to: UIApplication.shared.rx.isNetworkActivityIndicatorVisible)
            .disposed(by: disposeBag)
        
        loadingObserbavle
            .map { [weak self] _ in
                return self?.webView.title
            }
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)
        
        webView.rx.observe(Double.self, "estimatedProgress")
            .filterNil()
            .map { return Float($0) }
            .bind(to: progressView.rx.progress)
            .disposed(by: disposeBag)
        
        let url = URL(string: "https://www.google.com/")
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
    }
    
}
