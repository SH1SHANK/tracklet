# Please add these rules to your existing keep rules in order to suppress warnings.
# This is generated automatically by the Android Gradle plugin.
-dontwarn com.google.errorprone.annotations.CanIgnoreReturnValue
-dontwarn com.google.errorprone.annotations.CheckReturnValue
-dontwarn com.google.errorprone.annotations.Immutable
-dontwarn com.google.errorprone.annotations.RestrictedApi
-dontwarn javax.annotation.Nullable
-dontwarn javax.annotation.concurrent.GuardedBy
-dontwarn org.bouncycastle.jce.provider.BouncyCastleProvider
-dontwarn org.bouncycastle.pqc.jcajce.provider.BouncyCastlePQCProvider
-keep class org.xmlpull.v1.** { *; }




# LocationPermissionDescriptionforiOS
<!-- Location Permission Description for iOS -->
<!-- NSLocationWhenInUseUsageDescription: Required for iOS to request location access -->
<!-- This message is shown to users when the app requests location permission -->
<!-- The text explains WHY your app needs location access -->
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs access to your location to show nearby places and convert coordinates to addresses.</string>

<!-- NSLocationAlwaysUsageDescription: For background location access (if needed) -->
<!-- Only required if your app needs location when running in the background -->
<!-- For this custom action, "When In Use" permission is sufficient -->
<key>NSLocationAlwaysUsageDescription</key>
<string>This app needs access to your location to show nearby places even when the app is in the background.</string>

<!-- Optional: NSLocationAlwaysAndWhenInUseUsageDescription -->
<!-- Required for iOS 11+ if you need "Always" access -->
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>This app needs access to your location to provide location-based services.</string>
