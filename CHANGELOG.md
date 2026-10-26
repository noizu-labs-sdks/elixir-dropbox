# Changelog

## 2026-10-26

- docs: seed doc pointers — 9 loci in `.meta/pointers.yaml` + full-UUID markers on README, entry/core modules, and Files/Sharing API modules (PR #5)
- docs: doc-sweep (layout/arch/schema/threat-model) — corrected test-stub mechanism (`Mimic.copy(Finch)` + `finch_stub.ex`), `Metadata` field count, and documented `%Client{}` fields + `request_fun` transport hook; direct to `develop`

## 0.1.0

- Initial release: full Dropbox API v2 Elixir client
- Finch + Jason HTTP stack with supervised pool
- OAuth2 authorize / token exchange / refresh / PKCE
- API modules: Files, Sharing, Users, Account, Auth, Check, Paper,
  FileRequests, FileProperties, Contacts, OpenID
- Content upload/download with `Dropbox-API-Arg` / `Dropbox-API-Result`
- Team member context (`Dropbox-API-Select-User` / `Select-Admin`)
- Structured `Noizu.Dropbox.Error` and common response structs
