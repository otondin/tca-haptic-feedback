import ComposableArchitecture

@Reducer
public struct HapticFeedbackReducer<State, Action> where Action: HapticFeedbackActionProtocol {
        
    public init() {}
    
    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        guard let event = action.hapticFeedbackEvent
        else { return .none }
        
        return .run { _ in event.generate() }
    }
}
