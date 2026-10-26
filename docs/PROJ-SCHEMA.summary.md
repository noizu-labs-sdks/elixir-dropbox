# PROJ-SCHEMA (summary)

No relational/KV store — API client library. Structured data:

- **Config** `config :noizu_dropbox`: credentials (`access_token`,
  `refresh_token`, `app_key`, `app_secret` — all default nil) + endpoint bases
  (`api_base`, `content_base`, `notify_base`, `oauth_base`, `authorize_url`)
  + timeouts (`receive_timeout` 120s, `pool_timeout` 60s).
- **Client struct** (`%Noizu.Dropbox.Client{}`): per-call overrides
  `select_user`/`select_admin` (team headers), `path_root` (`Dropbox-API-Path-Root`),
  `finch` pool name. `HTTP` also reads app-env `:request_fun` (custom/test transport hook).
- **OAuth payloads** (`lib/dropbox/oauth.ex`): form-POST token/refresh; response
  map with `access_token`/`refresh_token`/`expires_in`/`scope`; PKCE S256 pair
  via `pkce_pair/0`. Secret in Basic header or body, never both.
- **Response structs** (`lib/dropbox/struct/`): `Account` (16 fields),
  `Metadata` (18 fields), `ListFolderResult` (`entries`/`cursor`/`has_more`),
  `SpaceUsage` (`used`/`allocation`). All keep `raw`; `from_json/1` accepts
  atom/string keys.
- **Error contract**: `Noizu.Dropbox.Error` exception — `status`/`body`/`reason`
  (`:http_error`|`:config`|transport|codec)/`summary`/`tag`.
- **API convention**: RPC = JSON POST to `{api_base}{ns}/{endpoint}`; content
  endpoints use `content_base` + Dropbox-API-Arg header. Returns
  `{:ok, struct|map}` | `{:error, %Error{}}`.

Full detail: [PROJ-SCHEMA.md](PROJ-SCHEMA.md).
