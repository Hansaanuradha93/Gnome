import UIKit

class GNTitleLabel: UILabel {
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
    
    convenience init(fontSize: CGFloat, textColour: UIColor = .black, alignment: NSTextAlignment = .left) {
        self.init(frame: .zero)
        let traits = [UIFontDescriptor.TraitKey.weight: UIFont.Weight.bold]
        var descriptor = UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.family: Fonts.poppins])
        descriptor = descriptor.addingAttributes([UIFontDescriptor.AttributeName.traits: traits])
        font = UIFont(descriptor: descriptor, size: fontSize)
        textColor = textColour
        textAlignment = alignment
    }
}


// MARK: - Fileprivate Methods
fileprivate extension GNTitleLabel {
    
    func configure() {
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
    }
}
