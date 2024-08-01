#!/bin/bash

fd '.xlsx' | xargs -I {} bash -c 'in="{}"; base=$(basename "$in" .xlsx); ssconvert -S --export-type=Gnumeric_stf:stf_csv "$in" "$base-%s.csv"'
