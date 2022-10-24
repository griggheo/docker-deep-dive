package signature

allow[msg] {
 input.predicate.Data != "foo\n"
 msg := sprintf("unexpected data: %v", [input.Data])
}

#allow[msg] {
# before = time.parse_rfc3339_ns("2021-11-10T17:10:27Z")
# actual = time.parse_rfc3339_ns(input.Timestamp)
# actual != before
# msg := sprintf("unexpected time: %v", [input.Timestamp])
#}
