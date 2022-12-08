# `release.sh`

This is a simple script that I use to create GitHub releases.

It starts with a `RELEASE_NOTES` file, in which I write notes for a pending
release in Markdown format. When I'm ready to create a release, I run
`release.sh tag-name`, which uses `RELEASE_NOTES` for the tag message. To
support Markdown, it temporarily changes `core.commentChar` in the git
configuration to `;`.

When creating pre-releases, you can set `RELEASESH_PRERELEASE` to `1`.
If you're *not* creating a pre-release, then `RELEASE_NOTES` the script
will clear the contents of that file and commit the reset.