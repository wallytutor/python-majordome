# Learn Haskell

## Resources

- [Haskell Documentation](https://www.haskell.org/documentation/)
- [Haskell Programming Full Course 2024 by BekBrace](https://www.youtube.com/watch?v=TklkNLihQ_A)
- [Haskell Tutorial by Derek Banas](https://www.youtube.com/watch?v=02_H3LjqMr8)
- [Functional Programming in Haskell by Graham Hutton](https://www.youtube.com/playlist?list=PLF1Z-APd9zK7usPMx3LGMZEHrECUGodd3)
- [Advanced Functional Programming in Haskell by Graham Hutton](https://www.youtube.com/playlist?list=PLF1Z-APd9zK5uFc8FKr_di9bfsYv8-lbc)

## Learning path

*WIP*

## Running from a container

Use the snippet below for creating a `Containerfile for a start, or pull an image directly from [Docker Hub](https://hub.docker.com/) if you prefer.

```dockerfile
FROM haskell:9.2

WORKDIR /opt/work
```

For building and running the container proceed as follows:

```bash
# Build from the provided container:
podman build -t learn-haskell -f Containerfile .

# Run from current working directory:
podman run -it -v $(realpath $(pwd)):/opt/work:Z learn-haskell
```

## Using GHCi

## Creating a stack project

```bash
# Create a new project and enter its directory:
stack new kinetics-oxidation-iron
cd kinetics-oxidation-iron

# Build and execute the project (notice the `-exe`):
stack build
stack exec kinetics-oxidation-iron-exe
```

```bash
stack exec kinetics-oxidation-iron-exe -- '<command arguments here>'
```

| | |
|---|---|
| .stack-work                   | Stack managed
| app                           | As you progress
| src                           | As you progress
| test                          | As you progress
| .gitignore                    | As you progress
| CHANGELOG.md                  | As you progress
| kinetics-oxidation-iron.cabal | Stack managed
| LICENSE                       | Check on creation
| package.yaml                  | Stack managed / user editable
| README.md                     | As you progress
| Setup.hs                      | Leave as is
| stack.yaml                    | Leave as is
| stack.yaml.lock               | Leave as is
