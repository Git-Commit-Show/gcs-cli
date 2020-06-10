#!/bin/bash

FILE_PATH="md"
ORG="Git-Commit-Show"
REPO="volunteers"
URL="https://api.github.com/repos/$ORG/$REPO"
TREE="$URL/git/trees"
BLOB="$URL/git/blobs"

echo "Let us get the latest commit..."
# curl -sS $URL/commits


# NEED TO FIND LATEST COMMIT SHA
SHA="d2910fb67a0fbb2ba310cb2e240564612bbec958"


# GET DIR LISTING
DIR=$TREE/$SHA


# FIND PATH=2020, and it's URL
PATH_SHA="4661d8397ffbd0bd37aad28d9bc95ccb478b4a7a"
FILES=$TREE/PATH_SHA


# ITERATE THRU EACH FILE, GET BLOB URL AND NAME
NAME="parth.md"
BLOB_SHA="348e8d35ff261bf368ca04d765638e42180e945f"
BLOB_URL=$BLOB/$BLOB_SHA

# GET content FROM EACH BLOB

CONTENT="IyMgRGV0YWlscwoKMS4gTmFtZTogUGFydGggS3Jpc2huYSAgIAoyLiBUd2l0\ndGVyOiBbdmltb3ZlcmVtYWNzXShodHRwczovL3d3dy50d2l0dGVyLmNvbS92\naW1vdmVyZW1hY3MpICAgCjMuIExpbmtlZEluOiBbUGFydGggS3Jpc2huYV0o\naHR0cHM6Ly93d3cubGlua2VkaW4uY29tL2luL3BhcnRoa3Jpc2huYSkgICAK\n"

# SED TO REPLPACE \n
OUTPUT="${CONTENT//\\n/}"

# RESULT=`echo -n $OUTPUT | base64 --decode`
echo -n $OUTPUT | base64 --decode > $FILE_PATH/$NAME

#echo $RESULT
cat $NAME


