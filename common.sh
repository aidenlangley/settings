#!/bin/bash

# Variables
text_reset=$(tput sgr0)
text_bold=$(tput bold)
text_escape_seq_start="\e[1;"
text_escape_seq_end="m"
color_reset=$text_escape_seq_start"0"$text_escape_seq_end
color_red=$text_escape_seq_start"31"$text_escape_seq_end
color_green=$text_escape_seq_start"32"$text_escape_seq_end
color_yellow=$text_escape_seq_start"33"$text_escape_seq_end
color_white=$text_escape_seq_start"37"$text_escape_seq_end

# echo "Colours:"
# echo -e $color_green"test"$color_reset
# echo -e $color_red"test"$color_reset
# echo -e $color_yellow"test"$color_reset
# echo -e $color_white"test"$color_reset

# echo "Bold text:"
# echo -e "test"$text_bold "test"$text_normal
