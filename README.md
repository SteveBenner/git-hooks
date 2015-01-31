# Git Hooks
This is my personal collection git hooks, all written in Ruby. I have found that setting up a few hooks properly is *well* worth the effort, and their automation is a very straightforward process.

The first one that I implemented solved what had already become a massive headache for me, namely converting the whitespace in my source files from tabs into spaces. Before installing [this hook][1], I had uploaded dozens of files to GitHub with horribly skewed formatting, not even realizing the mistake due to my IDE hiding the actual formatting.

***todo: link to hook***

### Configuration
Git is elegant software that makes customization a piece of cake for developers. I keep my hooks in the local folder `~/.git-templates/`, and I configure the subdirectory `global/` as my *template directory* by adding the following two lines to my  `~/.gitconfig` file:

```aconf
[init]
  templatedir = '~/.git-templates/global'
```

[You can use other means to specify the template folder as well][1]--Git is very flexible. This setting ensures the contents of `global/` will be copied to every newly-initialized git repo (on `git init`).

## Global / default hooks
I symbolically link the local `global/` directory in this repo to `~/.git-templates/global/hooks/` so that given aforementioned config, all contained scripts will present by default in my local repositories.

### Pre-Commit

- **generate-img-previews**

    This script generates a Markdown README file with links to all the images in the same folder with a special file name suffix, so your boring old GitHub README turns into a spiffy image gallery.
    
### Post-Commit

- **convert-tabs-to-spaces**

    ~~This hook runs on all files that were modified in a commit, converting `\t` tabs within to spaces using Ruby. A `Hash` in the script specifies the tab width for each language.~~ **THIS IS CURRENTLY BROKEN**
    
    

[1]: http://git-scm.com/docs/git-init