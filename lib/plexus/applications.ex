defmodule Plexus.Applications do
  alias Plexus.Repo
  alias Plexus.Schemas.Application

  @doc """
  Creates an application.
  """
  @spec create_application!(map()) :: Application.t()
  def create_application!(attrs \\ %{}) do
    %Application{}
    |> Application.changeset(attrs)
    |> Repo.insert!()
  end

  @doc """
  Creates an application.
  """
  @spec create_application(map()) :: {:ok, Application.t()} | {:error, Ecto.Changeset.t()}
  def create_application(attrs \\ %{}) do
    %Application{}
    |> Application.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Creates or updates an application if already exists.
  """
  @spec upsert_application!(map()) :: Application.t()
  def upsert_application!(%{id: application_id} = attrs) do
    application =
      with nil <- Repo.get(Application, application_id) do
        %Application{id: application_id}
      end

    application
    |> Application.changeset(attrs)
    |> Repo.insert_or_update!()
  end
end
