# I5TSA · Time Series Analysis with R

A Quarto website and working template for practicals (TP) and assignments in Time Series Analysis. The source files are editable `.qmd` notebooks; Quarto runs their R code and builds a browsable site.

## Quick start

Install [R](https://cran.r-project.org/) and [Quarto](https://quarto.org/docs/get-started/). RStudio is optional. From this folder, install the small set of R packages and render the site:

```sh
Rscript scripts/setup.R
quarto render
```

Open `_site/index.html`, or run `quarto preview` for a local preview. On Windows PowerShell, if `Rscript` is not on `PATH`, run its full path (for example, `& 'C:\Program Files\R\R-4.4.1\bin\Rscript.exe' scripts/setup.R`).

## Project layout

| Path | Purpose |
| --- | --- |
| `index.qmd` | Website home page |
| `practice/` | Course practice and textbook chapter exercises (Cryer & Chan) |
| `TP01/`, `TP02/` | Course practicals; add one folder per TP |
| `assignments/` | Assignment index and completed work |
| `templates/` | Copyable practical and assignment starters |
| `data/` | Notes for datasets used in your work |
| `scripts/setup.R` | Install packages needed to render the current site |
| `_quarto.yml` | Site navigation and rendering options |
| `.github/workflows/publish.yml` | Render checks and GitHub Pages publication |

## Add your work

1. Copy `templates/practical.qmd` to `TP03/tp03.qmd`, or `templates/assignment.qmd` to `assignments/assignment-01.qmd`.
2. Replace the title, source, questions, code, and interpretation prompts. Cite the handout or book rather than copying long passages into a public page.
3. Add the new file to `project.render` and the navbar in `_quarto.yml`.
4. Run `quarto render` and inspect the generated page before committing.

Use project-relative file paths, such as `data/my-series.csv`. Document units, dates, frequency, missing values, and transformations. Put `set.seed(...)` immediately before simulations. Do not commit private datasets, credentials, or downloaded package libraries.

## Publish on GitHub Pages

The repository is ready for a GitHub Pages workflow, but needs your GitHub repository and Pages settings. From this folder:

```sh
git init
git branch -M main
git add .
git commit -m "Create time series analysis course template"
git remote add origin https://github.com/PHALMenghak/time-series-analysis-courses.git
git push -u origin main
```

Create an empty GitHub repository first and replace `USERNAME/REPOSITORY`. In **Settings → Actions → General → Workflow permissions**, select **Read and write permissions**. In **Settings → Pages**, choose **Deploy from a branch**, branch `gh-pages`, folder `/ (root)` once the workflow creates the branch. The workflow renders on pull requests and publishes pushes to `main`.

The supplied course PDFs are excluded by `.gitignore` because the public repository should contain your own work unless you have permission to redistribute the handouts. If you have permission, decide explicitly whether to add them.

## Reproducibility

The current site uses base R and the CRAN `TSA` package for its textbook datasets. `scripts/setup.R` also installs `knitr` and `rmarkdown`, which Quarto uses to run R chunks. Record additional packages in that script when you add them. Package versions are not locked; for stricter reproducibility, add an `renv` lockfile before a long-term research project.

The [Quarto GitHub Pages guide](https://quarto.org/docs/publishing/github-pages.html) explains the publication workflow and repository settings.
