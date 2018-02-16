defmodule Chat.Server do    #Chat.Server is Module name
  use GenServer

  #client side ----------------------------------------------------------------------------------
  def start_link do #needed for GenServer
    #starts process, which returns {:ok, pid}
    #GenServer is synchronis, not concurrent, it's used to get things needed, like getting process state
    GenServer.start_link(__MODULE__, [])  #pass in module name (invoke GenServer), and initial state (empty [])
    #creates empty linked list
  end

  def get_msgs(pid) do    #gets state from process (pid)
    #GenServer calls process and sends :get_msgs to process, which fires handle_call function
    GenServer.call(pid, :get_msgs)  
  end


  def add_msg(pid, msg) do
    #cast is asynchronous, we don't actually need response in this case, don't need to know state
    GenServer.cast(pid, {:add_msg, msg})  #instead of call - pass in touple of :add_msg and msg to be passed in
  end

  #server side - aka callback function -----------------------------------------------------------
  def init(msgs) do   #init takes in state
  #gets fired after process is setup with start_link, setting the state inside the process
      {:ok, msgs}
  end

  #Takes in atom, identifies where message is pased from, 
  #uses msgs to see if state is changed. 1st msgs is response state and 2nd msg is new state
  def handle_call(:get_msgs, _from, msgs) do  
    {:reply, msgs, msgs}
  end

  #msg is new piece of state, msgs is all of the states
  def handle_cast({:add_msg, msg}, msgs) do
    {:noreply, [msg | msgs]}  #put msg in front of list (msgs)
  end


end
