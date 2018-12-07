defmodule AdventOfCode.Day02.Part01 do
  def run do
    {twos, threes} =
      "input.txt"
      |> File.stream!()
      |> Stream.map(&String.trim/1)
      |> Stream.map(&String.graphemes/1)
      |> Stream.map(fn(el)->
        el
        |> Enum.group_by(&(&1))
        |> Enum.filter(fn({_, v})-> length(v) != 1 end)
        |> Enum.uniq_by(fn({_, v})-> length(v) end)
      end)
      |> Enum.reduce({0, 0}, fn
        ([{_, [_, _]}], {a, b}) -> {a+1, b}
        ([{_, [_, _, _]}], {a, b}) -> {a, b+1}
        (_, {a, b}) -> {a+1, b+1}
      end)

    IO.inspect(twos * threes, label: "Result")
  end
end

AdventOfCode.Day02.Part01.run()
