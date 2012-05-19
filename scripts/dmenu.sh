#!/bin/sh
`dmenu_path | dmenu -b -fn 'terminus-12' -nb '#000000' -nf '#FFFFFF' -sb '#0066ff'` && eval "exec $exe"

