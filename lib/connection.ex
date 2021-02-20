defmodule Connection do
  @moduledoc """
  Documentation for `Lab1`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Lab1.hello()
      :world

  """

  def connect() do
    {:ok, _pid} = EventsourceEx.new("localhost:4000/tweets/1", stream_to: self())

    flush
  end
end
