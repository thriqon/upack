
upack() {
	$BATS_TEST_DIRNAME/../upack "$@"
}

read_control_from() {
	ar p $1 control.tar.gz | tar zxf - -O ./control
}

