# Changelog

## 1.1.1

Changed:
- The public offer and privacy policy notice is now shown in every design
  variant. `.openbank`, `.brb`, `.mkb` and `.mani` show it under the login
  button and at the bottom of the registration screen.
- MyID identity verification uses the client credentials returned by the Pully
  backend for each session, falling back to the built-in ones when the
  backend doesn't provide them. No integration changes.

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
