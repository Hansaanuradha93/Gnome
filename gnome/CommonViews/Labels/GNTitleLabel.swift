import UIKit

class GNTitleLabel: UILabel {
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(fontSize: CGFloat, textColour: UIColor = .black) {
        self.init(frame: .zero)
        let traits          = [UIFontDescriptor.TraitKey.weight: UIFont.Weight.bold]
        var descriptor      = UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.family: "Poppins"])
        descriptor          = descriptor.addingAttributes([UIFontDescriptor.AttributeName.traits: traits])
        font                = UIFont(descriptor: descriptor, size: fontSize)
        textColor           = textColour
    }
    
    
    // MARK: - Methods
    private func configure() {
        textAlignment               = .left
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.9
        lineBreakMode               = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
