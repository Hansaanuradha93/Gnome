import UIKit

class GNSecondaryBodyLabel: UILabel {
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    convenience init(fontSize: CGFloat, fontColor: UIColor = .black) {
        self.init(frame: .zero)
        
        let traits          = [UIFontDescriptor.TraitKey.weight: UIFont.Weight.medium]
        var descriptor      = UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.family: "Poppins"])
        descriptor          = descriptor.addingAttributes([UIFontDescriptor.AttributeName.traits: traits])
        font                = UIFont(descriptor: descriptor, size: fontSize)
        textColor           = fontColor
    }
    
    
    // MARK: - Methods
    private func configure() {
        
        textColor                   = .black
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.7
        lineBreakMode               = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
