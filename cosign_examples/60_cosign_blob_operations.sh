#!/bin/bash

echo "my first artifact" > artifact
BLOB_SUM=$(shasum -a 256 artifact | cut -d' ' -f 1)
echo BLOB_SUM=$BLOB_SUM
RND=$(uuidgen | head -c 8 | tr 'A-Z' 'a-z')
BLOB_NAME=my-artifact-$RND
echo BLOB_NAME=$BLOB_NAME
BLOB_URI=ttl.sh/$BLOB_NAME:1h
BLOB_URI_DIGEST=$(cosign upload blob -f artifact $BLOB_URI)
echo $BLOB_URI_DIGEST

crane ls ttl.sh/$BLOB_NAME
#Uploading file from [artifact] to [ttl.sh/my-artifact-41edcd17:1h] with media type [text/plain]
#File [artifact] is available directly at [ttl.sh/v2/my-artifact-41edcd17/blobs/sha256:c69d72c98b55258f9026f984e4656f0e9fd3ef024ea3fac1d7e5c7e6249f1626]
#Uploaded image to:
#ttl.sh/my-artifact-41edcd17@sha256:d3d5dac02d390a83b22db0ef6147d20dfee065aa07f5e64a3432e5f8bfb30524

# Then
# curl -L ttl.sh/v2/my-artifact-41edcd17/blobs/sha256:c69d72c98b55258f9026f984e4656f0e9fd3ef024ea3fac1d7e5c7e6249f1626 > artifact-fetched

# The digest is baked right into the URL, so we can check that as well:

# cat artifact-fetched | shasum -a 256
# c69d72c98b55258f9026f984e4656f0e9fd3ef024ea3fac1d7e5c7e6249f1626 -
