# homebrew-tap

Homebrew formulae that allows installation of Onlooker tools through the
[Homebrew](https://brew.sh) package manager.

## Installation

```sh
brew tap onlooker-community/tap
brew trust onlooker-community/tap
brew install <FORMULA>
```

Homebrew 6 will not load a formula from a third-party tap unless you have
trusted the tap, or you name it in full on the command line. The `brew trust`
line above covers the everyday cases: installing `<FORMULA>` by its short name,
and — the one that actually bites — a bare `brew upgrade`, which names no tap,
so an untrusted formula is refused and passed over on a machine where the
install itself worked fine.

Trusting the tap covers anything added here later. You can trust a single
formula instead, with `brew trust --formula onlooker-community/tap/onlooker`,
but then every formula added to this tap needs its own trust step.

## Formulae

| Repository                                                 | Formula                          | Description                |
| ---------------------------------------------------------- | -------------------------------- | -------------------------- |
| [onlooker](https://github.com/onlooker-community/onlooker-cli) | [formula](./Formula/onlooker.rb) | CLI agent for Onlooker App |
