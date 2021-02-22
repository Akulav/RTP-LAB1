defmodule Router do
    use GenServer

    def start_link() do

        # Worker.start_link(0)
        # Worker.start_link(1)
        # Worker.start_link(2)
        # Worker.start_link(3)
        
        GenServer.start_link(__MODULE__, %{index: 0,worker_cardinal: 4}, name: :Router)   

    end    



def route(tweet) do

    GenServer.cast(:Router,{:send,tweet})

end


def init(state) do

    {:ok, state}

  end


  def handle_cast({:send, tweet}, state) do
    
    worker = rem(state.index,state.worker_cardinal)
    GenServer.cast(String.to_atom("Worker"<>Integer.to_string(worker)) ,{:receive,tweet})

    new_state = %{index: state.index + 1, worker_cardinal: state.worker_cardinal}
    {:noreply, new_state}
    
  end


end