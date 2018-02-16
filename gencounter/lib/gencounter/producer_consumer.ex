defmodule Gencounter.ProducerConsumer do
  use GenStage

  require Integer


  def start_link do
    GenStage.start_link(__MODULE__, :state, name: __MODULE__)
  end

  def init(state) do
    #subscribe_to tells module needs to communicate with Gencounter.Producer
    {:producer_consumer, state, subscribe_to: [Gencounter.Producer]} #define process as producer_consumer
  end

  def handle_events(events, _from, state) do
    numbers = events
              |> Enum.filter(&Integer.is_even/1)

    {:noreply, numbers, state}
  end

end
