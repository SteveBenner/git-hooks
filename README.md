# Git Hooks
This is my personal collection git hooks, all written in Ruby. I have found that setting up a few hooks properly is *well* worth the effort, and their automation is a very straightforward process.

The first one that I implemented solved what had already become a massive headache for me, namely converting the whitespace in my source files from tabs into spaces. Before installing [this hook][1], I had uploaded dozens of files to GitHub with horribly skewed formatting, not even realizing the mistake due to my IDE hiding the actual formatting.

### Configuration
Git is elegant software that makes customization a piece of cake for developers. I configure the local folder `~/.git-templates/` as my *template directory* by adding the following two lines to `~/.gitconfig`:

```aconf
[init]
  templatedir = ~/.git-templates
```

Contents of this directory will now be copied to every newly-initialized git repo's `.git/` folder upon calling `git init`. [You can use other means to specify the template folder as well][1]--Git is very flexible.

To make my scripts available globally, I create a symbolic link from the source code at `~/github/git-hooks/global/` to `~/.git-templates/hooks/`. I think symbolic linking is a good strategy in this case because it provides you with a single point of control for ALL local Git hook operations, keeping things simple, stable, and secure. It also prevents gratuitous file duplication/versioning.

## Global / default hooks

### Pre-Commit

- **generate-img-previews**

    Generates a Markdown README file with links to all the images in the same folder with a special file name suffix, so your boring old GitHub README turns into a spiffy image gallery.
    
### Post-Commit

- **convert-indentation**

    Runs on all files that were modified in a commit, converting `\t` characters (tabs) within to spaces. The tab width for each language is defined statically within the script.
    
---
**TODO**

- Set up a system for calling multiple scripts
- Learn more about how hooks work!\
    

[1]: /post-commit/convert-indentation.rb