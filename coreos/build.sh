#!/usr/bin/env nash

BINDIR  = $NASHPATH+"/lib/pgtuning/bin"
PATH    = $BINDIR+":"+$PATH
WORKDIR = $NASHPATH+"/lib/pgtuning/coreos/coreos"

setenv PATH

# check dependencies
-which repo >[1=]

if $status != "0" {
	curl https://storage.googleapis.com/git-repo-downloads/repo > $BINDIR+"/repo"
	chmod "a+x" $BINDIR+"/repo"
}

-which python2 >[1=]

if $status != "0" {
	echo "CoreOS repo tool requires Python2..."
	abort
}

pypath <= which python2 | xargs echo -n

ln -sf $pypath $BINDIR+"/python"

fn build() {
	-test -d $WORKDIR

	if $status != "0" {
		mkdir -p $WORKDIR

		chdir($WORKDIR)

		repo init -u https://github.com/coreos/manifest.git
		repo sync
	} else {
		chdir($WORKDIR)

		repo sync
	}

	./chromite/bin/cros_sdk
}
