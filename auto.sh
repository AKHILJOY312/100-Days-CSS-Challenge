#!/bin/bash

# ---------- CREATE DAY FOLDER ----------
if [ "$1" = "-f" ]; then
    echo "Enter Day Number:"
    read day

    folder="Day_$day"

    mkdir -p "$folder"

    touch "$folder/script.js"
    touch "$folder/style.css"

    cat <<EOF > "$folder/index.html"
<!doctype html>
<html>
  <head>
    <title>Css Challenge Day $day</title>
    <link rel="stylesheet" href="style.css" />
  </head>
  <body>

    <script src="script.js"></script>
  </body>
</html>
EOF

    echo "Created $folder with files."
fi


# ---------- GIT PUSH ----------
if [ "$1" = "-git" ]; then
    echo "Enter commit message:"
    read msg

    git add .
    git commit -m "$msg"
    git push origin main

    echo "Changes pushed to GitHub."
fi