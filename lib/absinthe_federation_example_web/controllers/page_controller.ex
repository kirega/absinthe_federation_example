defmodule AbsintheFederationExampleWeb.PageController do
  use AbsintheFederationExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
