defmodule FawkesApiWeb.Router do
  use FawkesApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/fawkes", FawkesApiWeb do
    pipe_through :api
  end
end
