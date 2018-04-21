//
//  ViewController.swift
//  screenShot
//
//  Created by Tomoyuki Hayakawa on 2018/04/20.
//  Copyright © 2018年 Tomoyuki Hayakawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveBtn(_ sender: Any) {
        // (x: x座標の開始位置, y: y座標の開始位置（ステータスバーの高さを考慮），width: imageViewの幅, height: imageViewの高さ)
        let size: CGSize = CGSize(width: imageView.frame.size.width, height: imageView.frame.size.height)
        // 切り取り位置，サイズの指定　画質の設定
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    
        let context = UIGraphicsGetCurrentContext()!
    
        // アフィン変換で切り取り位置を平行移動させて適用
        let affineMoveToTop = CGAffineTransform(translationX: 0, y: -20)
        context.concatenate(affineMoveToTop)
        
        // 対象のview内の描画をcontextに複写
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        // UIImageに変換
        let capture = UIGraphicsGetImageFromCurrentImageContext()
        // コンテキストを閉じる
        UIGraphicsEndImageContext()
        // フォトライブラリに保存
        UIImageWriteToSavedPhotosAlbum(capture!, nil, nil, nil)
    }
    
}

