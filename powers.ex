defmodule Powers do
    import Kernel, except: [raise: 2, raise: 3]
    @moduledoc """

    """
    @vsn 0.1

    @doc """
       Calculates the nth_root of number with Newton-Raphson method algorithm
    """
    @spec nth_root(number(), number()) :: number()

    def nth_root(x, n) do
        nth_root(x, n, x / 2.0)
    end

    @spec nth_root(number(), number(), number()) :: number()

    defp nth_root(x, n, estimate) do
        IO.puts("Current guess is #{estimate}")
        f = raise(estimate, n) - x
        f_prime = n * raise(estimate, n - 1)
        next = estimate - f / f_prime
        change = abs(estimate - next)
        cond do
            change < 1.0e-8 -> next
            true -> nth_root(x, n, next)
        end
    end

    @doc """
        Takes parameters x and n and returns the value of x^n.
        When n == 0 return 1
        When n < 0 it calls raise/2 function (non-tail function)
        When n > 0 it calls raise/3 function with accumulator stategy (tail function)
    """

    @spec raise(number(), number()) :: number()

    def raise(_, 0) do
        1
    end

    def raise(x, n) when n < 0 do
        1 / raise(x, -n)
    end

    def raise(x, n) when n > 0 do
        raise(x, n, 1)
    end

    # Helper function with tail recursion

    @spec raise(number(), number(), number()) :: number()

    defp raise(_, 0, accumulator) do
        accumulator
    end

    defp raise(x, n, accumulator) do
        raise(x, n-1, x * accumulator)
    end
end
