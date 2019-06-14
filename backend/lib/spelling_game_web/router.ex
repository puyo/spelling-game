defmodule SpellingGameWeb.Router do
  use SpellingGameWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SpellingGameWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/words", WordController
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", SpellingGameWeb do
  #   pipe_through :api
  # end
end
