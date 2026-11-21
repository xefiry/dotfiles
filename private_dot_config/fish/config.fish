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
  python3 $argv
end

function mpv -d "Alias for 'flatpak run io.mpv.Mpv'"
  flatpak run io.mpv.Mpv $argv
end

function codium -d "Alias for 'com.vscodium.codium'"
  flatpak run com.vscodium.codium $argv
end

function freetube -d "Start FreeTube with unison sync"
  if pgrep -x freetube >/dev/null
    echo "Freetube is already running"
    return 1
  end

  unison -ui text freetube; and \
  flatpak run io.freetubeapp.FreeTube; and \
  unison -ui text freetube
end

function mpv_stream -a streamer -d "Watch Twitch stream using mpv and streamlink"
  if test (count $argv) -eq 0
    echo "Missing argument"
    return 1
  else if test (count $argv) -gt 1
    echo "Too many arguments"
    return 1
  end

  uvx streamlink -p "flatpak" -a "run io.mpv.Mpv" "https://www.twitch.tv/$streamer" best
end
