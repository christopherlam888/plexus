defmodule PlexusWeb.API.V1.ApplicationView do
  use PlexusWeb, :view

  alias PlexusWeb.API.V1.ApplicationView

  def render("index.json", %{page: page}) do
    data = render_many(page.entries, ApplicationView, "application.json")

    %{
      data: data,
      page_number: page.page_number,
      page_size: page.page_size,
      total_entries: page.total_entries,
      total_pages: page.total_pages
    }
  end

  def render("show.json", %{application: application}) do
    data = render_one(application, ApplicationView, "application.json")
    %{data: data}
  end

  def render("application.json", %{application: application}) do
    %{
      id: application.id,
      name: application.name,
      package: application.package
    }
  end
end
