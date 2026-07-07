# Setup

1. Ubuntu cert

```
sudo cp ~/.certs/zscaler-root-ca.pem /usr/local/share/ca-certificates/zscaler-root-ca.crt
sudo update-ca-certificates
```

2. Set up nix

```
curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | sh -s -- --daemon
```

3. Set up flakes

```
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

4. Set up this repo

5. Apply the repo

```
  nix run home-manager -- switch --flake .
```

6. Set up Java cert for the jdk of your choice

```
keytool  -import  -trustcacerts -alias zscaler -file ~/.certs/zscaler-root-ca.pem -keystore ~/.jdks/temurin-26.0.1/lib/security/cacerts

```

7. Set up docker using the default docker intallation for Ubuntu
