//
//  ViewController.swift
//  MyTask7App
//
//  Created by VERTEX24 on 2019/08/12.
//  Copyright © 2019 VERTEX24. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 問題の表示部分
    @IBOutlet weak var question1: UITextView!
    @IBOutlet weak var question2: UITextView!
    @IBOutlet weak var question3: UITextView!
    
    @IBOutlet weak var nameOfQuestion: UINavigationItem!
    @IBOutlet weak var stackView: UIStackView!
    
    // 問題の配列
    var questionList: [UIView] = []
    // 答えの配列
    let ans: [Int] = [1,3,2]
    // 現在のクイズの番号を管理する
    var questionNum: Int = 0
    // 結果の配列
    var result: [Bool] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // questionListにquestion1~3をいれる
        questionList.append(question1)
        questionList.append(question2)
        questionList.append(question3)
        // タイトルに問題番号を入れとく
        nameOfQuestion.title = "第\(questionNum + 1)問"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // タイトルに問題番号を入れとく
        nameOfQuestion.title = "第\(questionNum + 1)問"
    }
    
    // 正解をアラートを表示する
    func correntAlert(){
        // アラートの作成
        let alert = UIAlertController(title: "正解!!", message: nil, preferredStyle: .alert)
        // アラートのアクション(ボタン部分の定義)
        let close = UIAlertAction(title: "OK", style: .cancel) { (action: UIAlertAction) in
            // 全問題数が今の問題数目い未満のとき
            if self.questionList.count - 1 > self.questionNum  {
                
                // 結果の配列に正解を送る
                self.result.append(true)
                // 次の画面に遷移する
                self.next()
                
            }else{
                
                self.result.append(true)
                // 遷移処理
                self.performSegue(withIdentifier: "ToResultList", sender: nil)
                // 問題数や問題の合否をリセットする
                self.resetQuestion()
            }
        }
        // 作成したalertに閉じるボタンを追加
        alert.addAction(close)
        // アラートを表示
        present(alert, animated: true, completion: nil)
    }
    
    
    
    // 不正解をアラートを表示する
    func inCorrentAlert(){
        // アラートの作成
        let alert = UIAlertController(title: "不正解!!", message: nil, preferredStyle: .alert)
        // 次へアラートのアクション(ボタン部分の定義)
        let close = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
            if self.questionList.count - 1 > self.questionNum  {
                
                // 結果の配列に不正解を入れる
                self.result.append(false)
                // 次の画面に遷移する
                self.next()
                
            }else{
                self.result.append(false)
                // 遷移処理
                self.performSegue(withIdentifier: "ToResultList", sender: nil)
                self.resetQuestion()
            }
        }
        // もう一度アラートのアクション(ボタン部分の定義)
        let oneMore = UIAlertAction(title: "もう一度", style: .default, handler: nil)
        
        // 作成したalertに閉じるボタンを追加
        alert.addAction(oneMore)
        alert.addAction(close)
        // アラートを表示
        present(alert, animated: true, completion: nil)
    }
    
    // 次の画面に行く関数
    func next() {
        // 前の画面を隠す
        questionList[questionNum].isHidden = true
        // ボタンを一つ減らす
        hiddenButton()
        // 問題番号を増やす
        questionNum += 1
        // タイトルを変える
        nameOfQuestion.title = "第\(questionNum + 1)問"
    }
    
    
    
    // 値を初期化するやつ
    func resetQuestion() {
        // 消した問題をすべて戻す
        for question in questionList {
            question.isHidden = false
        }
        // 消したボタンをすべて戻す
        for button in stackView.arrangedSubviews {
            button.isHidden = false
        }
        // 問題番号の初期化
        questionNum = 0
        // 問題合否のリセット
        result = []
        // タイトルを戻す
        nameOfQuestion.title = "問題へ"
    }
    
    // ボタンの選択肢を減らす関数
    func hiddenButton() {
        // (スタックの総ボタン数4個) ー (今の問題数目 ー 1) ー 1 = 消したいボタンの配列番号
        let num: Int = stackView.arrangedSubviews.count - questionNum - 1
        // その部分を消す
        stackView.arrangedSubviews[num].isHidden = true
    }
    
    // 画面遷移前の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ToResultList" ,let vc = segue.destination as? resultTableViewController else{
            return
        }
        vc.result = result
    }
    
    
    
    // 1ボタンを押されたとき
    @IBAction func button1(_ sender: UIButton) {
        if ans[questionNum] == 1 {
            // 正解のアラートを表示
            correntAlert()
            
        }else{
            // 不正解のアラートを表示
            inCorrentAlert()
            
        }
        
    }
    
    // 2ボタンを押されたとき
    @IBAction func button2(_ sender: UIButton) {
        if ans[questionNum] == 2 {
            correntAlert()
        }else{
            inCorrentAlert()
            
        }
    }
    
    // 3ボタンを押されたとき
    @IBAction func button3(_ sender: UIButton) {
        if ans[questionNum] == 3 {
            correntAlert()
        }else{
            inCorrentAlert()
            
        }
    }
    
    // 4ボタンを押されたとき
    @IBAction func button4(_ sender: UIButton) {
        if ans[questionNum] == 4 {
            correntAlert()
        }else{
            inCorrentAlert()
            
        }
    }
    
}

