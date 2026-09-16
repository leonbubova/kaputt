## 1
`kubectl logs talker` prints what the pod wrote. One of the lines contains "the secret word is:" — the word after the colon is the answer.
## 2
Then `echo THE-WORD > ~/.k8s-wargame/k8s/word.txt` — only the word, no "the secret word is".
## 3
    kubectl logs talker
    echo tangerine > ~/.k8s-wargame/k8s/word.txt
