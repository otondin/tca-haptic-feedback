import UIKit

public struct HapticFeedbackEvent {
    
    public enum FeedbackGenerator {
        
        public enum NotificationType {
            case error
            case warning
            case success
        }
        
        public enum ImpactStyle {
            case light
            case medium
            case heavy
        }
        
        case notification(NotificationType)
        case impact(ImpactStyle)
    }
    
    let style: FeedbackGenerator
    
    public init(_ style: FeedbackGenerator) {
        self.style = style
    }
    
    private func generateNotification(for type: FeedbackGenerator.NotificationType) {
        switch type {
        case .error:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            
        case .warning:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.warning)
            
        case .success:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }
    }
    
    private func generateImpact(for style: FeedbackGenerator.ImpactStyle) {
        switch style {
        case .light:
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        case .medium:
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
        case .heavy:
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
        }
        
    }
    
    public func generate() {
        switch style {
        case let .notification(feedbackType):
            generateNotification(for: feedbackType)

        case let .impact(feedbackStyle):
            generateImpact(for: feedbackStyle)
        }
    }
}
