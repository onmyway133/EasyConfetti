import UIKit
import Cheers

class ViewController: UIViewController {

  let cheerView = CheerView()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white

    cheerView.config.kind = .confetti
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

