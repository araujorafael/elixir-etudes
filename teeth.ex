defmodule Teeth do
    @moduledoc """
    Étude 6-3: Lists of Lists
    envolving teeth...
    """

    @vsn 0.1

    @doc "Convenience function for providing a list of lists."
    @spec pocket_depths() :: list(list())

    def pocket_depths do
      [[0], [2,2,1,2,2,1], [3,1,2,3,2,3],
      [3,1,3,2,1,2], [3,2,3,2,2,1], [2,3,1,2,1,1],
      [3,1,3,2,3,2], [3,3,2,1,3,1], [4,3,3,2,3,3],
      [3,1,1,3,2,2], [4,3,4,3,2,3], [2,3,1,3,2,2],
      [1,2,1,1,3,2], [1,2,2,3,2,3], [1,3,2,1,3,3], [0],
      [3,2,3,1,1,2], [2,2,1,1,3,2], [2,1,1,1,1,2],
      [3,3,2,1,1,3], [3,1,3,2,3,2], [3,3,1,2,3,3],
      [1,2,2,3,3,3], [2,2,3,2,3,3], [2,2,2,4,3,4],
      [3,4,3,3,3,4], [1,1,2,3,1,2], [2,2,3,2,1,3],
      [3,4,2,4,4,3], [3,3,2,1,2,3], [2,2,2,2,3,3],
      [3,2,3,2,3,2]]
    end


    @doc """
    Given a list of list representing tooth pocket depths, return
    a list of the tooth numbers that require attention (any pocket
    depth greater than or equal to four).
    """

    @spec alert(list()) :: list()
    def alert(allTeeth) do
        alert(1, allTeeth, [])
    end

    @spec alert(number(), [], list()) :: list()
    defp alert(_count, [], attention) do
        Enum.reverse(attention)
    end

    @spec alert(number(), [number()], list()) :: list()
    defp alert(count, [teethMeasures | tail], attention) do
        cond do
            Stats.maximum(teethMeasures) >= 4 ->
                 alert(count + 1, tail, [count|attention])
            true ->
                 alert(count + 1, tail, attention)
        end
    end

end
