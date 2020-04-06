import UIKit

enum AssetsColor: String {
    
    case White
    case Subtitle_Black
    case Blured_Black
    case Pretty_Pink
    case Pretty_Pink_L1
    case Pretty_Pink_L2
    case Pretty_Pink_L3
    case Grey
}


extension UIColor {
    
    static func appColor(_ color: AssetsColor) -> UIColor? { return UIColor(named: color.rawValue) }
}
