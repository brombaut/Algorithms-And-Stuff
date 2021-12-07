#!/bin/bash
pandoc -s Notes.docx -t html -N --toc --metadata title="Machine Learning Topics" | sed '/^<head>/,/^\<\/head>/{/^<head>/!{/^\<\/head>/!d;};}' > README.md