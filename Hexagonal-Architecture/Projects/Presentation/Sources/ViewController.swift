import UIKit
import RxSwift
import RxCocoa
import Core
import SnapKit
import Then

public class ViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let greetingUseCase: GreetingUseCase
    
    private lazy var greetingLabel = UILabel()
    
    private lazy var helloButton = UIButton().then {
        $0.setTitle("Say Hello", for: .normal)
        $0.tintColor = .black
        $0.backgroundColor = .red
    }
    
    public init(greetingUseCase: GreetingUseCase) {
        self.greetingUseCase = greetingUseCase
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
        
        self.view.backgroundColor = .white
        
        view.addSubview(greetingLabel)
        view.addSubview(helloButton)
        
        greetingLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        helloButton.snp.makeConstraints {
            $0.top.equalTo(greetingLabel.snp.bottom).offset(20.0)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setupBindings() {
        helloButton.rx.tap
            .flatMapLatest { [unowned self] in
                self.greetingUseCase.getGreeting()
            }
            .map { greeting in
                greeting.message
            }
            .bind(to: greetingLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
