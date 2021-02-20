defmodule Router do
    use GenServer

    def start_link() do

        Worker.start_link(0)
        Worker.start_link(1)
        Worker.start_link(2)
        Worker.start_link(3)
        Worker.start_link(4)
        Worker.start_link(5)
        Worker.start_link(6)
        Worker.start_link(7)
        Worker.start_link(8)
        Worker.start_link(9)
        Worker.start_link(10)
        Worker.start_link(11)
        Worker.start_link(12)
        Worker.start_link(13)
        Worker.start_link(14)
        Worker.start_link(15)

        GenServer.start_link(__MODULE__, %{index: 0,worker_cardinal: 16}, name: :Router)
        
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
    
    worker = rem(state.index,state.worker_cardinal)
    #IO.inspect(worker)
    GenServer.cast(String.to_atom("Worker"<>Integer.to_string(worker)) ,{:receive,tweet})

    # Worker.print(tweet)
    new_state = %{index: state.index + 1, worker_cardinal: state.worker_cardinal}
    {:noreply, new_state}
    
  end


end