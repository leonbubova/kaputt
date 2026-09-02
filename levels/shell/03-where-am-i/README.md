# where am I? — pwd, ls, cd
Lesson: the shell always "stands" inside one folder — the current folder. A plain file name like `hello.txt`
means "the one in this folder". Three commands to look around and move:
    pwd        print working directory — where am I?
    ls         list what is in the current folder
    cd NAME    go into folder NAME.   cd ..  goes one folder up.   cd  alone goes to your home folder.
Start here — from now on every lesson begins in the sandbox:
    cd ~/.k8s-wargame/shell/sandbox
    pwd
    ls
You see three folders: attic, garden, kitchen. Try `cd kitchen`, then `ls`, then `cd ..` to come back out.
Your task: go into the `kitchen` folder and, while standing there, create a file `i-was-here.txt` with any
text in it (lesson 1 showed how). Standing in the right folder, a plain file name is enough — no long path.
Check yourself:  wg check      stuck?  wg hint
