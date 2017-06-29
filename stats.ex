defmodule Stats do
    @moduledoc """
        Étude 6-1: Recursive Iteration through a List
    """

    @doc """
        Return the minimum number inside a list
    """

    @spec minimum(list()) :: number()

    def minimum(list) do
        [head|tail] = list
        minimum(tail, head)
    end

    # When there are no more numbers, return the result.

    @spec minimum([number()], number()) :: number()

    defp minimum([], result) do
        result
    end

    # if number is grater then head call minimum/2 function passing the tail and head

    @spec minimum([number()], number()) :: number()

    defp minimum([head|tail], number) when head > number do
        minimum(tail, number)
    end

    # if number is grater then head call minimum/2 function passing the tail and number

    @spec minimum([number()], number()) :: number()

    defp minimum([head|tail], _number) do
        minimum(tail, head)
    end

    @doc """
        Return the maximum value inside array
    """

    @spec maximum(list()) :: number

    def maximum(list) do
        [head|tail] = list
        maximum(tail, head)
    end

    @spec maximum([number()], number()) :: number()

    defp maximum([], max) do
        max
    end

    @spec maximum([number()], number()) :: number()

    defp maximum([head|tail], max) when head < max do
        maximum(tail, max)
    end

    @spec maximum([number()], number()) :: number()

    defp maximum([head|tail], _max) do
        maximum(tail, head)
    end

    @doc """
        Return the rage of list [maxValue, minValue]
    """

    @spec range(list()) :: [number()]

    def range(list) do
        [minimum(list), maximum(list)]
    end
end
