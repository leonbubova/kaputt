#!/usr/bin/env bash
# one-shot setup for Ubuntu (station44) or macOS. Idempotent.
set -euo pipefail
ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
if [ "$(uname)" = Darwin ]; then
  brew list k3d >/dev/null 2>&1 || brew install k3d
  brew list helm >/dev/null 2>&1 || brew install helm
  brew list kubectl >/dev/null 2>&1 || brew install kubectl
else
  command -v docker >/dev/null || { curl -fsSL https://get.docker.com | sudo sh; sudo usermod -aG docker "$USER"; echo ">> re-login (or: newgrp docker) so your shell is in the docker group"; }
  command -v kubectl >/dev/null || { curl -fsSLo /tmp/kubectl "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"; sudo install -m755 /tmp/kubectl /usr/local/bin/kubectl; }
  command -v k3d >/dev/null || curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
  command -v helm >/dev/null || curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
fi
grep -q "k8s-wargame/bin" ~/.zshrc 2>/dev/null || echo "export PATH=\"$ROOT/bin:\$PATH\"" >> ~/.zshrc
grep -q "k8s-wargame/bin" ~/.bashrc 2>/dev/null || echo "export PATH=\"$ROOT/bin:\$PATH\"" >> ~/.bashrc
echo "done. open a new shell, then: wg start && wg level 1"
