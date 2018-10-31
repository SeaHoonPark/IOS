<h1>IOS - <Swift>

#운영체제

- 응용 프로그램과 컴퓨터 하드웨어 사이의 중재 역할

- 핵심(Kernel) 기능: **한정된 시스템 자원을 효율적으로 관리하여 여러 프로그램의 실행을 원활하게 하는 것**

   *사용자 -> 응용 프로그램 -> 운영체제 -> 하드웨어*


 *ios 중요성*

 - ios는 애플만 사용 -> 범용성 필요x


##Swift##
**변수 와 상수**

- var 함수 : variable의 약자로 변수를 뜻함
- let 함수 : 상수를 의미

선언 후 값을 넣는 행위 : 초기화

변수 : 값이 변할 수 있는 값

상수 : 초기화를 한 이후에 값을 바꾸면 에러

**변수명을 입력 후 변수명에 command + 클릭 후 edit all in scope 하면 해당 변수의 변수명이 다 바뀐다.**

**변수명을 입력 후 변수명에 option를 누르고 클릭하면 변수의 type을 알 수 있음**

*변수명 뒤에 값을 입력 해야 type을 알 수 있음, type을 입력 안하면 type에러가 뜬다.*

```
ex)
var messege = "Hello"
```
Hello를 보고 추론하여 String이라는 type을 알려준다.
Hello를 입력 하지 않고 = String을 입력해도 된다.

```
위의 글을 정리
var messege : String = "Hello"
var day : int = "27"
var day : int
```

messege에 int형인 10, 20 ,,,을 입력하면 에러가 뜬다. 이유는 이미 String을 선언하였기에

*double / float*

float : float는 single 타입으로 값을 반환할           때 한정된 값이 반환됨

double : float의 두배의 값을 반환 가능하다


##Swift ios 만들기
**xcode -> File 만들기 -> 완성**

*오른쪽 상단 utillites 클릭 후 바로 아래 화살표 아이콘 클릭하면 앱의 백그라운드 컬러 등 사용 가능*

*밑에 아이콘 4개중 왼쪽기준 3번째 아이콘 클릭하면 여러가지 기능 사용 가능*


- Label : 사용자는 사용 못하고 읽기만 가능, 속성 등에 의해 글이 짤릴수도 있음/ 폰트도 조작 가능,,
lable 추가는 클릭후 드레그로 추가



##MVC 디자인 패턴

MVC(Model, View, Controller)

model = application이 무엇을 하는지 알려주는 역할 / 앱을 설계하는 쪽에 가까움(알고리즘, 데이터베이스 등이 model안에 있음)

*(계산기 앱에서는 계산을 하는 부분)*

controller = model이 스크린에 어떻게 표현될건지 알려주는 역할 /
*(기본적으로 모든 컨트롤러에 들어가는 UI로직이다.)*

View = Controller의 하위종속자(미니언) /
*모델에 있는 버튼,레이블,테이블 등 컨트롤러가 보여주기 위해 필요한 것들이 있는 것으로 사용자에게 입력받아 모델을 업데이트 하기도 한다*


 MVC 디자인 패턴
-

-  controller -> model

 모델의 모든 걸 알고 있고 보내고 싶은 메시지를 보낼 수 있음, 컨트롤러의 역할이 사용자에게 모델에 있는 것을 표현,  사용자로부터 정보를 받아 모델을 업데이트하는 것,
컨트롤러는 모델을 통제가능하다.
 
- controller -> view
 
 controller와 view는 outlet을 통해 이루어짐
 xcode에서 실습했던 계산기 부분에서 display는 optional UILable이고 그 연결은 컨트롤러가 뷰에게 얘기하는 방식을 의미(UIlable은 view의 일부)
 
- view <-> model

  둘은 서로 연동이 안됨, model은 UI와는 독립적으로 완전히 UI에 의존적인 view에게 얘기할게 없다.
  
 *두개의 의사소통은 controller로 이루어짐*

- view의 미니언이 controller에게 정보를 전달하는 방식으로 1. target-action으로 controller가 자기 자신에 타겟판을 걸어놓는데 @IBAction으로 메소드 정의 (control + 드래그) *메소드를 통해서 UIButton같은 view의 미니언과 controller가 소통하는 방식. 2. StrollView 3. Delegation

 Delegate = 그냥 view안에 있는 property(변수)
 
 delegate -> data Source로 불림

 protocol = 다른 것을 대신 실행하기 위해 약속된 메소드들을 모아놓은 설명

 따라서 어떤 view에는 data source라는 property가 있고 이 protocol의 포인터는 다른 객체가 됨

