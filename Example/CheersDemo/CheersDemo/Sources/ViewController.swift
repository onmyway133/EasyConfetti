import UIKit
import Cheers

class ViewController: UIViewController {

  let cheerView = CheerView()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white

    view.addSubview(cheerView)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    cheerView.frame = view.bounds
  }
}

