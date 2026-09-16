Inside `box`, fetch the page through the Service name and save it.
    kubectl exec -it box -- sh      then inside:  wget -qO- http://web/ > /tmp/page.html ; exit
