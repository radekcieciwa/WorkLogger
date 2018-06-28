# WorkLogger
Your (ofc script based) personal assistant to help you track your work.

To setup commits observer use `install` script and pass:
1. Path to observed repo
2. `symbolic name` of the repo - meaningfull for you - script will use it to generate files

`install` script will:
1. Generate custom `post-commit` script locally in the repo (don't worry it's ignored by default, in a manner: `.post-commit_[symbolic name]`
2. Symbolicly Link it to `post-commit` of passed repo
3. Generate `empty log` file from symbolic name (in a manner: `[symbolic name].log`)
