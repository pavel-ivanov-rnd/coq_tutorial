#!/usr/bin/env bash

SPATH=$(pwd)

if [[ $1 == "build" ]]; then
    cd $SPATH/lf  && coq_makefile -f _CoqProject *.v -o Makefile && make
    cd $SPATH/plf && coq_makefile -f _CoqProject *.v -o Makefile && make
    cd $SPATH/qc  && coq_makefile -f _CoqProject *.v -o Makefile && make
    cd $SPATH/slf && coq_makefile -f _CoqProject *.v -o Makefile && make
    cd $SPATH/vc  && coq_makefile -f _CoqProject *.v -o Makefile && make
    cd $SPATH/vfa && coq_makefile -f _CoqProject *.v -o Makefile && make
fi

if [[ $1 == "clean" ]]; then
    cd $SPATH/lf  && make clean
    cd $SPATH/plf && make clean
    cd $SPATH/qc  && make clean
    cd $SPATH/slf && make clean
    cd $SPATH/vc  && make clean
    cd $SPATH/vfa && make clean
fi