##MVC의 특성
- view : 자신이 보여주고 있는 데이터를 소유 불가

소유하고 싶으면 controller에게 매번 물어보고 controller는 model에서 data를 가져옴
또한 위에(Delegate ~ 다른 객체가 됨) 설명에 의해 controller는 자신을 그렇게 지정하여 view를 위해 data를 제공하는데 관여하게 됨

-
이러한 것들이 뷰가 컨트롤러와 소통할 수 있는 방법
사전에 미리 잘 정의되어 있는 방식으로 소통

controller의 역할은 view를 위해 model의 data를 해석하고 구성하는 것, model에게 view의 입력을 해석해 주기도 함, 그렇기에 *view와 model사이의 해석기고 여기까지가 UI로직이 작동하는 방식*

네트워크 상에서 model은 data를 대표

- model -> controller (X)
controller는 UI로직을 다루고 model은 UI와 별개이기에 model이 controller에게 말할 방법은 없다.

but UI와는 상관없는 model이 값이 바뀌는 데이터를 가지고 있으면 라디오 방송국과 비슷한 것(채널)을 사용

라디오 방송국은 model과 controller사이가 아닌 다른 MVC 간에도 적용 가능하다. model에 채널을 고정하고 있는건 controller이고 controller는 data를 화면에 보여주기 위해 일반화 되어 있는 view를 설정


**일반적으로 ios에서는 MVC 한 개가 폰 화면 한 개를 제어, 패드 화면에서는 두,세 개의 화면을 제어**

=> MVC는 앱의 작은 한 부분을 제어 / 앱을 만들기 위해서는 여러 MVC를 만들어 결합해야됨.

기본적으로 MVC는 또 다른 MVC의 view 일부로서만 일할 수 있음




##옵셔널

- 1. enum : 초기화 값을 지정 안해도 된다. 연관값을 구별되는 값들에 할당을 해주기 때문에

```
enum Optional<T> { //<T>는 Array<T>처럼 일반적인 것
	case None
	case Some(T)
}

let x: Sting? = nil
...is...
let x = Optional<String>.None

let x : String? = "hello"
...is...
let x = Optional<String>.Some("hello")

var y = x!
...is...
switch x {
	case Some(let value): y = value
	case None:
}
```
```
let x: String? = ...
if let y = x {
	// do something with y
}
...is...
switch x {
	case .Some(let y):
			// do something with y
	case .None:
			break
}
```
-
- 2. ! / ?

```
var display: UILabel? //
if let label = display {
	if let text = label.text {
		let x = text.hashValue
		...
	}
}
...or...
if let x = display?.text?.hashValue{...}

👉let x = optional int = (int?)
```
*위의 코드 설명*

- optional이 사슬처럼 연결될 수 있음

	계산기앱을 예로 들면 display를 text와 연결할 때 **if let label = display** 하여 display값을 추출후 **if let text = lable.text해서 추출** 마지막으로 **let x = text.hashValue** 하여 최종적으로 추출하지만 이것을 **if let x = display?.text?.hashValue{}**로 간단하게 변경 가능
	
-
- 3. ? ? : nil일 때의 기본값을 제공
 
 ```
 let s: String? = ... //아마 nil일 것
 if s != nil {
 	display.text = s
 } else {
     display.text = " "
 }
 
 -> s가 nil이 아니라면 display에는 s!가 들어감
    s가 nil이라면 display는 " " 빈 공간이 됨
 
 위의 코드를 간단하게 하면
 ...simple...
 display.text = s ?? " "
 
 -> s가 nil이 아니라면 값이 추출되어 사용하고
    아니면 (" ") 빈 공간으로 사용
    
 📌 optional이 nil일 경우 기본값을 갖기 위한 간단한 방법
 ```
 
lable에 nil을 집어 넣으면 label의 사이즈는 0

-
##Tuples
swift type으로 서로 다른 타입들을 그룹으로 묶어서 하나의 타입을 만듬, **함수에서 여러개의 값을 반환 가능**

```
ex)
let x: (String, Int, Double) = ("hello",5, 0.85) //튜플 특성
let (word, num, value) = x
print(word)
print(num)
print(value)
```
튜플에 넣은 순서 그대로 입력해야 출력

