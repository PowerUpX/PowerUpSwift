# Migration

### Migrating from 1.x.x to 2.x.x
* All `PowerUp-` prefixes of the classes have been changed to `PU-`. For example, use `PUView` instead of `PowerUpView`.
* The `public init(_:)` function on the `Bool` extension has been removed since it's not useful.
* The `asFullAddress` computed property on `CLPlacemark` extension has been renamed to `fullAddress`.
* The `asJSON` computed property on `Data` extension has been renamed to `json`.
* The `asJSON` computed property on `String` extension has been renamed to `json`.
* The `extractedJWTPayload` computed property on `String` extension has been renamed to `jwtPayload`.
* The `heightConstraint` and `widthConstraint` computed properties on `UIView` extensions have been removed.
* The `hideKeyboardWhenTappedOutside` function on `UIViewController` extension has been changed renamed to `dismissKeyboardWhenTappedOutside`.
* The `showInFullScreen(completion:)` function on `UIViewController` extension has been removed since it no longer works starting in iOS 13.
