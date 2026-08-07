# Changelog

## 1.0.1

Fixed: the XCFramework in 1.0.0 shipped its resource bundle as a broken
symlink, crashing the login flow at launch ("unable to find bundle named
Pully_Pully"). Resources are now physically embedded in both slices.

## 1.0.0

Initial release: login, OTP, registration, password recovery, MyID identity
verification, passkeys (iOS 16+, best-effort).
