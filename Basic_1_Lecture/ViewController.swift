//Caculate 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var buttonAc: UIButton!
    @IBOutlet weak var buttonPm: UIButton!
    @IBOutlet weak var buttonPerc: UIButton!
    @IBOutlet weak var buttonDiv: UIButton!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var buttonMul: UIButton!
    
    
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var buttonMin: UIButton!
    
    
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var buttonPlu: UIButton!
    
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var buttonEql: UIButton!
    
    var operateTempFloat: Float = 0.0 // 연산 결과 저장
    var operateTempInt: Int = 0
    
    var operater: Character = " " // 연산 처리를 위한 버튼 식별
    var oprFirst: Bool = true // 연산 처리를 위한 첫 데이터 삽입 여부
    var oprColorCnt: Int = 0 //연산자 버튼 색상 카운트
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        result.layer.cornerRadius = 50
        result.layer.masksToBounds = true  // 코너 radius 변경이 안될 시 선언
    }

    override func viewDidAppear(_ animated: Bool) { // 버튼에 대한 속성(button1.bounds.width)으로 접근 시 이 메서드에
        super.viewDidAppear(animated)
        initializeShape() // 모든 버튼 radius 둥굴게 수정
        
    }
    
    // 숫자 버튼 영역 시작
    @IBAction func btn1Action(_ sender: Any) { //숫자 7 버튼
        
        confirmZero()
        isEnableOpr()
        initializeColor()
        result.text?.append("7")
    }
    
    @IBAction func btn2Action(_ sender: Any) { //숫자 8 버튼
        
        confirmZero()
        isEnableOpr()
        initializeColor()
        result.text?.append("8")
    }
    
    @IBAction func btn3Action(_ sender: Any) { //숫자 9 버튼
        
        confirmZero()
        isEnableOpr()
        initializeColor()
        result.text?.append("9")
    }
    
    @IBAction func btn4Action(_ sender: Any) { //숫자 4 버튼
        
        confirmZero()
        isEnableOpr()
        initializeColor()
        result.text?.append("4")
    }
    
    @IBAction func btn5Action(_ sender: Any) { //숫자 5 버튼
        
        confirmZero()
        isEnableOpr()
        initializeColor()
        result.text?.append("5")
    }
    
    @IBAction func btn6Action(_ sender: Any) { //숫자 6 버튼
        
        confirmZero()
        isEnableOpr()
        initializeColor()
        result.text?.append("6")
    }
    
    @IBAction func btn7Action(_ sender: Any) { //숫자 1 버튼
        
        confirmZero()
        isEnableOpr()
        initializeColor()
        result.text?.append("1")
    }
    
    @IBAction func btn8Action(_ sender: Any) { //숫자 2 버튼
        
        confirmZero()
        isEnableOpr()
        initializeColor()
        result.text?.append("2")
    }
    
    @IBAction func btn9Action(_ sender: Any) { // 숫자 3 버튼
        
        confirmZero()
        isEnableOpr()
        initializeColor()
        result.text?.append("3")
    }
    
    @IBAction func btn0Action(_ sender: Any) { // 숫자 0 버튼
        
        confirmZero()
        isEnableOpr()
        initializeColor()
        result.text?.append("0")
    }
    
    @IBAction func btnDotAction(_ sender: Any) { // . 버튼
       
        if !(result.text!.contains(".")) {
            result.text?.append(".")
        }
    }
    // 숫자 버튼 영역 끝

    
    // 연산자 버튼 영역 시작
    @IBAction func btnACAction(_ sender: Any) {
        
        initializeColor()
        result.text = "0"
        operateTempFloat = 0
    }
    
    @IBAction func btnPercentAction(_ sender: Any) {
        
        let percent = Float(result.text!)! / 100
        result.text = String(percent)
    }
    
    @IBAction func btnDivisionAction(_ sender: Any) {
        
        oprColorCnt = 1
        operater = "/"
        operate()
        
        initializeColor()
        setColor(button: buttonDiv)
    }
    
    @IBAction func btnMultipleAction(_ sender: Any) {
        
        oprColorCnt = 1
        operater = "x"
        operate()

        
        initializeColor()
        setColor(button: buttonMul)
    }
    
    @IBAction func btnMinusAction(_ sender: Any) {
        
        oprColorCnt = 1
        operater = "-"
        operate()

        
        initializeColor()
        setColor(button: buttonMin)
    }
    
    @IBAction func btnPlusAction(_ sender: Any) {

        oprColorCnt = 1
        operater = "+"
        operate()

        initializeColor()
        setColor(button: buttonPlu)
    }
    
    @IBAction func btnResultAction(_ sender: Any) {
        
        operate()
        oprFirst = true
        
        resultCasting()
        
    }
    
    
    // 연산자 버튼 영역 끝
    
    func initializeShape(){
        
        buttonAc.layer.cornerRadius = button1.bounds.width / 2
        buttonPm.layer.cornerRadius = button1.bounds.width / 2
        buttonPerc.layer.cornerRadius = button1.bounds.width / 2
        buttonDiv.layer.cornerRadius = button1.bounds.width / 2
        
        button1.layer.cornerRadius = button1.bounds.width / 2
        button2.layer.cornerRadius = button1.bounds.width / 2
        button3.layer.cornerRadius = button1.bounds.width / 2
        buttonMul.layer.cornerRadius = button1.bounds.width / 2
        
        button4.layer.cornerRadius = button1.bounds.width / 2
        button5.layer.cornerRadius = button1.bounds.width / 2
        button6.layer.cornerRadius = button1.bounds.width / 2
        buttonMin.layer.cornerRadius = button1.bounds.width / 2
        
        button7.layer.cornerRadius = button1.bounds.width / 2
        button8.layer.cornerRadius = button1.bounds.width / 2
        button9.layer.cornerRadius = button1.bounds.width / 2
        buttonPlu.layer.cornerRadius = button1.bounds.width / 2
        
        button10.layer.cornerRadius = button1.bounds.width / 2
        button11.layer.cornerRadius = button1.bounds.width / 2
        buttonEql.layer.cornerRadius = button1.bounds.width / 2
    }
    
    
    func initializeColor() { // 연산자 색상 속성 초기화
        
        buttonDiv.setTitleColor(.white, for: .normal)
        buttonDiv.backgroundColor = .systemOrange
    
        buttonMul.setTitleColor(.white, for: .normal)
        buttonMul.backgroundColor = .systemOrange
        
        buttonMin.setTitleColor(.white, for: .normal)
        buttonMin.backgroundColor = .systemOrange
        
        buttonPlu.setTitleColor(.white, for: .normal)
        buttonPlu.backgroundColor = .systemOrange
    }
    
    
    func setColor(button: UIButton)  { // 연산자 클릭 시 버튼 색 변경
    
        button.setTitleColor(.systemOrange, for: .normal)
        button.backgroundColor = .white
      
    }
    
    
    func isEnableOpr(){ // 연산자 클릭 시 label 초기화
        
        if oprColorCnt == 1 {
            result.text = ""
            oprColorCnt = 0
        }
    }
    
    
    func confirmZero(){ // 첫 숫자 버튼 클릭 시 0 제외
        
        if result.text == "0"{
            result.text = ""
        }
    }
    
    
    func operate(){ // 연산 로직
        
        let resultToFloat = Float(result.text!)!
        
        switch operater{
        case "/":
            
            if(oprFirst == true){ //초기 값 일 시 연산을 하지않고 대입만 함
                operateTempFloat = resultToFloat
                oprFirst = false
            }
            else{
                operateTempFloat = operateTempFloat / resultToFloat
            }
      
        case "x":
           
            if(oprFirst == true){
                operateTempFloat = resultToFloat
                oprFirst = false
            }
            else{
                operateTempFloat = operateTempFloat * resultToFloat
            }

        case "-":
            
            if(oprFirst == true){
                operateTempFloat = resultToFloat
                oprFirst = false
            }
            else{
                operateTempFloat = operateTempFloat - resultToFloat
            }
            
        case "+":
            
            if(oprFirst == true){
                operateTempFloat = resultToFloat
                oprFirst = false
            }
            else{
                operateTempFloat = operateTempFloat + resultToFloat
            }

        default:
            break
        }
        
    }
    
    func resultCasting(){ // .0 으로 끝나는 float형은 정수로 캐스팅, float형일시 소수 2자리까지
        
        let decimalIndex = String(operateTempFloat).lastIndex(of: ".")
        let decimal = String(operateTempFloat)[decimalIndex!...]
    
        if decimal == ".0" {
            operateTempInt = Int(operateTempFloat)
            result.text = String(operateTempInt)
        }
        else{
            operateTempFloat = Float(String(format: "%.2f", operateTempFloat))!
            result.text = String(operateTempFloat)
        }
    }
}
