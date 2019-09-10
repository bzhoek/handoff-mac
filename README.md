# handoff-mac

Works together with https://github.com/bzhoek/handoff-ios to demonstrate Handoff and the Ubiquity key-value store.

For ubiquity to work, both `.entitlements` files need to have the same value for `com.apple.developer.ubiquity-kvstore-identifier`, i.e. `$(TeamIdentifierPrefix)com.zilverline.classroom`.

Actual updates appear to take ~3 seconds.
