#!/bin/sh

files=$(find data/*)

# echo "$files"

echo '================================================================================'
echo 'load pg_denormalized'
echo '================================================================================'
# FIXME: implement this
echo "$files" | time parallel sh load_denormalized.sh # SCRIPT TO RUN IN PARALLEL

echo '================================================================================'
echo 'load pg_normalized'
echo '================================================================================'
echo "$files" | time parallel python3 -u load_tweets.py --db=postgresql://postgres:pass@localhost:1177/ --inputs

echo '================================================================================'
echo 'load pg_normalized_batch'
echo '================================================================================'
# echo "$files" | time parallel python3 -u load_tweets.py --db=postgresql://postgres:pass@localhost:1178/ --inputs
# echo "$files" | time parallel python3 -u load_tweets_batch.py --db=postgresql://postgres:pass@localhost:1178/ --inputs
# echo "data/geoTwitter21-01-10.zip" | time parallel python3 -u load_tweets_batch.py --db=postgresql://postgres:pass@localhost:1178/ --inputs
