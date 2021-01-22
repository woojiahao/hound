defmodule Hound do
  use Application

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  @spec start(any, any) :: :ignore | {:error, any} | {:ok, pid}
  @doc false
  def start(_type, _args) do
    IO.puts "Starting"
    Hound.Supervisor.start_link()
  end

  @doc false
  def driver_info do
    Hound.ConnectionServer.driver_info()
  end

  @doc false
  def configs do
    Hound.ConnectionServer.configs()
  end

  @doc "See `Hound.Helpers.Session.start_session/1`"
  # defdelegate defines a function that delegates to another module
  # Used to extend current module's public API
  defdelegate start_session, to: Hound.Helpers.Session
  defdelegate start_session(opts), to: Hound.Helpers.Session

  @doc "See `Hound.Helpers.Session.end_session/1`"
  defdelegate end_session, to: Hound.Helpers.Session
  defdelegate end_session(pid), to: Hound.Helpers.Session

  @doc false
  defdelegate current_session_id, to: Hound.Helpers.Session
end
