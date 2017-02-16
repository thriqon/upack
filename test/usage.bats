#!/usr/bin/env bats

load helpers

@test "shows usage with -h" {
	upack -h | egrep "[uU]sage"
}

@test "shows usage with --help" {
	upack --help | egrep "[uU]sage"
}

@test "passing -v gives version info" {
	upack -v | egrep "upack"
}

@test "passing --version gives version info" {
	upack --version | egrep "upack"
}
