#!/usr/bin/env bash

cd lf && coq_makefile -f _CoqProject *.v -o Makefile && make
