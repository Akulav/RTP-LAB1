defmodule Connection do
  
  def recv() do
    receive do
      tweet-> Router.route(tweet)
    end
    recv()
  end

  def connect() do

    {:ok, _pid} = EventsourceEx.new("localhost:4000/tweets/2", stream_to: self())
    {:ok, _pid} = EventsourceEx.new("localhost:4000/tweets/1", stream_to: self())

    recv()
  end
end
