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
#echo "<!DOCTYPE html>" >> posts/template.html
#echo "<html lang=\"en\">" >> posts/template.html
#echo "<head>" >> posts/template.html
#echo "<title>saadrasheed : blog</title>" >> posts/template.html
#echo "<link rel=\"stylesheet\" type=\"text/css\" href=\"../css/main.css\">" >> posts/template.html
#echo "<meta http-equiv=\"Content-type\" content=\"text/html;charset=UTF-8\">" >> posts/template.html
#echo "</head>" >> posts/template.html
#echo "<body>" >> posts/template.html
#echo "<div class=\"header\">" >> posts/template.html
#echo "<h1>Learn</h1>" >> posts/template.html
#echo "Millenium tech journey" >> posts/template.html
#echo "</div>" >> posts/template.html
#echo "<!-- Body starts here -->" >> posts/template.html
#echo " " >> posts/template.html
#echo "<div class=\"date\">${DOW}, ${MONTH} ${DAY}, ${YEAR}</div>" >> posts/template.html
#echo "<div class=\"post\">" >> posts/template.html
#echo "<h2> ${title} </h2>" >> posts/template.html
#echo "${para1}" >> posts/template.html
#echo " " >> posts/template.html
#echo "</div>" >> posts/template.html
#echo "<!-- List item -->" >> posts/template.html
#echo " " >> posts/template.html
#echo " " >> posts/template.html
#echo "<!--Footer starts here -->" >> posts/template.html
#echo "<div class=\"footer\">" >> posts/template.html
#echo "<a href=\"/\">saadrasheed</a>" >> posts/template.html
#echo "|" >> posts/template.html
#echo "<a href=\"rasheedsaad.com\">Contact</a>" >> posts/template.html
#echo "</div>" >> posts/template.html
#echo "</body>" >> posts/template.html
#echo "</html>" >> posts/template.html

head -8 -2 index.html

echo "<!--Footer starts here -->" >> index.html
echo "<div class="footer">" >> index.html
echo "<a href="/">saadrasheed</a>" >> index.html
echo "|" >> index.html
echo "<a href="rasheedsaad.com">Contact</a>" >> index.html
echo "</div>" >> index.html
echo "</body>" >> index.html
echo "</html>" >> index.html

