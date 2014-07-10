defmodule Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def conf do
    parse_url "ecto://marian@localhost/micro_comms_api"
  end
end

defmodule Comment do
  use Ecto.Model

  schema "comments" do
    field :user_name, :string
    field :body, :string
    field :created_at, :time
  end
end


defmodule MicroCommsApi.Controllers.Pages do
  use Phoenix.Controller

  def init_db do
    import Supervisor.Spec

    tree = [worker(Repo, [])]
    opts = [name: Simple.Sup, strategy: :one_for_one]
    Supervisor.start_link(tree, opts)
  end

  def index(conn, _params) do
    init_db

    import Ecto.Query

    query = from w in Comment, limit: 10
    comms = Repo.all(query)
    comment_body = Repo.get(Comment, 2)

    render conn, "index", message: comment_body
    # render conn, "index", message: comms
    # render conn, "index", comments: Repo.all(query)
  end
end
