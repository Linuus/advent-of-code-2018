defmodule AdventOfCode.Day01.Part02 do
  def run do
    "input.txt"
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Stream.cycle()
    |> Enum.reduce_while({0, MapSet.new()}, &reducer/2)
    |> IO.inspect(label: "Result")
  end

  defp reducer(number, {sum, set}) do
    total = number + sum
    case MapSet.member?(set, total) do
      true -> {:halt, total}
      false -> {:cont, {total, MapSet.put(set, total)}}
    end
  end
end

AdventOfCode.Day01.Part02.run()
