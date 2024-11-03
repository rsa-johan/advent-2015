defmodule Main do
  @spec main(String.t()) :: IO
  def main(filepath) do
    filepath
    |> File.read!()
    |> String.graphemes()
    |> Enum.map(fn x ->
      cond do
        x == "(" -> 1
        x == ")" -> -1
        true -> 0
      end
    end)
    |> IO.inspect()
    |> Enum.reduce(fn x, acc -> x + acc end)
    |> IO.inspect()
  end
end

Main.main("input-1.txt")
