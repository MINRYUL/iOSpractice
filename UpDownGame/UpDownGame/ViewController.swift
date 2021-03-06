//
//  ViewController.swift
//  UpDownGame
//
//  Created by 김민창 on 2021/03/13.
//

import UIKit

class ViewController: UIViewController {
    //Outlet은 UI Interface에 올라와있는 어떠한 값을 가져오고 싶거나 코드에서 활용하고 싶을때 활용
    
    var randomValue: Int = 0
    var tryCount: Int = 0
    @IBOutlet weak var slider: UISlider!    //스토리보드 위에 올려져있는 요소와 연결할 때 쓰는 어노테이션
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal) //stroyboard로 이미지를 바꿀 수 없을때 코드로 바꾸는 것이 가능하다.
        reset()
    }

    //인터페이스 빌더에 요소들이 이벤트를 받았을때 거기에 반응하기 위한 것.
    @IBAction func sliderValueChanged(_ sender: UISlider){  //이벤트에 반응하는 액션 어노테이션
        print(sender.value)
        sliderValueLabel.text = "\(Int(slider.value))"
    }
    
    func showAlert(message: String) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in self.reset() }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil) //present 화면에 올려주는 메서드.
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton){
        print(slider.value)
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount += 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        if randomValue == hitValue {
            print("YOU HIT!!")
            showAlert(message: "YOU HIT!!")
            reset()
        } else if tryCount >= 5 {
            print("YOU LOSE..")
            showAlert(message: "YOU LOSE..")
            reset()
        } else if randomValue > hitValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
        } else {
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton){
        print("touch up reset button")
        reset()
    }
    
    func reset() {
        print("reset")
        randomValue = Int.random(in: 0...30) //... -> 범위 연산자의 일종 A...B 폐쇄 범위 연산자 A..<B 반폐쇄연산자는 앞의 수 포함 뒤의 수를 포함하지 않는다.
                                             //A..., ...A, ..<A 단방향 범위 연산자 또한 3가지 있다.
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
        
    }
}

