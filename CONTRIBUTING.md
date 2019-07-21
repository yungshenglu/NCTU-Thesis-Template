# Contributing

Thanks for contributing this repository. The following steps are show how to join the contribution with us. Please read the following content before contributing. Thanks for your cooperation.

---
## Pull requests

1. Fork this repository and clone the repository you forked
    ```bash
    # Clone your fork of the repo into the current directory
    $ git clone https://github.com/<YOUR_USERNAME>/nctu-thesis-template
    # Navigate to the newly cloned directory
    $ cd nctu-thesis-template
    ```
2. Create new branch named `develop` and switch to this branch
    ```bash
    # Create a new branch named develop
    $ git branch develop
    # Switch to branch named develop
    $ git checkout develop
    ```
3. Assign the original repository to a remote called `upstream` and update
    ```bash
    # Assign the original repo to a remote called "upstream"
    $ git remote add upstream https://github.com/yungshenglu/nctu-thesis-template
    # Update to remote repository
    $ git remote update
    ```
4. Pull the latest version from our repository and merge to your branch
    ```bash
    # Pull the latest version from our repository
    $ git fetch upstream master
    # Merge our latest version to your branch
    $ git rebase upstream/master
    ```

---
## License

[GNU GENERAL PUBLIC LICENSE Version 3](LICENSE)
