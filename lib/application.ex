defmodule Noizu.Dropbox.Application do
  @moduledoc """
  〚📦:7274fe3f-03e2-58ba-900f-645ee6a67c73〛 Noizu.Dropbox.Application :: OTP application; supervises the sole `Noizu.Dropbox.Finch` pool.
  """
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Finch, name: Noizu.Dropbox.Finch}
    ]

    opts = [strategy: :one_for_one, name: Noizu.Dropbox.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
