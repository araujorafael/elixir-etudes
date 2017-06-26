defmodule Dijkstra do
    @moduledoc """
        recursion exercice
    """

    @doc """
       finding the greatest common divisor (GCD) of two integers.
    """

    @vsn 0.1

    @spec gcd(number(), number()) :: number()

    def gcd(m, n) when m == n do
        m
    end

    def gcd(m, n) when m > n do
        gcd(m - n, n)
    end

    def gcd(m, n) when m < n do
        gcd(m, n - m)
    end

    @spec condGcd(number(), number()) :: number()

    def condGcd(m, n) do
        cond do
            m == n -> m
            m > n -> condGcd(m - n, n)
            m < n -> condGcd(m, n - m)
        end
    end
end
