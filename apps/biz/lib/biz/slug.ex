defmodule Biz.Slug do

  @doc """
  Return a string in form of a slug for a given string.

  ## Examples

      iex> Biz.Slug.generate(" Hi # there ")
      "hi-there"

      iex> Biz.Slug.generate("Über den Wölkchen draußen im Tore")
      "ueber-den-woelkchen-draussen-im-tore"

      iex> Biz.Slug.generate("_Trimming_and___Removing_inside___")
      "trimming-and-removing-inside"

  """
  def generate(text), do: text |> Slugger.slugify_downcase

end