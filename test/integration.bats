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

@test "simple empty package contains a control.tar.gz" {
	upack -o $BATS_TMPDIR/test2.deb -H Name:Test
	ar t $BATS_TMPDIR/test2.deb | grep control.tar.gz
}

@test "simple empty package contains a control file with the package name" {
	upack -o $BATS_TMPDIR/test3.deb -H Name:Test
	read_control_from $BATS_TMPDIR/test3.deb | grep Name
}

@test "simple empty package contains a control file with the package name 'alpha beta gamma'" {
	# this is just for testing string parsing. Spaces are not allowed in package names, though.
	upack -o $BATS_TMPDIR/test3.deb -H Name:\ \ \ alpha\ beta\ gamma\ \ 
	read_control_from $BATS_TMPDIR/test3.deb | grep "Name: alpha beta gamma"
}