```
let x: (w:String, i: Int, v: Double) = ("hello", 5, 0.85)
print(x.w)
print(x.i)
print(x.v)
...or...
let (wrd, num, val) = x

=> 위의 코드를 타입 하나당 이름을 지어서 요약 가능
```
튜플은 완벽하게 유효한 반환 타입이 될 수 있음

```
func getSize() -> (weight: Double, height: Double) { return (250, 80) }

let x = getSize()
print("weight is \(x.weight")// weight is 250
...or...
print("height is \(getSize().height)") // height is 80
```

##Range
무엇이든 연속적으로 표현될 수 있는 것의 양 끝 점을 가리킴
Range는 제너릭이다.

```
struct Range<T> {
	var startIndex: T
	var endIndex: T
}
 
 1~10까지의 연속된 숫자를 출력 시
 for i in 1...10{ } 사용
 
 ...이 range의 표현법

``` 
##Data Structures 
- 클래스, 구조, enum : 데이터 구조의 기본적인 3가지 방법

- 유사점 
  1. 선언구문
  2. 함수 및 속성
  3. 초기화 함수

- 다른점
  1. 상속 / 클래스에선 상속 가능, struct와 enum에선 불가능
 
  2. value type : struct와 enum은 값으로 전달되는 타입 / class는 참조 타입(referance type)으로 포인터(메모리 주소)로 전달 *힙 영역 안에 있음)

  
### value (struct / enum)
value type은 함수에서 인자로 전달될 때 복사된다는 점에서 명확하다. 또한 다른 변수에 할당할 때도 복사를 
한다.

-
value type의 개념은 let 변수에 할당한 경우 값을 바꿀 수 없다. **구조체의 값을 바꾸는 함수가 있는 구조체가 있다면 swift가 알 수 있도록 함수 앞에 mutating을 붙여야 됨.


###Reference (class)
힙 메모리에 저장되어 있다가 참조를 주고 그 참조는 자동으로 카운트 된다. *swift에는 Garbage Collection이 없다*  

- Garbage Collection : 메모리 관리 기법 중의 하나로 프로그램이 동적으로 할당했던 메모리 영역 중에서 필요 없게 된 영역을 해제하는 기능

###Method

```
func foo(/externalFirst //first: Int, /externalSecond //second: Double) {
	var sum = 0.0
	for _ in 0..<first { sum += second }
}
func bar() {
	let result = foo(externalFirst:123, externalSecond: 5.5)
	...or...
	let result = foo(123, second: 5.5) //외부 이름에 언더바 사용
}	

/ => 외부 이름, // => 내부 이름
```
함수에 들어가는 모든 파라미터는 외부 이름과 내부 이름이 있다.

내부 이름: 메소드 내부에서 사용될 지역 변수의 이름

외부 이름: 메소드를 호출할 떄 호출하는 사용자가 사용

함수를 호출할 시 외부 이름을 사용하고 싶지 않으면 _(underbar) 사용 / **외부 이름으로 _를 넣으면 외부 이름이 보이지 않음**

첫 번째 parameter에는 기본값으로 되어 있으므로 새로 만들 시 언더바를 넣어줄 필요가 없다. 또한 외부 이름을 지정 안하면 기본값으로 내부 이름이 된다.모든 파라미터의 외부 이름은 바꿀 수 있다.

-
- 1. **method는 override도 가능하다**

*override: 상위 클래스에서 정의된 메소드와 프로퍼티를 재정의*

```
override var ~~~
override func ~~~

이런 식으로 var, func 앞에 override를 붙이면 됨
```

또한 프로퍼티와 메소드를 final로 표시 가능, 서브클래싱을 하지 못하게 하는 것으로 서브클래싱을 못하니까 오버라이도를 할 수 없음.

클래스 전체에 final을 하면 클래스 전체가 서브클래싱을 할 수 없게 된다.

*서브클래싱: 하위 클래스에서 오버라이드 등을 통해 수정하는 것*

- 2. type과 instance 모두 프로퍼티와 메소드를 가질 수 있음.

```
var d: Double = ...
if d.isSignMinus {
	 d = Double.ads(d)
}

----------------------------------------------------
d의 타입은 Double(d는 Double의 인스턴스) 
abs는 함수의 이름, Doubele 다믕네 .을 찍어서 이 함수에 접근(클래스 이름을 넣는 행위)
```

메소드와 프로퍼티를 타입 그 자체로서 가질 수 있다
ex) CalculatorBrain 자체가 함수를 가질 수 있다.

