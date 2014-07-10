defmodule MicroCommsApi.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :micro_comms_api

  get "/", MicroCommsApi.Controllers.Pages, :index, as: :page
end
