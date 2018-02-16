#responsibility is to receive demand, which is the number of events the consumer is willing to handle, and generate events. 
defmodule Gencounter.Producer do 
  use GenStage

  def start_link(init \\ 0) do
    GenStage.start_link(__MODULE__, init, name: __MODULE__)
  end

  #sets initial state inside of GensStage and labels module as producer
  def init(counter), do: {:producer, counter}   #GenStage relies on this function to know what module does

  #producer is implimented here
  def handle_demand(demand, state) do   #demand will be made from consumers, corresponds to int which gives
  #number of events that can be produced at one time. Defaults to 1000.
    events = Enum.to_list(state..state + demand - 1)  #create range of numbers in lazy way
    {:noreply, events, (state+demand)}
  end
end
