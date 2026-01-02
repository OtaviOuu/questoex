defmodule Questoex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      QuestoexWeb.Telemetry,
      Questoex.Repo,
      {DNSCluster, query: Application.get_env(:questoex, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Questoex.PubSub},
      # Start a worker by calling: Questoex.Worker.start_link(arg)
      # {Questoex.Worker, arg},
      # Start to serve requests, typically the last entry
      QuestoexWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Questoex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    QuestoexWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
