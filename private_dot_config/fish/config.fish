# Set prompt
fish_config prompt choose nim
set __fish_git_prompt_showupstream informative
set __fish_git_prompt_char_upstream_ahead ↑
set __fish_git_prompt_char_upstream_behind ↓
set fish_prompt_pwd_dir_length 0

function firefox_tools -d "Run firefox_tool from PythonScripts"
  uv run --directory $HOME/Code/xefiry/PythonScripts/ python -m firefox_tools $argv
end

function py -d "Alias for python3"
  python3
end
