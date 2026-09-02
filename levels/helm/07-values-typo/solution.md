`values.yaml` has `tagg:`; template reads `.Values.image.tag` → image renders as `nginx:`.
    sed -i "" 's/tagg:/tag:/' web/values.yaml && helm upgrade web ./web -n wg-helm
