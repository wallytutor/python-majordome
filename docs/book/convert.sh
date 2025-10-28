### PARAMETERS

# CleanLevel="${1:-2}"

# ### CONVERT

# pandoc                           \
#     README.md                    \
#     src/scientific-computing.md  \
#     src/operating-systems.md     \
#     src/using-containers.md      \
#     src/programming-intro.md     \
#     src/programming-julia.md     \
#     src/programming-lisp.md      \
#     src/programming-other.md     \
#     src/simulation-elmer.md      \
#     src/simulation-openfoam.md   \
#     src/simulation-fluent.md     \
#     src/simulation-fluent-tui.md \
#     src/general-tips.md          \
#     src/_entering-software.md    \
#     src/_entering-science.md     \
#     --metadata-file=book.yaml    \
#     --template=book.tex          \
#     --biblatex                   \
#     --pdf-engine=xelatex         \
#     -o "book_.tex"

# ### BUILD

# xelatex book_.tex
# biber   book_
# xelatex book_.tex
# xelatex book_.tex

# ### CLEAN

# if [ $CleanLevel -gt 0 ]; then
#     rm -rf *.aux *.bbl *.bcf *.blg *.run.xml *.toc
# fi


# if [ $CleanLevel -gt 1 ]; then
#     rm -rf *.log book_.tex
# fi


### EOF