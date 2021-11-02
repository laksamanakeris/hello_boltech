defmodule BoltechClient do
  use Tesla
  plug(Tesla.Middleware.BaseUrl, "https://evening-brook-34199.herokuapp.com")
  plug(Tesla.Middleware.JSON)
  plug(Tesla.Middleware.Logger)
  plug(Tesla.Middleware.Timeout, timeout: 2_000_00)

  def get_data() do
    get("/application")
  end

  def post_data(multipart_data) do
    post("/application", multipart_data)
  end
end
