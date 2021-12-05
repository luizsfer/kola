# Local repository

**New repository**: git init
Verificar estado dos arquivos/diretórios
**Repository Informations**: git status

## Staged area

**Add file ou directory**: git add example.txt
**Add all modified files**: git add .
**Interactively choose modified files**: git add -p
**Force add (ignored files)**: git add -f ignored.txt

## Commit file / directory

**Commit file**: git commit file1.txt
**Commit multiple files**: git commit file1.txt file2.txt
**Commit with message**: git commit file.txt -m "commit message"

## Remove files from working tree

**Remove**: git rm file.txt
**Remove directory with recursion**: git rm -r diretorio

## History

**Show history**: git log
**Show diff between last 2 modifications**: git log -p -2
**Show history summary**: git log --stat
**Show summary in one line**: git log --pretty=oneline
**Show specific format**: git log --pretty=format:"%h - %an, %ar : %s"

- %h: hash
- %an: author
- %ar: date
- %s: comment

**Show specific file history**: git log -- <path>
**Show specific file history contains a word**: git log --summary -S <word> [<path>]
**Show actions history from file**: git log --diff-filter=M -- <path>

- --diff-filter=A : added
- --diff-filter=C : copied
- --diff-filter=D : deleted
- --diff-filter=M : modified
- --diff-filter=R : renamed

**Show history from specific author**: git log --author=user
**Show reviewer and author from last modify from line block**: git blame -L 12,22 file.txt

# Undo operations

**Undo modify when not staged file**: git checkout -- file.txt
**Undo modify when staged file**: git reset HEAD file.txt

- If showed:

```bash
Unstaged changes after reset:
M file.txt
```

Use: git checkout file.txt
