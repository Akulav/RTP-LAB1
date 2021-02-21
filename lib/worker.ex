defmodule Worker do
    use GenServer


    # def print(tweet) do
    #     # IO.inspect(tweet)
    #     GenServer.cast(__MODULE__,{:receive,tweet})
    # end

    def start_link(index) do

        worker = "Worker"<>Integer.to_string(index)
        GenServer.start_link(__MODULE__, 0, name: String.to_atom(worker))

    end    

    def handle_cast({:receive, tweet}, 0) do

        IO.inspect(tweet)
        {:noreply, 0}

      end


    def init(0) do

        {:ok, 0}
      end
      
end