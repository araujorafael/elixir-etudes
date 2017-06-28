defmodule Dates do
    @moduledoc """
        Functions for manipulating calendar dates.

        from *Études for Elixir*, O'Reilly Media, Inc., 2013.
        Copyright 2013 by J. David Eisenberg.
    """
    @vsn 0.3

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

    @doc """
        Étude 6-2
        Return de sum of all the days has passed to given date on string format "yyyy-mm-dd"
    """

    @spec julian(Strng.t()) :: number()

    def julian(date) do
        #transforma date in a list
        [year, month, day] = date_parts(date)
        daysPerMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

        total = month_total(month, daysPerMonth, 0) + day

        cond do
            is_leap_year(year) && month > 2 -> total + 1
            true -> total
        end

    end

    # Recursive funtion that calculates the sum

    defp month_total(1, _daysPerMonth, total) do
        total
    end

    @spec month_total(number(), list([number()]), number()) :: number()

    defp month_total(monthNumber, [monthDays|daysPerMonth], total) do
        month_total(monthNumber - 1, daysPerMonth, total + monthDays)
    end

    # Verify if given year is leap year

    defp is_leap_year(year) do
      (rem(year,4) == 0 and rem(year,100) != 0)
      or (rem(year, 400) == 0)
    end
end
