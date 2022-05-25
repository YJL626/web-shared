#utils
print_tip() {
  count=${2:-20}
  result=
  while (($count > 0)); do
    {
      result="$result*"
      ((count--))
    }
  done
  count=${2:-20}
  result="${result}${1}"
  while ((count > 0)); do
    {
      result="$result*"
      ((count--))
    }
  done
  echo $result
  echo
}
show_enter_tip() {
  echo 'press enter to continue'
}
confirm_next_step() {
  print_tip "press enter to confirm,next step will be ${1}"
  read a
}
#block
show_increase_extent() {
  increase_extent=${v:-'patch'}
  print_tip "increase_extent=${increase_extent},set v enviroment to chang increase_extent"
  show_enter_tip
  read a
}
add_to_head() {
  echo 'input comment'
  read comment
  if ["$comment" -eq ""]; then
    echo 'comment is necessary' >&1
    exit 0
  fi
  git commit -m "${comment?:'comment is necessary'}" &&
    print_tip 'commit sucess'
}
push_to_remote() {
  print_tip 'push to remote?'
  read a
  clear
  git push
}
#l
is_npm_push=${is_npm_push:NULL}
if [$is_npm_push]; then
  {
    echo
  }
else
  {
    git status
    confirm_next_step 'add to index'
    git add .
    git status
    confirm_next_step 'add to HEAD'
    add_to_head
    git status
    confirm_next_step 'push to remote'
    git push
  }
fi
