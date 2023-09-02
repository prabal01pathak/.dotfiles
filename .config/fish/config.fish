fish_vi_key_bindings
export VISUAL=nvim
export EDITOR=nvim
alias vim="nvim"
set LD_LIBRARY_PATH  "$LD_LIBRARY_PATH:/nix/store/843dqq10jdkalr2yazaz6drx334visrb-gcc-12.2.0-lib/lib/"
if status is-interactive
    # Commands to run in interactive sessions can go here
end
export PATH="$HOME/.cargo/bin:$HOME/.bin:$PATH"
