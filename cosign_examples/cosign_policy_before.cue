import "time"

before: time.Parse(time.RFC3339, "2023-10-23T01:36:02Z")

// The predicateType field must match this string
predicateType: "cosign.sigstore.dev/attestation/v1"

// The predicate must match the following constraints.
predicate: {
    Timestamp: <=before
    Data: "test202305\n"
}

// This will fail because of the Timestamp condition
//predicate: {
//    Timestamp: <before
//    Data: "test1\n"
//}

// This will fail because of the Data element
//predicate: {
//    Timestamp: <=before
//    Data: "test2\n"
//}
