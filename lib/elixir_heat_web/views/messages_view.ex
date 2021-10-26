defmodule ElixirHeatWeb.MessagesView do
  use ElixirHeatWeb, :view

  def render("create.json", %{message: message}) do
    %{
      status: "Message created!",
      message: message
    }
  end
end
