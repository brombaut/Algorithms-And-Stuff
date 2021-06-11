#!/bin/bash
pandoc -s Notes.docx -t html -o README.md -N --toc --no-highlight -c README_styles.css