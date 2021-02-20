defmodule Router do
    use GenServer

    def start_link() do

        Worker.start_link(0)
        GenServer.start_link(__MODULE__, %{index: 0,worker_cardinal: 4}, name: :Router)
        
    end    



def route(tweet) do
    # IO.inspect("here2")
    GenServer.cast(:Router,{:send,tweet})
    #Worker.print(tweet)
end

# @impl true
def init(state) do
    {:ok, state}
  end

#   @impl true
  def handle_cast({:send, tweet}, state) do
    
    GenServer.cast(:Worker ,{:receive,tweet})

    # Worker.print(tweet)
    new_state = %{index: state.index + 1, worker_cardinal: state.worker_cardinal}
    {:noreply, new_state}
    
  end


end