defmodule AdventOfCode.Day02.Part02 do
  def run do
    input =
      "input.txt"
      |> File.stream!()
      |> Stream.map(&String.trim/1)
      |> Enum.to_list()

    [str1, str2] =
      for x <- input,
        y <- input,
        x != y,
        String.jaro_distance(x, y) > 0.95,
        do: y

    str1
    |> String.myers_difference(str2)
    |> Enum.reduce("", fn
      ({:eq, str}, acc)-> acc <> str
      (_, acc) -> acc
    end)
    |> IO.inspect(label: "Result")
  end
end

AdventOfCode.Day02.Part02.run()
