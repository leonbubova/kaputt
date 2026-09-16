    git switch -c feature/greeting; printf 'def greet():\n    return "hi"\n' > greeting.py
    git add greeting.py && git commit -m "Add greeting" && git switch main
