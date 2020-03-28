import UIKit

enum AssetsColor: String {
    
}


extension UIColor {
    static func appColor(_ color: AssetsColor) -> UIColor? {
        return UIColor(named: color.rawValue)
    }
}
