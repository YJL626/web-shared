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
  echo
  echo
}
clear
git status
print_tip 'please confirm status,before add all files'
read a
#
clear
git add . &&
  git status &&
  print_tip 'add sucess, confirm status' &&
  read a
#
clear
print_tip 'input comment'

read comment

if ["$comment" -eq ""]; then
  echo 'comment is necessary' >&1
  exit 0
fi
git commit -m "${comment?:'comment is necessary'}" &&
  print_tip 'commit sucess'
#
print_tip 'push to remote?'
read a
clear
git push
