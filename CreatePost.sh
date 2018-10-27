#!/usr/bin/env bash

# Figure out the last post #, increment and create that post
FILEL=$(ls posts/* | tail -1)
FILEC=$(basename -- "$FILEL")
FILEC="${FILEC%%.*}"
FILEF="$(($FILEC + 1))"
echo $FILEF

additional="y"

echo "Enter Title of Blog Post"
read title

echo "Enter first Paragraph"
read para1
para1="<p>$para1</p>"

echo "Are there additional paragraphs? y or n"
read additional

# If user says yes create additional paragraphs
while [ "$additional" == "y" ]
do
    echo "Enter additional paragraph"
    read tmp
    para1+="<p>$tmp</p>"
    echo "Are there additional paragraphs? y or n"
    read additional
done

MONTH="$(date +%B)"
DAY="$(date -d "$D" '+%d')"
YEAR="$(date -d "$D" '+%Y')"
DOW="$(date +'%A')"

echo "${title}"
echo "${para1}"
echo "<!DOCTYPE html>" >> posts/${FILEF}.html
echo "<html lang=\"en\">" >> posts/${FILEF}.html
echo "<head>" >> posts/${FILEF}.html
echo "<title>saadrasheed : blog</title>" >> posts/${FILEF}.html
echo "<link rel=\"stylesheet\" type=\"text/css\" href=\"../css/main.css\">" >> posts/${FILEF}.html
echo "<meta http-equiv=\"Content-type\" content=\"text/html;charset=UTF-8\">" >> posts/${FILEF}.html
echo "</head>" >> posts/${FILEF}.html
echo "<body>" >> posts/${FILEF}.html
echo "<div class=\"header\">" >> posts/${FILEF}.html
echo "<h1>Learn</h1>" >> posts/${FILEF}.html
echo "Millenium tech journey" >> posts/${FILEF}.html
echo "</div>" >> posts/${FILEF}.html
echo "<!-- Body starts here -->" >> posts/${FILEF}.html
echo " " >> posts/${FILEF}.html
echo "<div class=\"date\">${DOW}, ${MONTH} ${DAY}, ${YEAR}</div>" >> posts/${FILEF}.html
echo "<div class=\"post\">" >> posts/${FILEF}.html
echo "<h2> ${title} </h2>" >> posts/${FILEF}.html
echo "${para1}" >> posts/${FILEF}.html
echo " " >> posts/${FILEF}.html
echo "</div>" >> posts/${FILEF}.html
echo "<!-- List item -->" >> posts/${FILEF}.html
echo " " >> posts/${FILEF}.html
echo " " >> posts/${FILEF}.html
echo "<!--Footer starts here -->" >> posts/${FILEF}.html
echo "<div class=\"footer\">" >> posts/${FILEF}.html
echo "<a href=\"/\">saadrasheed</a>" >> posts/${FILEF}.html
echo "|" >> posts/${FILEF}.html
echo "<a href=\"rasheedsaad.com\">Contact</a>" >> posts/${FILEF}.html
echo "</div>" >> posts/${FILEF}.html
echo "</body>" >> posts/${FILEF}.html
echo "</html>" >> posts/${FILEF}.html

# Delete Footer
sed -i index.html -e :a -e '$d;N;2,8ba' -e 'P;D'

# Add post
echo "<div class=\"date\">${DOW}, ${MONTH} ${DAY}, ${YEAR}</div>" >> index.html
echo "<div class=\"post\">" >> index.html
echo "<ul>" >> index.html
echo "<li><a href=\"posts/${FILEF}.html\">${title}</a>" >> index.html
echo "</ul>" >> index.html
echo "</div>" >> index.html

# Put footer back
echo "<!--Footer starts here -->" >> index.html
echo "<div class=\"footer\">" >> index.html
echo "<a href=\"/\">saadrasheed</a>" >> index.html
echo "|" >> index.html
echo "<a href=\"rasheedsaad.com\">Contact</a>" >> index.html
echo "</div>" >> index.html
echo "</body>" >> index.html
echo "</html>" >> index.html

