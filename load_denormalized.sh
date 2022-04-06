# loads denormalized data in a parallel manner

unzip -p "$1" | sed 's/\\u0000//g' | psql postgresql://postgres:pass@localhost:1176/ -c "COPY tweets_jsonb(data) FROM STDIN csv quote e'\x01' delimiter e'\x02';"