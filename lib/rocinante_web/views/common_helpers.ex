defmodule RocinanteWeb.CommonHelpers do
  def markdown(md_string) do
    md_string
    |> Earmark.as_html!()
    |> Phoenix.HTML.raw()
  end

  def truncate(string, length \\ 40, suffix \\ "...") do
    string
    |> String.slice(0, length)
    |> String.trim_trailing()
    |> Kernel.<>(suffix)
  end
end
