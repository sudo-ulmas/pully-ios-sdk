# Pully iOS SDK

Authentication SDK for partner banking apps (login, OTP, registration,
password recovery, MyID identity verification, passkeys). Distributed as a
closed-source binary XCFramework via Swift Package Manager.

## Requirements

- iOS 15.0+
- Xcode 15+

## Installation

In Xcode: **File → Add Package Dependencies…** and enter:

```
https://github.com/sudo-ulmas/pully-ios-sdk
```

Pin to an exact version (e.g. `1.1.1`). The MyID SDK is resolved automatically
as a transitive dependency.

## Host app setup

Add to your `Info.plist`:

- `NSCameraUsageDescription` — required by MyID face capture.

## Usage

```swift
import Pully

let request = AuthRequest(
    phoneNumber: "+998901234567",
    paymentSystemId: "<your payment system id>"
)
```

See the partner integration guide for the full `AuthRequest` / `AuthResult`
reference.

## Versioning

Semantic versioning. Breaking public-API changes only on major versions,
announced in advance. See [CHANGELOG.md](CHANGELOG.md).
