defmodule Connection do
  
  def recv() do
    receive do
      tweet-> Router.route(tweet)
    end
    recv()
  end

  def connect() do
    # pid = Process.start_link(recv, [])
    pid = spawn_link(__MODULE__, :recv, [])
    IO.inspect(pid)
    {:ok, pid1} = EventsourceEx.new("localhost:4000/tweets/2", stream_to: pid)
    IO.inspect(pid1)
    {:ok, pid2} = EventsourceEx.new("localhost:4000/tweets/1", stream_to: pid)
    IO.inspect(pid2)
    {:ok, self()}
    # recv()
  end
end
