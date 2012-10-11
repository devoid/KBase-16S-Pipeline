KBase16SPipeline
================

This is the repository for KBase services that process 16S Ribosomal
RNA datasets.


Development Deployment
----------------------

You must first install a KBase base image onto the machine
you are installing this project on. For macs, we have a
[disk image](http://kbase.us/docs/downloads/KBase-Mac.dmg) that
you should install into your `/Applications` directory.

For virtual machines running in the Magellan environment,
use the most recent version of the KBase image.

Once the base images is installed, checkout a `dev_container` and
the required modules, including this one into the modules directory:

    cd ~
    git clone kbase@git.kbase.us:dev_container.git
    cd ~/dev_container
    cd modules
    git clone kbase@git.kbase.us:typecomp.git 
    git clone https://github.com/devoid/KBase-16S-Pipeline.git 
    cd ..
    mkdir target

The next few steps depend on where your *runtime* environment
is installed. If you downloaded the Mac disk image and installed
the `KBase.app` into your `/Applications` directory your runtime
is at `/Applications/KBase.app/runtime`. If you used the Magellan
KBase image, the runtime directory is `/kb/runtime`. So export
that variable for simplicity:

- Mac OS X

        export KB_RUNTIME=/Applications/KBase.app/runtime

- Magellan

        export KB_RUNTIME=/kb/runtime

Now run the `bootstrap` script with the following arguments:

    DIR=`pwd` 
    ./bootstrap $KB_RUNTIME $DIR/target

This will deploy your code to the `target` directory you just
created. From here, you need to source the `user-env.sh` file
in the target directory:

    cd target
    source user-env.sh

This will change your `PATH` and `PERL5LIB` variables to point
to the software in the runtime directory.

Now you can run `make` and `make deploy` to deploy to the target
directory. Note that you may need to modify the top level Makefile
and replace the `TARGET` variable.
