#find ./ -name '*.pyc' -exec rm {} \;
#find ./ -type f -exec dos2unix {} \;

FILE="GITLOG.md"
echo -e '```' > $FILE
git log --pretty=format:'%h : %s' --graph >> $FILE
echo -e '\n```' >> $FILE



