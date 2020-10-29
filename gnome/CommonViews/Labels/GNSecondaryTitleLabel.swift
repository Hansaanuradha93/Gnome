import UIKit

class GNSecondaryTitleLabel: UILabel {

    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
    
    convenience init(fontSize: CGFloat, alignment: NSTextAlignment = .left , fontColor: UIColor = .black) {
        self.init(frame: .zero)
        let traits = [UIFontDescriptor.TraitKey.weight: UIFont.Weight.semibold]
        var descriptor = UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.family: Fonts.poppins])
        descriptor = descriptor.addingAttributes([UIFontDescriptor.AttributeName.traits: traits])
        font = UIFont(descriptor: descriptor, size: fontSize)
        textAlignment = alignment
        textColor = fontColor
    }
}


// MARK: - Fileprivate Methods
fileprivate extension GNSecondaryTitleLabel {
    
    func configure() {
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.85
        lineBreakMode = .byTruncatingTail
    }
}
