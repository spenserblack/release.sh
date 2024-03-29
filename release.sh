#!/bin/bash

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Generates a release tag from RELEASE_NOTES, temporarily setting
# comments to ; to permit Markdown, creates the tag, then
# clears RELEASE_NOTES and resets git comments.
#
# source: https://github.com/spenserblack/release.sh
set -e

TAG_NAME=$1
TAG_TARGET=$2
RELEASESH_PRERELEASE=${RELEASESH_PRERELEASE:-0}

# NOTE: Uncomment if used in a Ruby project
# echo "$TAG_NAME" | sed 's/^v//' > lib/<NAME>/VERSION
# git add lib/<NAME>/VERSION
# git commit -m "Update <NAME>::VERSION"

git tag -F RELEASE_NOTES --cleanup=verbatim $TAG_NAME $TAG_TARGET

if [ $RELEASESH_PRERELEASE -eq 0 ]; then
	echo > RELEASE_NOTES
	git add RELEASE_NOTES
	git commit -m "Reset RELEASE_NOTES"
fi
