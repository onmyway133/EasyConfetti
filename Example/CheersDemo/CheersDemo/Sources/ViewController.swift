import UIKit
import Cheers

class ViewController: UIViewController {

  let cheerView = CheerView()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white

    let string = NSAttributedString(string: "😀", attributes: [
      NSFontAttributeName: UIFont.systemFont(ofSize: 7)
    ])

    cheerView.config.kind = .text([string])
    view.addSubview(cheerView)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    cheerView.start()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    cheerView.frame = view.bounds
  }
}

