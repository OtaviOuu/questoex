defmodule QuestoexWeb.PageController do
  use QuestoexWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