###Properties
```
var someStroredProperty: Int = 42 {
	willSet { newValue is the new value }
	didSet { oldValue is the old value }
}

override vat inheritedProperty {
	willSet { newValue is the new value }
	didSet {oldValue is the old value }
}

var operations: Dictionary<String, Operation> = [ ... ] {
	willSet { will be executed if an operation is added/removed }
	didSet { will be executed if an operation is added/removed }
}


--------------------------------------------
var는 계산 프로퍼티가 아니라 저장 프로퍼티이다.
willSet / didSet은 value type을 바꿔도 불리게 된다
```
willSet / didSet가 쓰이는 용도는 보통 UI update이다. => UI가 보이는 방식을 바꿀 컨트롤러에 어떤 값을 설정하면 뷰에게 알아서 다시 그려내라고 요청할 수 있다.

- Lazy Initialization(늦은 초기화): var가 늦게 초기화 되도록 선언 가능(모든 변수 초기화 해야됨, var만 사용 가능) 

```
lazy var brain = CalculatorBrain()
// 누군가 brain에 요청하기 전까진 할당되지 않음

lazy var someProperty: Type = {
	return <the constructed value>
}()
//클로져 안의 코드를 실행하여 초기화한다

lazy var myProperty = self.initializeMyProperty()
//직접 메소드를 호출해 나의 프로퍼티 중 하나를 초기화 하려는데 보통 lazy키워드 없이는 잘못된 코드다
없으면 안되는 이유: 전체적으로 초기화 되기 전까지는 자신에게 메시지를 보내거나 모든 프로퍼티에 접근 불가.
```

###Array
```
1.
var a = Array<String>() //정식 표현
...is the Same as...
var a = [String]() //약식 표현
...this...
초기화 하고 String으로 Array 인스턴스를 생성

()-> 이 부분은 초기화하고 인자없이 초기화 하는 것을 뜻함

2. 변수 몇개를 넣어 초기화 후 배열 객체를 생성 가능

let animals = ["Giraffe", "Cow", "Doggie"]
animals.append("Ostrich") //aniamls는 let(상수) 이기에 컴파일 안됌 var를 넣으면 돌아감

let animal = animals[5] //충돌 현상 일어남
범위 밖의 Array 인덱스를 가져오면 충돌

3. 배열을 열거하는 방법
for animal in animals {
	println("\(animal)")
}

반복하면서 지역 변수에 aniamls 각각이 할당

4. 배열 메소드 종류
- 1.배열에서 연산을 하기 위해 클로져를 사용
filter(includeElement: (T) -> Bool) -> [T]
//Array에 있는 무슨 타입을 받아서 Bool을 반환하는 클로져를 제공 / 배열의 모든 요소마다 클로져를 실행, 클로져가 true로 반환하는 요소를 포함시켜 간다

ex)
let bigNumbers = [2,47,118,5,9].filter({ $0 > 20 }) //bigNumber: 47,118

- 2.map 메소드
map(transform: (T) -> (U) -> [U]
map은 클로져를 받고 클로져는 배열안에 있는 각 요소들을 다른 것으로 바꿈

let stringified: [String] = [1,2,3].map { String($0) }

- 3. reduce 메소드
reduce(initial: U, combine:(U, T) -> U

reduce는 배열을 하나의 결과로 줄일 수 있음(숫자를 더해 갈 때)

let sum: [1,2,3].reduce(0) { $0 +$1 }

- 4. Dictionary 메소드
key와 value로 구성

var pac10teamRankings = Dictionary<String, Int>()
...is the same as...
var pac10teamRankings = [String:Int]()

pac10teamRankings = ["Stanford":1, "Cal":10]
let ranking = pac10teamRankings["Ohic State"] // ranking은 int가 아니라 아마 nil일 것
이유는  ["Ohic State"] 가 pac10에는 없기에 nil이다

Dictionary를 통해 열거하는 방법은 tuple을 이용
for (key, value) in pac10teamRankings {
	print("\(key) = \(value)")
} 
// key값만 갖고 싶으면 value에 _사용
//value값만 갖고 싶으면 key에 _사용

- 5. String 메소드

var characters: String.CharecterView { get }
```

###object-C

1. NSObject
 objective-C 기본 클래스
 
2. NSDate 

 현재 시간과 날짜를 알려줌(비트 단위의 데이터 모임)  

3. NSNumber 
 
```
Generic numbef-holding class

let n = NSNumber(35.5)
let intversion: Int = n.intValue
```

###Initialization(초기화)

