## Continuous Integration

### Pipeline

1. Automated Code Formatting  
As long as we can remember, what style to use for formatting code has been a matter of personal taste, company policy and heated debate. The argument will be endless, and your team will be exhausted. Considering that, we highly recommend `black`, which can let you focus on what your code does rather than how it looks.  
We solve this by `git pre-commit hooks`.

2. Sonar Lint  
Careless bugs, nested for-loops and if-clause, all around magic numbers, and so on. Check it, and automate it.

3. Prepare Virtualenv for Tests  
Your python app, always run with a virtualenv.

4. Testing and Report Coverage  

5. Integration  
Congratulations!


### Usage

1. Create your own pipenv;  
```bash
pipenv --three
pipenv shell
pipenv install -d --skip-lock
```
2. Remove config.sh.sample, create config.sh, and make variables meaningful;
3. If necessary, choose your own notify method, I use 钉钉 here.
