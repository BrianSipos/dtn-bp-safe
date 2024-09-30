# Bundle Protocol Security Associations with Few Exchanges (SAFE)

The internet-draft is tracked as [draft-sipos-dtn-bp-safe](https://datatracker.ietf.org/doc/draft-sipos-dtn-bp-safe/).

A local build of the current main branch is available [draft-sipos-dtn-bp-safe.html](https://briansipos.github.io/dtn-bp-safe/draft-sipos-dtn-bp-safe.html).
A difference from the datatracker draft and this local version can be [viewed side-by-side](https://author-tools.ietf.org/diff?doc_1=draft-sipos-dtn-bp-safe&url_2=https://briansipos.github.io/dtn-bp-safe/draft-sipos-dtn-bp-safe.txt&raw=1).

Prerequisites to building can be installed on Ubuntu with:
```
sudo apt-get install -y cmake python3 python3-pip python3-setuptools python3-wheel ruby xmlstarlet aspell cargo
pip3 install xml2rfc
sudo gem install cbor-diag
sudo cargo install --root /usr/local cddl
```

Then the document can be built with
```
cmake -S . -B build/default
cmake --build build/default
```

# Demo Convergence Layer Agent

The demo agent is in a separate project [dtn-demo-agent](https://github.com/BSipos-RKF/dtn-demo-agent).

# Wireshark Protocols and Dissectors

The wireshark modules are in a separate project [dtn-wireshark](https://github.com/BSipos-RKF/dtn-wireshark).
