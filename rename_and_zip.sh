# define corresponding author
cauthor=vilhuber
# manuscript zip file name
mzip=manuscript-latex-${cauthor}.zip
# overall zip file for attaching to email
fzip=submission-${cauthor}.zip

# create latex zipfile
[[ -f $mzip ]] && rm -i $mzip
zip $mzip PP-Article.{bbl,aux,tex} template.tex title-info.tex figure.tex appendix.tex acrodefs.tex
git mv PP-Article.pdf manuscript-${cauthor}.pdf
git mv appendix-abowd-schmutte-sexton-${cauthor}.pdf  appendix-${cauthor}.pdf
git mv Coversheet.pdf Coversheet-${cauthor}.pdf
git mv Disclosure_statement.pdf Disclosure_statement-${cauthor}.pdf
git mv Abstract.docx Abstract-${cauthor}.docx

# create submission zip
[[ -f $fzip ]] && rm -i $fzip
zip $fzip Coversheet-${cauthor}.pdf Disclosure_statement-${cauthor}.pdf 2019_DataAvail*pdf 2019_Copyright*pdf  Abstract-${cauthor}.docx manuscript-${cauthor}.pdf $mzip appendix-${cauthor}.pdf 
