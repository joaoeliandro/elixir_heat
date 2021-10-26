defmodule ElixirHeat.Tags.Count do
  alias ElixirHeat.Messages.Get, as: MessagesGet

  def call do
    MessagesGet.today_messages()
    |> Task.async_stream(fn message -> count_words(message.message) end)
    |> Enum.reduce(%{}, fn elem, acc -> sum_values(elem, acc) end)
  end

  defp count_words(message) do
    message
    |> String.split()
    |> Enum.frequencies()
  end

  defp sum_values({:ok, map}, acc) do
    Map.merge(map, acc, fn _key, value, value2 -> value + value2 end)
  end
end
