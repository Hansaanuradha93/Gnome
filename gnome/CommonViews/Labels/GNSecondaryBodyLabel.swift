import UIKit

class GNSecondaryBodyLabel: UILabel {
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
    
    convenience init(fontSize: CGFloat, fontColor: UIColor = .black) {
        self.init(frame: .zero)
        let traits = [UIFontDescriptor.TraitKey.weight: UIFont.Weight.medium]
        var descriptor = UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.family: Fonts.poppins])
        descriptor = descriptor.addingAttributes([UIFontDescriptor.AttributeName.traits: traits])
        font = UIFont(descriptor: descriptor, size: fontSize)
        textColor = fontColor
    }
}


// MARK: - Fileprivate Methods
fileprivate extension GNSecondaryBodyLabel {
    
    func configure() {
        textColor = .black
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.7
        lineBreakMode = .byTruncatingTail
    }
}
