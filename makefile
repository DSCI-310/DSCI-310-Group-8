
   
# author: Anam Hira
# date: 2022-04-01

rmd: results/peg_stg.png results/maximum.csv results/minumum.csv results/observations.csv results/lm_predictions.png results/lm_rmse.csv results/ analysis/report.pdf


# generate figures and objects for report

# download data
data/raw/cleveland_raw.csv: src/download_data.r
	Rscript src/download_data.r --url=https://archive.ics.uci.edu/ml/machine-learning-databases/00257/Data_User_Modeling_Dataset_Hamdi%20Tolga%20KAHRAMAN.xls --file_path=data/raw/student_performance.xls

prepare: Rscript src/prepare_data.R
	Rscript src/prepare_data.r --file_path=data/raw/student_performance.xls --target_value=5 

results/peg_stg.png results/maximum.csv results/minumum.csv results/observations.csv: src/data_visualisation.R
	Rscript src/data_visualisation.R --df=../data/data_training.csv --results=/results

results/peg_stg.png results/maximum.csv results/minumum.csv results/observations.csv: src/summary_script.R
	Rscript src/summary_script.R --user_training=../data/data_training.csv --user_testing=../data/data_testing.csv --results=/results


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
