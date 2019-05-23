//
//  ArrangedSubviewViewController.swift
//  StackView
//
//  Created by Seungjun Lim on 23/05/2019.
//  Copyright © 2019 Seungjun Lim. All rights reserved.
//

import UIKit

class ArrangedSubViewsViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBAction func add(_ sender: Any) {
        let v = generateView()
        stackView.addArrangedSubview(v)
        // 스텍뷰에서는 요걸 사용해야합니다.
        // 파라미터로 전달된 뷰를 어레인지 마지막에 추가합니다.
        // 화면에 표시될때에는 오른쪽 또는 아랫쪽에 표시된다.
        
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }
    }
    
    @IBAction func insert(_ sender: Any) {
        let v = generateView()
        stackView.insertArrangedSubview(v, at: 0)
        // 특정위치에 뷰를 추가하는것.. 첫번째 위치에 뷰를 추가하도록 설정..
        
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }
    }
    
    @IBAction func remove(_ sender: Any) {
        guard stackView.arrangedSubviews.count > 0 else {
            return
        }
        let index = Int(arc4random_uniform(UInt32(stackView.arrangedSubviews.count)))
        let v = stackView.arrangedSubviews[index]
//        stackView.removeArrangedSubview(v)
//        // 랜덤으로 설정된 뷰를 삭제..
//
//
//        UIView.animate(withDuration: 0.3) {
//            self.stackView.layoutIfNeeded()
//        }
        
        UIView.animate(withDuration: 0.3, animations: {
            v.isHidden = true
        }, completion: { finished in
            self.stackView.removeArrangedSubview(v)
        })
        // 요 코드처럼 애니메이션 블록에서 isHidden 속성을 트루로 하고, 컴플리션 블록에서 리무브어레인지드 서브뷰 를 호출하거나, 리무브프롬 슈퍼뷰를 호출해야 한다..
        // 잠깐 숨겻다가 다시 보이려면 ishidden속성으로 충분하다...
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v = generateView()  //프레임을 설정해줘야 서브뷰에 추가되는 뷰는 좌표를 직접설정해 줘야 한다... 어레인지에 추가되는 뷰는 스택뷰가 관여를 한다..
        // 프레임 설정..
        v.frame = stackView.bounds // 스텍뷰와 동일한 프레임 설정...
        stackView.addSubview(v)
        
    }
}
    
    extension ArrangedSubViewsViewController {
        private func generateView() -> UIView {
            let v = UIView()
            
            let r = CGFloat(arc4random_uniform(256)) / 255
            let g = CGFloat(arc4random_uniform(256)) / 255
            let b = CGFloat(arc4random_uniform(256)) / 255
            v.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
            
            return v
        }
    }
    

