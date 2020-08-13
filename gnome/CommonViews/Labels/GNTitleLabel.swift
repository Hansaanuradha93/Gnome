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
        var descriptor = UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.family: "Poppins"])
        descriptor = descriptor.addingAttributes([UIFontDescriptor.AttributeName.traits: traits])
        font = UIFont(descriptor: descriptor, size: fontSize)
        textColor = textColour
        textAlignment = alignment
    }
}


// MARK: - Methods
extension GNTitleLabel {
    
    private func configure() {
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.9
        lineBreakMode               = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
