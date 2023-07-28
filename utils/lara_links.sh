#!/bin/bash

EXPIRES_SECS="604800"

declare -A BRUCH
BRUCH["Bruch_Accompaniment"]="s3://learningfromthelegends.com/LSJ/HD/LFTL Lara St. John Bruch Accompaniment 20150226.mp4"
BRUCH["Bruch_Bonus"]="s3://learningfromthelegends.com/LSJ/HD/LFTL Lara St. John Bruch Bonus 20150223.mp4"
BRUCH["Bruch_Movement_1"]="s3://learningfromthelegends.com/LSJ/HD/LFTL Lara St. John Bruch Mvt 1 20150223.mp4"
BRUCH["Bruch_Movement_2"]="s3://learningfromthelegends.com/LSJ/HD/LFTL Lara St. John Bruch Mvt 2 20150223.mp4"
BRUCH["Bruch_Movement_3"]="s3://learningfromthelegends.com/LSJ/HD/LFTL Lara St. John Bruch Mvt 3 20150223.mp4"
BRUCH["Bruch_Performance"]="s3://learningfromthelegends.com/LSJ/HD/LFTL Lara St. John Bruch Performance 20150223.mp4"

declare -A MENDELSSOHN
MENDELSSOHN["Mendelssohn_Accompaniment"]="s3://learningfromthelegends.com/LSJ/HD/LFTL Lara St. John Mendelssohn Accompaniment 20150226.mp4"
MENDELSSOHN["Mendelssohn_Bonus"]="s3://learningfromthelegends.com/LSJ/HD/LFTL Lara St. John Mendelssohn Bonus 20150223.mp4"
MENDELSSOHN["Mendelssohn_Movement_1"]="s3://learningfromthelegends.com/LSJ/HD/LFTL Lara St. John Mendelssohn Mvt 1 20150223.mp4"
MENDELSSOHN["Mendelssohn_Movement_2"]="s3://learningfromthelegends.com/LSJ/HD/LFTL Lara St. John Mendelssohn Mvt 2 20150223.mp4"
MENDELSSOHN["Mendelssohn_Movement_3"]="s3://learningfromthelegends.com/LSJ/HD/LFTL Lara St. John Mendelssohn Mvt 3 20150223.mp4"
MENDELSSOHN["Mendelssohn_Performance"]="s3://learningfromthelegends.com/LSJ/HD/LFTL Lara St. John Mendelssohn Performance 20150226.mp4"

for key in ${!BRUCH[@]}; do
    presignUrl=$(aws s3 presign "${BRUCH[${key}]}" --expires-in $EXPIRES_SECS)
    echo "\"${key}\",\"$presignUrl\""
done

for key in ${!MENDELSSOHN[@]}; do
    presignUrl=$(aws s3 presign "${MENDELSSOHN[${key}]}" --expires-in $EXPIRES_SECS)
    echo "\"${key}\",\"$presignUrl\""
done
