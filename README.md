# TCAFeatureHapticFeedback

A TCA high-order reducer to easily integrate with UIKit Haptic Feedback APIs.

## Usage example:

### Parent Feature

```swift
import FeatureHapticFeedback

@Reducer
struct MyFeature {

    ...
    
    enum Action {
        case onAppear
        case actionA
        case actionB
    }
    
    var body: some ReducerOf<Self> {
        ...
        HapticFeedbackReducer()
    }
}
```
### Feature Action Extension

```swift
extension MyFeature.Action: HapticFeedbackActionProtocol {
    
    public var hapticFeedbackEvent: HapticFeedbackEvent? {
        switch self {
        case .onAppear:
            return .init(.impact(.light))
            
        case .actionA:
            return .init(.notification(.success))
        
        default:
            return nil
        }
    } 
}
```
