defmodule Chat.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])   #[] is initial state of supervisor
  end

  def init(_) do
    children = [
      worker(Chat.Server, [])   #function called worker, defines Chat.Server as worker and passes in initial state
    ]
    
    #if one process dies, doesn't affect others, spins up dead process
    #also :one_for_all, a couple more
    supervise(children, stratgy: :one_for_one)    #to make supervisor look at process
  end
end
