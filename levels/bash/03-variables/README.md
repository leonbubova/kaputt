# variables: give a value a name
Lesson: a script can remember a value under a name. `city=Berlin` stores the text Berlin under the name `city` —
no spaces around the `=`, that is the rule that bites everyone. From then on `$city` (dollar, name) means "the value
stored in city". Put it inside a double-quoted string and it is replaced by its value:
    city=Berlin
    echo "I live in $city"          → I live in Berlin
Always use double quotes around text that contains a $name — single quotes would print the letters $city as they are.
Try it — type these lines in the terminal, one at a time:
    animal=cat
    echo "my $animal sleeps"
    echo 'my $animal sleeps'
Your task: make a script `vars.sh` in `~/.k8s-wargame/bash/work` (shebang, chmod +x, like lesson 2) that stores Berlin in a variable
named `city` and prints `I live in Berlin` using that variable — the word Berlin appears only once in the file, in the `city=` line.
Work in `~/.k8s-wargame/bash/work` — `wg shell` drops you there. Make the file with any editor (`nano vars.sh`, or VS Code: `code ~/.k8s-wargame/bash/work`).
Check yourself:  wg check      stuck?  wg hint
