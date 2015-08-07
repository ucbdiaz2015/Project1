import UIKit

func cellCount(size: CGFloat, cellSize: CGFloat) -> Int {
    return Int(ceil(size / cellSize))
}

func randomBool() -> Bool {
    return arc4random_uniform(2) == 1
}

class ViewController: UIViewController {
    let CELL_SIZE: CGFloat = 50
    var views : [[UIView]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createViews()
        self.randomizeCells()
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "next", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    func createViews() {
        let horizontalCellCount = cellCount(self.view.frame.size.width, cellSize: CELL_SIZE)
        let verticalCellCount = cellCount(self.view.frame.size.height, cellSize: CELL_SIZE)
        var x: CGFloat = 0
        var y: CGFloat = 0
        var view: UIView
        for i in 0..<verticalCellCount {
            self.views.append([])
            for _ in 0..<horizontalCellCount {
                view = UIView(frame: CGRect(x: x, y: y, width: CELL_SIZE, height: CELL_SIZE))
                self.view.addSubview(view)
                self.views[i].append(view)
                x += CELL_SIZE
            }
            y += CELL_SIZE
            x = 0

        }
    }

    func randomizeCells() {
        for i in self.views {
            for view in i{
                let t = randomBool()
                view.on = t
            }
        }
    }

    func next() {
        let currentStates = self.views.map({$0.map{$0.on}})
        let states = nextCellStates(currentStates)
        for i in 0..<states.count {
            for j in 0..<states[i].count {
                self.views[i][j].on = states[i][j]
            }
        }
    }

}

private extension UIView {
    var on: Bool {
        get {
            return tag == 1
        }
        set {
            tag = newValue ? 1 : 0
            self.backgroundColor = newValue ? UIColor.blackColor() : UIColor.whiteColor()
        }
    }
}

