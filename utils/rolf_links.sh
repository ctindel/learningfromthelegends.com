#!/bin/bash

EXPIRES_SECS="604800"

declare -A HAYDN
HAYDN["Haydn_Accompaniment"]="s3://lftl.co/RS/HD/LFTL Rolf Smedvig Haydn Accompaniment 20150313.mp4"
HAYDN["Haydn_Bonus"]="s3://lftl.co/RS/HD/LFTL Rolf Smedvig Haydn Bonus 20150223.mp4"
HAYDN["Haydn_Movement_1"]="s3://lftl.co/RS/HD/LFTL Rolf Smedvig Haydn Mvt 1 20150223.mp4"
HAYDN["Haydn_Movement_2"]="s3://lftl.co/RS/HD/LFTL Rolf Smedvig Haydn Mvt 2 20150223.mp4"
HAYDN["Haydn_Movement_3"]="s3://lftl.co/RS/HD/LFTL Rolf Smedvig Haydn Mvt 3 20150223.mp4"

declare -A HUMMEL
HUMMEL["Hummel_Accompaniment"]="s3://lftl.co/RS/HD/LFTL Rolf Smedvig Hummel Accompaniment 20150911.mp4"
HUMMEL["Hummel_Bonus"]="s3://lftl.co/RS/HD/LFTL Rolf Smedvig Hummel Bonus 20150223.mp4"
HUMMEL["Hummel_Movement_1_RA"]="s3://lftl.co/RS/HD/LFTL Rolf Smedvig Hummel Mvt 1 RA 20150314.mp4"
HUMMEL["Hummel_Movement_1_TT"]="s3://lftl.co/RS/HD/LFTL Rolf Smedvig Hummel Mvt 1 TT 20150223.mp4"
HUMMEL["Hummel_Movement_2"]="s3://lftl.co/RS/HD/LFTL Rolf Smedvig Hummel Mvt 2 20150223.mp4"
HUMMEL["Hummel_Movement_3"]="s3://lftl.co/RS/HD/LFTL Rolf Smedvig Hummel Mvt 3 20150223.mp4"

for key in ${!HAYDN[@]}; do
    presignUrl=$(aws s3 presign "${HAYDN[${key}]}" --expires-in $EXPIRES_SECS)
    echo "\"${key}\",\"$presignUrl\""
done

for key in ${!HUMMEL[@]}; do
    presignUrl=$(aws s3 presign "${HUMMEL[${key}]}" --expires-in $EXPIRES_SECS)
    echo "\"${key}\",\"$presignUrl\""
done
