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

  @doc """
  Add a slug to the params based on the from_field

  ## Examples
      
      iex> Biz.Slug.merge(%{"name" => "A B"})
      %{"name" => "A B", "slug" => "a-b"}

      iex> Biz.Slug.merge(%{"title" => "A B"}, "title")
      %{"title" => "A B", "slug" => "a-b"}

      iex> Biz.Slug.merge(%{"title" => "A B"}, "title", "title_slug")
      %{"title" => "A B", "title_slug" => "a-b"}
      
      iex> Biz.Slug.merge(%{"age" => 18})
      %{"age" => 18}

      iex> Biz.Slug.merge(%{"name" => "A B", "slug" => "overwrite"})
      %{"name" => "A B", "slug" => "overwrite"}

  """  
  def merge(params), do: merge(params, "name", "slug")
  def merge(params, from_field), do: merge(params, from_field, "slug")
  def merge(params, from_field, to_field) do
    if (Map.has_key?(params, to_field)) do
      params
    else
      case params[from_field] do
        nil -> params
        from_val -> Map.put(params, to_field, generate(from_val))
      end
    end
  end

end