- init 메소드
 클래스가 인자없는 init을 자동으로 생성
 만약 나만의 init을 만들면 자동생성 init을 사용하면 안된다. 
 
 ```
 struct MyStruct {
 	  var x: Int
 	  var y: String
 }
 
 let foo = init(x: 5, y: "hello") //기본 init() 메소드
```
*init에서 할 수 있는 것들*
- 모든 프로퍼티의 값을 설정할 수 있다.
- 이미 기본값을 가진 어떤 프로퍼티를 설정할 수 있다.
- 상수 프로퍼니도 설정 가능
- 여러 init메소드에서 다른 init메소드를 한 개만 부를 수 있다.
- 부모클래스의 init도 부를 수 있다.

**init안에서 반드시 해야되는 것(요구사항)**

- init이 끝나는 시점에서는 모든 프로퍼티는 반드시 값을 가져야 한다.
- 클래스에는 두 가지 타입이 있다.
	- convenience initializers(편의 초기화 함수)
	
	 --> convenience init ~~~ 선언
	 - *클래스 안에서 편의init or 지정init을 호출하고 초기화 해야됨*
	 - *어떤 프로퍼티의 값을 설정 할 수 있기 전에 반드시 그 init을 호출해야 됨*
	 
- 요약: 편의 초기화 함수가 init으로 돌아올 때까지 모든 프로퍼티의 값이 설정되고 다른 것으로 다시 설정 가능

	- designated initializers(지정 초기화 함수)
	
	 --> **부모클래스에 있는 지정 초기화를 호출 해야됨** 
	 - *부모클래스에 있는 편의 초기화는 호출 불가* 
	 - *자신의 클래스에서 부모의 편의 초기화 함수를 호출 불가* 
	 - *클래스에서 만든 모든 프로퍼티를 초기화 해야됨* / 부모 클래스의 init을 부르기 전에
	 - *부모클래스에 있는 어떤 프로퍼티를 건들기 전에 부모클래스의 init을 호출해야 됨*
	 
- 요약: 일을 하고 부모를 부른 뒤에 프로퍼티에 접근 가능 
 - Required init(필수 초기화 함수)
 
 	 - *required와 함께 init을 표시 가능*
 	
 	 --> 자식클래스는 init을 반드시 실행해야 됨 
 	 
 - Failable initializer(실패할 수 있는 초기화 함수)
		- *Failable initializer는 옵셔널 값이 반환될 수 있도록 하고 ?로 명시한다*
		- *?를 넣어주면 초기화 함수를 어떤 클래스의 옵셔널을 반환하는 초기화 함수로 만들어 준다.*
		- *초기화가 실패하면 nil을 반환한다.*
	
  ```
  init?(arg1: Type1, ...) {
		//아마 return값은 nil일 것이다.  
  }
  
  ...rare...
  let image = UIImage(named: "foo")
  
  //이 이름으로 이미지를 찾을 수 없으면 nil을 반환
  if let image = UIImage(named:   "foo") {
		//image was successfully created
 } else {
		//couldn't create the image
 }
 ```   


**init 상속하기**

- 지정init을 어떤 것도 실행하지 않는다면 부모클래스의 모든 지정 init을 상속하게 된다.
- 부모클래스의 모든 지정init을 override	하거나 그것들 중 어느 것도 실행하지 않으면 부모클래스로 부터 모든 편의 초기화 함수를 상속 받을 수 있다.


**객체 만들기**

```
let x = CalculatorBrain()
let y = ComplicatedObject(arg1: 43, arg2: "hello", ...)
let z = [String]()
```

###AnyObject
AnyObject: 모르는 클래스의 객체에 대한 포인터 주소

*AnyObject 사용 예시*

- 메소드 인자의 타입이 적어도 두개 이상 될 수 있을 때 사용

```
func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject)

fun touchDigit(sender: AnyObject)
```
- 쿠기를 반환할 때 사용, 쿠키는 상태를 저장하고 뭔가를 기억하고 있다가 돌려주는 것

```
var cookoe: AnyObject
```

*AnyObject 사용법*

- 우리가 아는 타입으로 변환(as 키워드 사용)
(다른 타입으로 변환을 as(시도) 한다는 의미),
(옵셔널을 반환)

```
let ao: AnyObject = ...
if let foo = ao as? SomeClass {
	  //foo를 사용 가능,
}
```

- Property List: Array, Dictionary, String, Double, Int, NSDatea로 구성
이러한 걸로 구조를 만들면 property list가 만들어짐

- Property List는 보이지 않게 전달 됨



