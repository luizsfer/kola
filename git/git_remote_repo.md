# Remote repository

**Show remote repository**: git remote
**Show remote repository verbose mode**: git remote -v
**Link remote repository to a local repository**: git remote add origin git@github.com:user/project.git
**Show remote repository information**: git remote show origin
**Rename remote repository**: git remote rename origin another-project
**Remove remote repository link with local**: git remote rm project

## Send files/directories to remote repository

**Send branch to remote repository**: git push

- If first push to remote repository: git push -u origin main

## Update local repository based in remote

**Update active branch**: git pull
**Get another remote branches, not apply**: git fetch
**Clone existing remote repository**: git clone git@github.com:leocomelli/curso-git.git

## Tags

**Create tag**: git tag vs-1.1
**Create tag with message**: git tag -a vs-1.1 -m "Version 1.1"
**Create signed tag**: git tag -s vs-1.1 -m "Signed tag 1.1"
*Private key GPG necessary*
**Create commit based tag**: git tag -a vs-1.2 <commit-hash>
**Crate tags in remote repository**: git push origin vs-1.2
**Create all local tags in remote repository**: git push origin --tags

## Branches

- Main branch called *main*
- *HEAD* is a special pointer that indicates the current branch.
- By default HEAD points to *main*

**Create a new branch**: git branch new-branch
**Use existing branch**: git checkout old-branch
**Create and use a new branch**: git checkout -b new-branch
**Back to original branch**: git checkout master
**Merge branches ()**: git merge bug-123
Para realizar o merge, é necessário estar no branch que deverá receber as alterações. O merge pode automático ou manual. O merge automático será feito em arquivos textos que não sofreram alterações nas mesmas linhas, já o merge manual será feito em arquivos textos que sofreram alterações nas mesmas linhas.

A mensagem indicando um merge manual será:

Automerging meu_arquivo.txt
CONFLICT (content): Merge conflict in meu_arquivo.txt
Automatic merge failed; fix conflicts and then commit the result.

**Delete branch**: git branch -d name-branch
**List branches**: git branch
**List branch verbose mode**: git branch -v
**List merged branches**: git branch --merged
**List no merged branches**: git branch --no-merged
**Create remote repository branch with same name**: git push origin new-branch
**Create remote repository branch with same name**: git push origin new-branch:new-branch2
**Get remote branch for edit**: git checkout -b new-branch origin/new-branch

## Rebasing

**Make rebase between branch and main**: 

- git checkout experiment
- git rebase master

## Stash

**Create stash**: git stash
**List stashes**: git stash list
**Back to last stash**: git stash apply
**Back to specific stash**: git stash apply stash@{*index*}
**Create brach over stash**: git stash branch meu_branch

## Reescrevendo o histórico

Alterando mensagens de commit: git commit --amend -m "Minha nova mensagem"
Alterar últimos commits: git rebase -i HEAD~3

edit f7f3f6d changed my name a bit
pick 310154e updated README formatting and added blame
pick a5f4a0d added catfile
Feche o editor de texto.

Digite o comando para alterar a mensagem do commit que foi marcado como edit.

git commit –amend -m “Nova mensagem”
Aplique a alteração

git rebase --continue
Atenção: É possível alterar a ordem dos commits ou remover um commit apenas mudando as linhas ou removendo.

Juntando vários commits
Seguir os mesmos passos acima, porém marcar os commtis que devem ser juntados com **squash

Remover todo histórico de um arquivo
git filter-branch --tree-filter 'rm -f passwords.txt' HEAD
Bisect
O bisect (pesquisa binária) é útil para encontrar um commit que esta gerando um bug ou uma inconsistência entre uma sequência de commits.

Iniciar pequinsa binária
git bisect start
Marcar o commit atual como ruim
git bisect bad
Marcar o commit de uma tag que esta sem o bug/inconsistência
git bisect good vs-1.1
Marcar o commit como bom
O GIT irá navegar entre os commits para ajudar a indentificar o commit que esta com o problema. Se o commit atual não estiver quebrado, então é necessário marca-lo como bom.

git bisect good
Marcar o commit como ruim
Se o commit estiver com o problema, então ele deverá ser marcado como ruim.

git bisect bad
Finalizar a pesquisa binária
Depois de encontrar o commit com problema, para retornar para o HEAD utilize:

git bisect reset