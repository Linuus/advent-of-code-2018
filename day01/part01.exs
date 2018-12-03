defmodule AdventOfCode.Day01.Part01 do
  def run do
    "input.txt"
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.sum()
    |> IO.inspect(label: "Result")
  end
end

AdventOfCode.Day01.Part01.run()
