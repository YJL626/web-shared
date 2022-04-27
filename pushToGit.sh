git status
echo 'confirm'
read a
git add .
git status
echo 'confirm'
read a
echo 'input comment'
read comment
git commit -m \"$comment\"
