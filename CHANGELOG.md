# Changelog

## 1.1.0

Added:
- `AuthRequest.responseType` (`.tokens` by default, or `.verifyKey`) and
  `AuthResult.Success.verifyKey`. In `.verifyKey` mode only `verifyKey` is set;
  `accessToken` and `refreshToken` are empty. Use `.verifyKey` only if Pully
  advises.
- `AuthResult.Success` now also carries `userId`, `phoneNumber` and
  `identified` (whether the user completed identity verification).
- New design variants: `.sqb`, `.apex`, `.alif`. If you `switch` over
  `DesignVariant`, add an `@unknown default` case.

Changed:
- MyID identity verification uses the updated MyID integration. The `.dev`
  environment now runs MyID against MyID's test environment; `.prod` is
  unchanged.

Fixed:
- iOS OTP AutoFill ("From Messages") now fills the code field.
- An empty navigation bar no longer pushes the flow's screens down.

## 1.0.1

Fixed: the XCFramework in 1.0.0 shipped its resource bundle as a broken
symlink, crashing the login flow at launch ("unable to find bundle named
Pully_Pully"). Resources are now physically embedded in both slices.

## 1.0.0

Initial release: login, OTP, registration, password recovery, MyID identity
verification, passkeys (iOS 16+, best-effort).
