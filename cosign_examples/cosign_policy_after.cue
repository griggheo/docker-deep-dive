import "time"

after: time.Parse(time.RFC3339, "2023-06-01T00:00:00Z")
// after: time.Parse(time.RFC3339, "2022-11-01T00:00:00Z")

// The predicateType field must match this string
predicateType: "cosign.sigstore.dev/attestation/v1"

// The predicate must match the following constraints.
predicate: {
    Timestamp: >=after
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
