defmodule Geom do
  @moduledoc """
   Function that to calculate aritimetic functions from geometric shapes
  """
  @vsn 0.1

  @doc """
  Calculates the area of a rectangle, given the length and width.
  Returns the product of its arguments. The default value for
  both arguments is 1.
  """

  @spec area({atom(), number(), number()}) :: number()

  def area({shape, dim1, dim2}) do
    area(shape, dim1, dim2)
  end

  #individual handlers

  @spec area(atom(), number(), number()) :: number()

  defp area(:rectangle, width , height) when width > 0 and height > 0 do
    width * height
  end

  defp area(:triangle, base , height) when base > 0 and height > 0 do
    base * height / 2.0
  end

  defp area(:ellipse, a , b) when a > 0 and b > 0 do
    :math.pi() * a * b
  end

  defp area(_, _, _) do
	0
  end
end
