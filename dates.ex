defmodule Dates do
    @moduledoc """
        Étude 5-3: Using String.split
        Write a module named Dates that contains a function date_parts/1,
        which takes a string in ISO date format ("yyyy-mm-dd") and returns
        a list of integers in the form [yyyy, mm, dd].
        This function does not need to do any error checking.
    """

    @doc """
        parse a given string date on format yyyy-mm-dd and return a list with
        date numbers
    """

    @spec date_parts(String.t()) :: list()
    def date_parts(str_date) do
        [str_y, str_m, str_d] = String.split(str_date, "-", trim: true)
        [String.to_integer(str_y),
           String.to_integer(str_m),
           String.to_integer(str_d)
        ]
    end
end
