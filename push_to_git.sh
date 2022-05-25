#!/bin/bash
#utils
print_tip() {
  count=${2:-20}
  result=
  placehold=
  while (($count > 0)); do
    {
      result="$result${placehold}"
      ((count--))
    }
  done
  count=${2:-20}
  result="${result}${1}"
  while ((count > 0)); do
    {
      result="${result}${placehold}"
      ((count--))
    }
  done
  echo
  echo $result
}
show_enter_tip() {
  echo 'press enter to continue'
}
confirm_next_step() {
  print_tip "press enter to confirm,next step will be ${1}"
  read a
}
#block
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
show_status() {
  clear
  git status
}
{
  show_status
  confirm_next_step 'add to index'
  git add .
  show_status
  confirm_next_step 'add to HEAD'
  add_to_head
  confirm_next_step 'push to remote'
  echo '>>>>>>>'
  git push
}
