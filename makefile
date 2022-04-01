
   
# author: Anam Hira
# date: 2022-04-01

rmd: results/peg_stg.png results/maximum.csv results/minumum.csv results/observations.csv  doc/rmd_example/rmd_example.html doc/rmd_example/rmd_example.pdf


# generate figures and objects for report



results/peg_stg.png results/maximum.csv results/minumum.csv results/observations.csv: source/generate_figures.R
	Rscript src/data_visualisation.R --df="../Downloads/Data_User_Modeling_Dataset_Hamdi Tolga KAHRAMAN.xls" --results="results"

results/peg_stg.png results/maximum.csv results/minumum.csv results/observations.csv: source/generate_figures.R
	Rscript src/summary_script.R --user_training="../Downloads/Data_User_Modeling_Dataset_Hamdi Tolga KAHRAMAN.xls" --user_testing="../Downloads/Data_User_Modeling_Dataset_Hamdi Tolga KAHRAMAN.xls" --results="/results"


# render R Markdown report in HTML and PDF
doc/rmd_example/rmd_example.html doc/rmd_example/rmd_example.pdf: doc/rmd_example/rmd_example.Rmd doc/rmd_example/references.bib
	Rscript -e "rmarkdown::render('doc/rmd_example/rmd_example.Rmd', c('bookdown::html_document2', 'bookdown::pdf_document2'))"

# render Jupyter Book report in HTML and PDF
#doc/jbook_example/_build/html/index.html: doc/jbook_example/_config.yml doc/jbook_example/_toc.yml doc/jbook_example/jbook_example.ipynb doc/jbook_example/references.bib
#	jb build doc/jbook_example/
#doc/jbook_example/_build/latex/python.pdf: doc/jbook_example/_config.yml doc/jbook_example/_toc.yml doc/jbook_example/jbook_example.ipynb doc/jbook_example/references.bib
#	jb build doc/jbook_example/ --builder pdflatex

# clean
clean:
	rm -rf results
	rm -rf doc/rmd_example/rmd_example.html doc/rmd_example/rmd_example.pdf
	rm -rf #doc/jbook_example/_build