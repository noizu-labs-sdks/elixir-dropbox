# AGENT-README

> Orientation for AI coding agents working in this repo. Human docs: README.md.

## Type

elixir-lib

## Purpose

Full Dropbox API v2 client for Elixir (`Noizu.Dropbox`): RPC endpoints, content upload/download, OAuth2 (short-lived tokens + refresh + PKCE), and user namespaces (files, sharing, users, account, auth, check, paper, file requests, file properties, contacts, OpenID).

## Stack

Elixir (~> 1.14). Runtime deps: Finch + Jason only; mimic + junit_formatter for test. OTP app `:noizu_dropbox` v0.1.0 (starts `Noizu.Dropbox.Application`).

## Dev mode

```bash
mix deps.get && mix compile
```

## Ports / URLs

- none (library/CLI)

## Tests

```bash
mix test            # mocked via Mimic — no live calls
mix test --cover
```

## Gotchas

- App config reads `DROPBOX_ACCESS_TOKEN`, `DROPBOX_REFRESH_TOKEN`, `DROPBOX_APP_KEY`, `DROPBOX_APP_SECRET` (`config :noizu_dropbox`); or build an explicit `%Client{}` per call.
- Tests stub Finch (`Mimic.copy(Finch)` + `finch_stub.ex`); live API calls need a real token — never commit one.
- Test coverage threshold is 30% (`mix.exs`) — thin API wrapper modules keep line coverage moderate by design.
