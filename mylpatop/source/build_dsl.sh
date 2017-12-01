#!/bin/bash
iasl -da -dl -fe refs.txt DSDT.aml SSDT*.aml
rm -f *.aml
