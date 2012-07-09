#compdef mememaker
typeset -A opt_args
local context state line curcontext="$curcontext"

_arguments \
  '(- : *)'{-h,--help}"[show help]" \
  '(-l --list)*'{-l,--list}"[list out all them memes by number]" \
  '(-s --split)*'{-s,--split}"[create a split meme (optionally add # for both memes after flag)]: :_path_files -W "INSTALL_DIR/share/mememaker/memes/" -g '*(\:r)': :_path_files -W "INSTALL_DIR/share/mememaker/memes/" -g '*(\:r)'" \
  '(-m --meme)*'{-m,--meme}"[create a meme (optionally add # for meme after flag)]: :_path_files -W "INSTALL_DIR/share/mememaker/memes/" -g '*(\:r)'" \
  '(-t --top)*'{-t,--top}"[top caption]" \
  '(-b --bottom)*'{-b,--bottom}"[bottom caption]" \
  '(-a --add)*'{-a,--add}"[add meme]: :_files -g '*.jpg'" 
