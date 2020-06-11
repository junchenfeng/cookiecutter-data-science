# Cookiecutter Data Science Build For Continuous Integration

_A logical, reasonably standardized, but flexible project structure for doing and sharing data science work, with a touch of ci flavor_

We build on top of the [original cookiecutter science](https://github.com/drivendata/cookiecutter-data-science)

The differences are:

 - Highlight the importance of tests and continuous integration
 - [Pipenv](https://pipenv.pypa.io/en/latest) replaces the pip + venv
 - [Black](https://pypi.org/project/black) replaces flake8 lint. Why check it if you can automate it
 - Default [luigi](https://luigi.readthedocs.io/en/stable/) as the task pipeline in the Pipfile 


### Requirements to use the cookiecutter template:
-----------
 - Python 3.5

``` bash
$ pip install cookiecutter
```

It is build for unix/linux environment. 

Sorry windows users. 

Sorry conda users.


### To start a new project, run:
------------

    cookiecutter https://github.com/junchenfeng/cookiecutter-data-science



### The resulting directory structure
------------

The directory structure of your new project looks like this: 

```
├── LICENSE
├── Makefile           <- Makefile with commands like `make data` or `make train`
├── README.md          <- The top-level README for developers using this project.
├── data
│   ├── external       <- Data from third party sources.
│   ├── interim        <- Intermediate data that has been transformed.
│   ├── processed      <- The final, canonical data sets for modeling.
│   └── raw            <- The original, immutable data dump.
│
├── docs               <- A default Sphinx project; see sphinx-doc.org for details
│
├── models             <- Trained and serialized models, model predictions, or model summaries
│
├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
│                         the creator's initials, and a short `-` delimited description, e.g.
│                         `1.0-jqp-initial-data-exploration`.
│
├── references         <- Data dictionaries, manuals, and all other explanatory materials.
│
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
│   └── figures        <- Generated graphics and figures to be used in reporting
│
├── Pipfile            <- use pipenv to manage python environment
│
├── .gitlab.yml        <- ci integreation script, use any flavor you like
│
├── src                <- Source code for use in this project.
│   ├── __init__.py    <- Makes src a Python module
│   │
│   ├── tests          <- code for continuous integration test
│   │   |
│   │   └── test_ci.py
│   │   └── test_unittest.py
|   |
│   ├── data           <- Scripts to download or generate data
│   │   └── make_dataset.py
│   │
│   ├── features       <- Scripts to turn raw data into features for modeling
│   │   └── build_features.py
│   │
│   ├── models         <- Scripts to train models and then use trained models to make
│   │   │                 predictions
│   │   ├── predict_model.py
│   │   └── train_model.py
│   │
│   └── visualization  <- Scripts to create exploratory and results oriented visualizations
│       └── visualize.py
│
└── .coveragerc        <- use coverage package, instead of tox, because the deployment routine has been moved to gitlab.yml
```
