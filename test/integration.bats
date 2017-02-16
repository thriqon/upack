#!/usr/bin/env bats

load helpers

@test "simple empty package is an ar archive" {
	upack -o - | file - | grep "Debian binary package"
}

@test "simple empty package contains a debian-binary descriptor" {
	upack -o $BATS_TMPDIR/test1.deb
	CODE=$(ar p $BATS_TMPDIR/test1.deb debian-binary)
	test "x$CODE" == "x2.0"
}
