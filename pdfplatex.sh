#!/bin/sh
platex "$1" && dvipdfmx -o "`basename "$1" .tex`".pdf "`basename "$1" .tex`".dvi