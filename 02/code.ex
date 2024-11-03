defmodule Main do
  @spec main(String.t()) :: IO
  def main(filepath) do
    filepath
    |> File.read!()
    |> String.trim()
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.reduce_while(0, fn {x, idx}, acc ->
      IO.puts("enter at #{idx} = #{x}, acc is #{acc}")

      cond do
        acc == -1 ->
          {:halt, idx}

        x == ")" ->
          {:cont, acc - 1}

        x == "(" ->
          {:cont, acc + 1}

        true ->
          {:cont, acc}
      end
    end)
    |> IO.inspect()
  end
end

Main.main("input.txt")
