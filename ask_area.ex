defmodule AskArea do
    @moduledoc """
        Étude 5-1: Validating Input
        In this étude, you will write a module named ask_area,
        which prompts you for a shape and its dimensions,
        and then returns the area by calling Geom.area/1, which you wrote in Étude 4-1.
        Text user interface to calculate area from choosen geometric forms

        depends geom.ex module to work.
    """

    @vsn 0.2

    @doc """
        the main functon who calls the heper functions
    """
    @spec area() :: number()
    def area() do
        input = IO.gets("R)ectangle, T)riangle, or E)llipse: ")
        shape = char_to_shape(String.first(input))
        {d1, d2} = case shape do
            :rectangle -> get_dimenssion("width", "height")
            :triangle -> get_dimenssion("base", "height")
            :ellipse -> get_dimenssion("major radius", "minor radius")
            :unknown -> {"error", 0}
        end

        calculate(shape, d1, d2)
    end

    #Converts the text return to atom return

    @spec char_to_shape(String.t()) :: atom

    defp char_to_shape(character) do
        cond do
          String.upcase(character) == "R" -> :rectangle
          String.upcase(character) == "T" -> :triangle
          String.upcase(character) == "E" -> :ellipse
          true -> :unknown
        end
    end

    # Get the number given by user

    @spec get_number(String.t()) :: number()

    defp get_number(name) do
        input = IO.gets("Enter #{name} > ")
        String.to_integer(String.strip(input))
    end

    # Get all dimenssions that must be givem by user calling get_number/1 function

    @spec get_dimenssion(String.t(), String.t()) :: tuple()

    defp get_dimenssion(d1Name, d2Name) do
        d1 = get_number(d1Name)
        d2 = get_number(d2Name)
        {d1, d2}
    end

    # return callas Geom.area/1 to calculate area from especific geometric figure

    @spec calculate(atom(), number(), number()) :: number()

    defp calculate(shape, d1, d2) do
        Geom.area({shape, d1, d2})
    end

end
