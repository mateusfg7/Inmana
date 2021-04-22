defmodule Inmana.Supplies.Scheduler do
  use GenServer

  alias Inmana.Supplies.ExpirationNotfication

  # CLIENT
  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  # SERVER
  @impl true
  def init(state \\ %{}) do
    schedule_notification()
    {:ok, state}
  end

  @impl true
  def handle_info(:generate, state) do
    ExpirationNotfication.send()

    schedule_notification()

    {:noreply, state}
  end

  defp schedule_notification do
    # for 1 week, use 1000*10*60*60*24*7
    Process.send_after(self(), :generate, 1000 * 10)
  end
end
